from . import db, login_manager
from flask_login import UserMixin
from sqlalchemy import event
from datetime import datetime

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(64), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    phone = db.Column(db.String(20), nullable=False)
    password = db.Column(db.String(128), nullable=False)
    
    appointments = db.relationship(
        'Appointment', 
        backref='user', 
        lazy='dynamic'
    )

    def check_password(self, password):
        return self.password == password

class Service(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    duration = db.Column(db.Integer, nullable=False)

@event.listens_for(Service.__table__, 'after_create')
def populate_services(target, connection, **kwargs):
    services = [
        ('Corte de Cabelo', 60),
        ('Progressiva', 120),
        ('Manicure', 30),
        ('Pedicure', 45),
        ('Coloração', 90),
        ('Hidratação', 60),
        ('Selagem', 90),
        ('Escova', 60)
    ]
    
    connection.execute(target.insert(), [
        {"name": name, "duration": duration} 
        for name, duration in services
    ])

class Appointment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    services = db.Column(db.String(255), nullable=False)
    date = db.Column(db.Date, nullable=False)
    time = db.Column(db.Time, nullable=False)
    status = db.Column(db.String(20), nullable=False, default='aguardando')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))