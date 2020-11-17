from flask import Flask, redirect , url_for, request, render_template
from urllib.request import urlopen
from urllib.error import HTTPError, URLError
from datetime import datetime
import urllib3, time, os

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
                        
                                # launch lighthouse
                                # getting filename
                                trimmedUrl = urlRequested.split("://")[1]
                                timestamp = time.strftime('%d%m%Y-%H:%M')
                                filename =  trimmedUrl + "-" + timestamp

                                # print(filename)

                                os.system("lighthouse-ci " + urlRequested + " -s --report=static/reports --filename=" + filename + " --jsonReport")


                                return render_template('report.html', url = urlRequested)
        
                        # except urllib3.exceptions.MaxRetryError:
                        #         urlError = "The URL response w=has too many errors."
                        #         return render_template('index.html', urlError = urlError)
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
        timestamp = time.strftime('%d%m%Y-%H:%M') 
        return timestamp



@app.errorhandler(404)
def page_not_found(error):
    return "Error 404. Sorry, but page not found!", 404

if __name__ == "__main__":
    app.run( host ='0.0.0.0 ', debug = True )