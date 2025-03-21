from flask import Blueprint, render_template, redirect, url_for, flash, request, jsonify
from flask_login import login_user, logout_user, login_required, current_user
from app.models import User, Service, Appointment
from app import db
from datetime import datetime, timedelta

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

@cabeleleila_leila_bp.route('/schedule', methods=['GET', 'POST'])
@login_required
def schedule():
    if request.method == 'POST':
        selected_services = request.form.getlist('services')
        selected_date = request.form['date']
        selected_time = request.form['time']
        
        services_str = ', '.join(selected_services)
        
        start_week = Appointment.query.filter_by(user_id=current_user.id).filter(
            Appointment.date >= datetime.now().date() - timedelta(days=datetime.now().weekday()),
            Appointment.date < datetime.now().date() + timedelta(days=7 - datetime.now().weekday())
        ).first()
        
        if start_week:
            suggested_date = start_week.date
            flash(f"Sugestão: Agendar na mesma data: {suggested_date.strftime('%d/%m/%Y')}", 'info')
        
        new_appointment = Appointment(
            user_id=current_user.id,
            services=services_str,  # Salva a string de serviços
            date=datetime.strptime(selected_date, '%Y-%m-%d').date(),
            time=datetime.strptime(selected_time, '%H:%M').time(),
            status='aguardando'
        )
        
        db.session.add(new_appointment)
        db.session.commit()
        
        flash('Agendamento realizado com sucesso!', 'success')
        return redirect(url_for('cabeleleila_leila.dashboard'))
    
    services = Service.query.all()
    return render_template('cabeleleila_leila/schedule.html', services=services)

@cabeleleila_leila_bp.route('/check-schedule', methods=['GET'])
@login_required
def check_schedule():
    selected_date_str = request.args.get('date')
    if not selected_date_str:
        return jsonify({"error": "Data inválida"}), 400

    try:
        selected_date = datetime.strptime(selected_date_str, '%Y-%m-%d').date()
    except ValueError:
        return jsonify({"error": "Formato de data inválido"}), 400

    start_of_week = selected_date - timedelta(days=selected_date.weekday())
    end_of_week = start_of_week + timedelta(days=7)

    first_appointment = Appointment.query.filter_by(user_id=current_user.id).filter(
        Appointment.date >= start_of_week,
        Appointment.date < end_of_week
    ).order_by(Appointment.date.asc()).first()

    if first_appointment:
        return jsonify({
            "suggested_date": first_appointment.date.strftime('%Y-%m-%d'),
            "exists": True
        })
    else:
        return jsonify({"exists": False})
    
@cabeleleila_leila_bp.route('/history', methods=['GET'])
@login_required
def history():
    current_date = datetime.now().date()
    two_days_later = current_date + timedelta(days=2)
    start_date = request.args.get('start_date')
    end_date = request.args.get('end_date')
    
    appointments = current_user.appointments.order_by(Appointment.date.desc())

    if start_date and end_date:
        start = datetime.strptime(start_date, '%Y-%m-%d').date()
        end = datetime.strptime(end_date, '%Y-%m-%d').date()
        appointments = appointments.filter(
            Appointment.date >= start,
            Appointment.date <= end
        )

    appointments = appointments.all()

    return render_template(
        'cabeleleila_leila/history.html',
        appointments=appointments,
        current_date=current_date,
        two_days_later=two_days_later.strftime('%Y-%m-%d')
    )

@cabeleleila_leila_bp.route('/edit-appointment/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_appointment(id):
    appointment = Appointment.query.get_or_404(id)
    current_date = datetime.now().date()
    min_date = current_date + timedelta(days=2)
    
    if (appointment.user != current_user or 
        appointment.status not in ['aguardando', 'confirmado'] or 
        (appointment.date - current_date).days < 2):
        flash('Edição não permitida.', 'danger')
        return redirect(url_for('cabeleleila_leila.history'))
    
    if request.method == 'POST':
        new_date = request.form['date']
        new_time = request.form['time']
        
        start_week = current_user.appointments.filter(
            Appointment.date >= datetime.now().date() - timedelta(days=datetime.now().weekday()),
            Appointment.date < datetime.now().date() + timedelta(days=7 - datetime.now().weekday())
        ).first()
        
        if start_week:
            suggested_date = start_week.date
            flash(f'Sugestão: Agendar na data original: {suggested_date.strftime("%d/%m/%Y")}', 'info')
        
        appointment.date = datetime.strptime(new_date, '%Y-%m-%d').date()
        appointment.time = datetime.strptime(new_time, '%H:%M').time()
        appointment.status = 'aguardando'
        db.session.commit()
        flash('Agendamento atualizado!', 'success')
        return redirect(url_for('cabeleleila_leila.history'))
    
    return render_template(
        'cabeleleila_leila/edit_appointment.html',
        appointment=appointment,
        min_date=min_date.strftime('%Y-%m-%d')
    )

@cabeleleila_leila_bp.route('/cancel-appointment/<int:id>', methods=['POST'])
@login_required
def cancel_appointment(id):
    appointment = Appointment.query.get_or_404(id)
    
    if (appointment.user != current_user or 
        (appointment.date - datetime.now().date()).days < 2):
        flash('Cancelamento não permitido.', 'danger')
    else:
        appointment.status = 'cancelado'
        db.session.commit()
        flash('Agendamento cancelado!', 'success')
    
    return redirect(url_for('cabeleleila_leila.history'))