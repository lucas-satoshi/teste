from .main import main
from .teste_logica import teste_logica_bp
from .cabeleleila_leila import cabeleleila_leila_bp

def register_routes(app):
    app.register_blueprint(main)
    app.register_blueprint(teste_logica_bp)
    app.register_blueprint(cabeleleila_leila_bp)