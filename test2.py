from flask import Flask, redirect , url_for, request, render_template
app = Flask(__name__)

@app.route('/')
def root():
    return " Hello you are in the root folder!"

@app.route ("/hello")
def hello():
    return " Hello Napier!!! :D"


# to use that properties be aware to import the libraries at the top!!
@app.route ("/bye/")
def goodbye():
    return redirect(url_for('root'))


# get variables from URL
@app.route("/sayhello/<name>", methods=['GET','POST'])
def sayHello(name):
    return "Hello, <strong>%s</strong>" % name


# get some variables from URL
@app.route("/add/<int:first>/<int:second>", methods=['GET','POST'])
def add(first, second):
    return str(first+second)

# Example resquests!
@app.route ('/login', methods=['GET','POST'])
def login():
    print (request.method, request.path, request.form)
    if request.method=='POST':
        print (request.form)
        name=request.form['name']
        return "Hello %s" % name
    
    else:
        page = '''
            <html><body>
                <form action ="" method ="POST" name="form">
                    <label for="name"> Name:</ label >
                    <input type="text" name  = "name" id ="name">
                    <input type="submit" name="submit " id ="submit">
                </form>
            </body></html>
        '''
        return page

# passing GET arguments through URL - gettest?var=Javi
@app.route("/gettest")
def getTest():
    var = request.args.get('var','')
    if var=='':
        return "no parameters supplied"
    else:
        return "Argument provided >  %s" % var


# display the uploaded file
@app.route ("/display")
def display ():
    return '<img src =" ' + url_for ('static', filename ='uploads/file.png')+'"/> '


# sue a template!
@app.route("/templatehello/<name>")
def templateHello(name=None):
    user = {'name': name}
    return render_template('hello.html', user=user)


# use a template and JINJA!!!!!
@app.route("/helloconditional")
@app.route("/helloconditional/<name>")
def helloConditional(name=None):
    return render_template('conditional.html', name=name)


# Upload a file...
@app.route("/uploadfile", methods=['GET','POST'])
def upload():
    if request.method=='POST':
        file=request.files['datafile']
        file.save('static/uploads/file.png')
        return "File Uploaded..."
    else:
        page='''
            <html>
            <body>
                <form action="" method="POST" name="form" enctype="multipart/form-data">
                    <input type ="file" name ="datafile" />
                    <input type ="submit" name ="submit" id ="submit"/>
                </form >
            </body >
            </html >
        '''
        return page


@app.route("/loopexample")
def loop():
    names = ['Javi','Patrick','Richard','Peter']
    return render_template('loop.html', names=names)



@app . route ('/inherits')
def inherits ():
    return render_template('base.html')

@app.route ('/inherits/one/')
def inherits_one ():
    return render_template('inheritsone.html')

@app . route ('/inherits/two/')
def inherits_two ():
    return render_template('inheritstwo.html')








# add a static image...
@app.route('/img')
def static_example_img():
    start='<img src="'
    url = url_for('static', filename='images/vmask.jpg')
    # url = '/static/images/vmask.jpg'
    end = '" >'
    return start+url+end, 200

# with this get the control of the error!!
@app.errorhandler(404)
def page_not_found(error):
    return "Error 404. Sorry, but page not found!", 404


# print (request.method, request.path, request.form)

# SEssion connections on workbook chapter 8
# Testing and logging too

# css and button example!!
@app.route('/cssexample')
def cssexample():
    return render_template('cssexample.html'),200








if __name__ == "__main__":
    app.run( host ='0.0.0.0 ', debug = True )