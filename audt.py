from flask import Flask, redirect , url_for, request, render_template
from urllib.request import urlopen
from urllib.error import HTTPError, URLError
from datetime import datetime
import urllib3, time, os, json
import tldextract

app = Flask(__name__)

@app.route('/')
def root():
        return render_template('index.html')

@app.route('/report', methods=['POST'])
def report():

        # print (request.method, request.path, request.form)
        if request.method=='POST':
                #Check if request is a real URL
                try:
                        urlRequested = request.form['url']
                        urlopen(urlRequested)
                        
                        try:
                                http = urllib3.PoolManager()
                                r = http.request('GET', urlRequested)
                                # print(r.status)
                        
                                # getting filename
                                trimmedUrl = tldextract.extract(urlRequested)
                                timestamp = time.strftime('%d%m%Y-%H:%M')
                                filename =  timestamp + "-" + trimmedUrl.domain                               

                                os.system("lighthouse-ci --silent " + urlRequested + " --report=static/reports --jsonReport --filename=" + filename + ".html")
                                
                                # get rid of .html
                                os.system("rm static/reports/" + filename + ".html")

                                with open("static/reports/" + filename + ".json") as json_file:
                                        data = json.load(json_file)

                                        # Create a class to pass the data to jinja   
                                        class reportClass:
                                                # web size!
                                                url = urlRequested
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

                                return render_template('report.html', report = report)
        
                        except:
                                raise

                except ValueError:
                        urlError = "The URL is wrong... Please try again"
                        return render_template('index.html', urlError = urlError)
                
                except (HTTPError, URLError) as err:
                        print(err)
                        urlError = err
                        return render_template('index.html', urlError = urlError)
                
        else:
                return "Error POST..."

@app.route('/test', methods=['GET', 'POST'])
def test():
        
        return "whatever..."



@app.errorhandler(404)
def page_not_found(error):
    return "Error 404. Sorry, but page not found!", 404

if __name__ == "__main__":
    app.run( host ='0.0.0.0 ', debug = True )