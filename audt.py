from flask import Flask, redirect , url_for, request, render_template
app = Flask(__name__)

@app.route('/')
def root():
        return render_template('index.html')

@app.route('/report')
def report():
        return render_template('report.html')

@app.errorhandler(404)
def page_not_found(error):
    return "Error 404. Sorry, but page not found!", 404

if __name__ == "__main__":
    app.run( host ='0.0.0.0 ', debug = True )