from flask import Blueprint, render_template, redirect, url_for, flash, request
from flask_login import login_user, logout_user, login_required, current_user
from app.models import User
from app import db

cabeleleila_leila_bp = Blueprint('cabeleleila_leila', __name__, url_prefix='/cabeleleila_leila')

@cabeleleila_leila_bp.route('/index')
def cabeleleila_leila_index():
    return render_template('cabeleleila_leila/cabeleleila_leila.html')

@cabeleleila_leila_bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        email = request.form['email']
        phone = request.form['phone']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        if password != confirm_password:
            flash('As senhas não coincidem!', 'danger')
            return redirect(url_for('cabeleleila_leila.register'))
        
        existing_user = User.query.filter_by(email=email).first()
        if existing_user:
            flash('E-mail já cadastrado!', 'danger')
            return redirect(url_for('cabeleleila_leila.register'))
        
        new_user = User(
            name=name,
            username=username,
            email=email,
            phone=phone,
            password=password
        )
        db.session.add(new_user)
        db.session.commit()
        
        flash('Cadastro realizado com sucesso!', 'success')
        return redirect(url_for('cabeleleila_leila.login'))
    
    return render_template('cabeleleila_leila/register.html')

@cabeleleila_leila_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        user = User.query.filter_by(email=email).first()
        
        if user and user.check_password(password):
            login_user(user)
            return redirect(url_for('cabeleleila_leila.dashboard'))
        else:
            flash('Credenciais inválidas!', 'danger')
    
    return render_template('cabeleleila_leila/login.html')

@cabeleleila_leila_bp.route('/dashboard')
@login_required
def dashboard():
    return render_template('cabeleleila_leila/dashboard.html')

@cabeleleila_leila_bp.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('cabeleleila_leila.cabeleleila_leila_index'))

@cabeleleila_leila_bp.route('/edit_profile', methods=['GET', 'POST'])
@login_required
def edit_profile():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        email = request.form['email']
        phone = request.form['phone']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        existing_email = User.query.filter_by(email=email).first()
        existing_username = User.query.filter_by(username=username).first()

        if existing_email and existing_email != current_user:
            flash('E-mail já cadastrado!', 'danger')
            return redirect(url_for('cabeleleila_leila.edit_profile'))
        
        if existing_username and existing_username != current_user:
            flash('Nome de usuário já existe!', 'danger')
            return redirect(url_for('cabeleleila_leila.edit_profile'))
        
        if password:
            if password != confirm_password:
                flash('As senhas não coincidem!', 'danger')
                return redirect(url_for('cabeleleila_leila.edit_profile'))
        
        current_user.name = name
        current_user.username = username
        current_user.email = email
        current_user.phone = phone
        if password:
            current_user.password = password
        
        db.session.commit()
        
        flash('Perfil atualizado com sucesso!', 'success')
        return redirect(url_for('cabeleleila_leila.dashboard'))
    
    return render_template('cabeleleila_leila/edit_profile.html', user=current_user)