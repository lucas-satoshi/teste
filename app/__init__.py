# app/__init__.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

db = SQLAlchemy()
login_manager = LoginManager()

def create_app():
    app = Flask(__name__, template_folder="templates")
    
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///cabeleleila.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.secret_key = "sua_chave_secreta_aqui"
    
    db.init_app(app)
    login_manager.init_app(app)
    login_manager.login_view = 'auth.login'
    
    from app.routes import main, teste_logica_bp, cabeleleila_leila_bp
    app.register_blueprint(main)
    app.register_blueprint(teste_logica_bp)
    app.register_blueprint(cabeleleila_leila_bp)
    
    with app.app_context():
        db.create_all()
    
    return app