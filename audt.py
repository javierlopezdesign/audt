from flask import Flask, redirect , url_for, request, render_template
import subprocess
import urllib3, time, os, json, time, os.path, urllib
import tldextract
import urllib.parse
from urllib.request import urlopen
from urllib.error import HTTPError, URLError
from datetime import datetime
from urllib.parse import unquote
import sqlite3
import sqlite3 as sql

app = Flask(__name__)

conn = sqlite3.connect('database.db')

# Create DB
db_file = "database.db"
# print(os.path.isfile(db_file))

if os.path.isfile(db_file) == False:
        # print(os.path.isfile(db_file))
        conn.execute('CREATE TABLE audits (id INTEGER primary key AUTOINCREMENT, url TEXT, datetime TEXT, json TEXT)')
        print ("Table created successfully")
        
dbConn = sql.connect("database.db", check_same_thread=False)

@app.route('/')
def root():
        return render_template('index.html')

@app.route('/processurl', methods=['GET','POST'])
def processurl(data=None):
                
        if request.method=='POST': 
                try:     
                        urlRequested = request.form['url']
                        urlopen(urlRequested)
                        
                        try:
                                http = urllib3.PoolManager()
                                # r = http.request('GET', urlRequested)         
                
                                # getting filename
                                timestamp = time.strftime('%d-%m-%Y-%H:%M')

                                class urlRequestClass:
                                        # id will be overwritted.
                                        id = 999
                                        url = urlRequested
                                        path = "static/reports" 
                                        trimmedUrl = tldextract.extract(urlRequested)
                                        filename = timestamp + "-" + trimmedUrl.domain                        

                                urlchecked = urlRequestClass()

                                filename = urlchecked.filename + ".json"

                                # SAVE TO DB
                                with sql.connect("database.db") as con:
                                        cur = con.cursor()
                                        cur.execute("INSERT INTO audits (url,datetime,json) VALUES (?,?,?)",(urlchecked.url,timestamp,filename) )
                                        lastId = cur.lastrowid
                                        cur.close()

                                command = "lighthouse-ci --silent " + urlchecked.url + " --report=" + urlchecked.path + " --jsonReport --filename=" + urlchecked.filename + ".html"
                                process = os.popen(command)
                                
                                urlchecked.id = lastId

                                return render_template('loading.html', urlrequested = urlchecked)
                        except:
                                urlError = "The URL is wrong... Missing 'http://' or 'https://'"
                                return render_template('index.html', urlError = urlError)


                except ValueError:
                        urlError = "The URL is wrong... Missing 'http://' or 'https://'"
                        return render_template('index.html', urlError = urlError)

                except (HTTPError, URLError) as err:
                        # print(err)
                        urlError = "Url error, please check domain."
                        return render_template('index.html', urlError = urlError)

        else:
                urlId = request.args.get("data")
                
                # get url and filename requested
                dbConn.row_factory = sql.Row
                cur = dbConn.cursor()
                sqlquery = "SELECT * FROM audits WHERE id =" + urlId
                cur.execute(sqlquery)
                rows = cur.fetchall()
                url = rows[0]['url']
                filename = rows[0]['json']

                fileExists = os.path.isfile("static/reports/" + filename)
                if fileExists == True:
                        print("___READY TO READ!!!!")


                #         return render_template("list.html",rows = rows)
                        return redirect(url_for('report', report = urlId))
                else:
                #       keep loading...
                        print("not found...")
                        return render_template('loading.html', urlrequested = urlId)


@app.route('/report', methods=['GET','POST'])
def report():
        urlId = request.args.get("report")
        
        # get url and filename requested
        dbConn.row_factory = sql.Row
        cur = dbConn.cursor()
        sqlquery = "SELECT * FROM audits WHERE id =" + urlId
        cur.execute(sqlquery)
        rows = cur.fetchall()
        url = rows[0]['url']
        filename = rows[0]['json']
        path = "static/reports/"

        # get rid of .html

        filetoRemove = filename[:-4] + "html"
        
        if os.path.isfile(path + filetoRemove) == True:
                os.system("rm " + path + filetoRemove )


        with open(path + filename) as json_file:
                data = json.load(json_file)

                # Create a class to pass the data to jinja   
                class reportClass:

                        # web size!
                        url = rows[0]['url']
                        date =  rows[0]['datetime']
                        webSizeBytes = data['audits']['diagnostics']['details']['items'][0]['totalByteWeight']
                        webSizeMB = round(webSizeBytes/pow(1024,2),2)
                
                        # dead links
                        deadlinks = data['audits']['crawlable-anchors']['score']
                        linksAmount = len(data['audits']['crawlable-anchors']['details']['items'])

                        # ALT images!! 0 is some links missin
                        altScore = data['audits']['image-alt']['score']
                        altScoreAmount = len(data['audits']['image-alt']['details']['items'])

                        # Performance
                        performanceScore = round(data['categories']['performance']['score']*100)
                        
                        # accesibility
                        accessibilityScore = round(data['categories']['accessibility']['score']*100)

                        # practices
                        practicesScore = round(data['categories']['best-practices']['score']*100)
                        
                        # seo
                        seoScore = round(data['categories']['seo']['score']*100)

                # apply the class to a variable
                report = reportClass()

        dbConn.row_factory = sql.Row
        cur = dbConn.cursor()
        sqlquery = "SELECT * FROM audits WHERE url = '" + report.url + "' ORDER BY id DESC limit 2"
        cur.execute(sqlquery)
        rows = cur.fetchall()
        if len(rows)<=1:
                # reportPrev = ('noaudits')
                print("NO PREVIOUS AUDIT!!!")
                
                # print(len(rows))

                class reportClass:
                        # flag to know if it was found
                        exists=0
                        # web size!
                        webSizeMB = 0
                
                        # dead links
                        deadlinks = 0
                        linksAmount = 0

                        # ALT images!! 0 is some links missin
                        altScore = 0
                        altScoreAmount = 0

                        # Performance
                        performanceScore = 0
                        
                        # accesibility
                        accessibilityScore = 0

                        # practices
                        practicesScore = 0
                        
                        # seo
                        seoScore = 0
                reportPrev = reportClass()

        else:
                filename = rows[1]['json']

                with open(path + filename) as json_file:
                        data = json.load(json_file)

                        class reportClass:
                        
                        # Last one...
                                # flag to know if it was found
                                exists=1
                                # web size!
                                # url = rows[0]['url']
                                webSizeBytes = data['audits']['diagnostics']['details']['items'][0]['totalByteWeight']
                                webSizeMB = round(webSizeBytes/pow(1024,2),2)
                        
                                # dead links
                                deadlinks = data['audits']['crawlable-anchors']['score']
                                linksAmount = len(data['audits']['crawlable-anchors']['details']['items'])

                                # ALT images!! 0 is some links missin
                                altScore = data['audits']['image-alt']['score']
                                altScoreAmount = len(data['audits']['image-alt']['details']['items'])

                                # Performance
                                performanceScore = round(data['categories']['performance']['score']*100)
                                
                                # accesibility
                                accessibilityScore = round(data['categories']['accessibility']['score']*100)

                                # practices
                                practicesScore = round(data['categories']['best-practices']['score']*100)
                                
                                # seo
                                seoScore = round(data['categories']['seo']['score']*100)
                        reportPrev = reportClass()

                # return render_template('report.html', report = report , reportPrev = reportPrev)
        return render_template('report.html', report = report ,reportPrev = reportPrev)

@app.route('/list', methods=['GET', 'POST'])
def test():

        # test db
        # con = sql.connect("database.db")
        dbConn.row_factory = sql.Row
        
        cur = dbConn.cursor()
        cur.execute("select * from audits ORDER BY id DESC")
        
        rows = cur.fetchall(); 
        return render_template("list.html",rows = rows)

@app.errorhandler(404)
def page_not_found(error):
    return "Error 404. Sorry, but page not found!", 404

if __name__ == "__main__":
    app.run( host ='0.0.0.0 ', debug = True )