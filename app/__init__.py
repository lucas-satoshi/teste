import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
from flask_login import LoginManager

load_dotenv()

db = SQLAlchemy()
login_manager = LoginManager()

def get_database_uri():
    db_user = os.getenv('DB_USER', 'u196497167_admin')
    db_password = os.getenv('DB_PASSWORD', 'OculosEscuro%40132')
    db_host = os.getenv('DB_HOST', '193.203.175.154')
    db_port = os.getenv('DB_PORT', '3306')
    db_name = os.getenv('DB_NAME', 'u196497167_fenixreborn')
    return f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

def create_app():
    app = Flask(__name__, template_folder="templates")

    app.secret_key = os.getenv('FLASK_SECRET_KEY', 'i]l\3q86>Q3J')

    app.config['SQLALCHEMY_DATABASE_URI'] = get_database_uri()
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_POOL_RECYCLE'] = 280
    app.config['SQLALCHEMY_POOL_TIMEOUT'] = 20
    app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {
        "pool_pre_ping": True
    }

    db.init_app(app)
    login_manager.login_view = 'cabeleleila_leila.login'

    with app.app_context():
        db.create_all()

    from app.routes import register_routes
    register_routes(app)

    login_manager.init_app(app)

    return app