from fileinput import filename
from flask import Flask, app, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy 
from flask_mail import Mail
from werkzeug.utils import secure_filename
from datetime import datetime
import os
import math
import json
import socket

socket.getaddrinfo('localhost', 8080)


with open('config.json','r') as c:
    params = json.load(c)["params"]
local_server = True

app = Flask(__name__)
app.secret_key = 'super-secret-key'


app.config['UPLOAD_FOLDER'] = params['upload_location']

app.config.update(
    MAIL_SERVER = "smtp.gmail.com",
    MAIL_PORT = "465",
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)
mail = Mail(app)

if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']


db = SQLAlchemy(app)

class Contacts(db.Model):
    # s_no. name, email, phone_no, message, date
    s_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),  nullable=False)
    email = db.Column(db.String(20),  nullable=False)
    phone_no = db.Column(db.String(12),  nullable=False)
    message = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(12),  nullable=True)

class Posts(db.Model):
    # s_no. name, email, phone_no, message, date
    s_no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80),  nullable=False)
    tagline = db.Column(db.String(80),  nullable=False)
    slug = db.Column(db.String(25),  nullable=False)
    content = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(12),  nullable=True)
    img_file = db.Column(db.String(12),  nullable=True)


@app.route('/')
def Home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))

    # [0:params['no_of_posts']]
    page = request.args.get('page')
    if (not str(page).isnumeric() ):
        page = 1

    page = int(page)

    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]

    # Pagination Logic
    #First
    if (page==1):
        prev = "#"
        next = "/?page=" + str(page+1)
        # prev page = NAH
        # next page = page +1

    #middle page
        # prev page = page - 1
        # next page = page + 1

    #last page
    elif (page==last):
        prev = "/?page=" + str(page-1)
        next = "#"
        # prev page = page - 1
        # next page = NAh

    else:
        prev = "/?page=" + str(page-1)
        next = "/?page=" + str(page+1)

    return render_template("index.html", params = params, posts = posts, prev=prev, next=next)


@app.route('/about')
def About():
    return render_template("about.html", params = params)

@app.route('/dashboard',methods = ['GET', 'POST'])
def dashboard():

    if ('user' in session and session['user'] == params["admin_user"]):
        posts = Posts.query.all()
        return render_template('dashboard.html', params = params, posts=posts)
        


    if request.method == 'POST':
        # REDIRECT TO ADMIN PAGE
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params["admin_user"] and userpass == params["admin_password"]):
            # Set the session varaible
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params = params, posts=posts)
        
    return render_template("sign_in.html", params = params)


@app.route('/edit/<string:s_no>', methods = ['GET', 'POST'])
def edit(s_no):
    if ('user' in session and session['user'] == params["admin_user"]):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if s_no=='0':
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            
            else:
                post = Posts.query.filter_by(s_no=s_no).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+s_no)

        post = Posts.query.filter_by(s_no=s_no).first()
        return render_template('edit.html', params=params, s_no=s_no)


@app.route('/post/<string:post_slug>', methods = ['GET'])
def Post_route(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
    return render_template("post.html", params = params, post = post)

@app.route("/uploader" , methods=['GET', 'POST'])
def uploader():
    if "user" in session and session['user']==params['admin_user']:
        if request.method=='POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Upload successfull!"
        
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/delete/<string:s_no>', methods = ['GET', 'POST'])
def delete(s_no):
        if ('user' in session and session['user'] == params["admin_user"]):
            post = Posts.query.filter_by(s_no=s_no).first()
            db.session.delete(post)
            db.session.commit()

        return redirect('/dashboard')
   

@app.route('/contact', methods = ['GET', 'POST'] )
def Contact():
    if(request.method == 'POST'):
        # ADD AN ENTRY TO THE DATABASE
        name = request.form.get('name') 
        email = request.form.get('email') 
        phone = request.form.get('phone') 
        message = request.form.get('message') 
   
    # s_no. name email phone_no. message date
        entry = Contacts(name=name, email=email, phone_no=phone, message = message, date= datetime.now())
    # This will add the entry in the database
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
        sender = email,
        recipients = [params['gmail-user']],
        body = message + "\n" + phone
        
        )

    return render_template("contact.html", params = params)

app.run(debug=True)
