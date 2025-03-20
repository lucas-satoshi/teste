from flask import Blueprint, render_template, request

teste_logica_bp = Blueprint('teste_logica', __name__, url_prefix='/teste_logica')

@teste_logica_bp.route('/index')
def teste_logica_index():
    return render_template('teste_logica/teste_logica.html')

@teste_logica_bp.route('/calculosalario', methods=['GET', 'POST'])
def calculosalario():
    if request.method == 'POST':
        horas_por_dia = float(request.form['horas_por_dia'])
        preco_hora = float(request.form['preco_hora'])
        dias_trabalhados = int(request.form['dias_trabalhados'])

        salario_bruto = horas_por_dia * preco_hora * dias_trabalhados

        desconto = salario_bruto * 0.21

        salario_liquido = salario_bruto - desconto

        return render_template('teste_logica/calculosalario.html', salario_bruto=salario_bruto, desconto=desconto, salario_liquido=salario_liquido)
    else:
        return render_template('teste_logica/calculosalario.html')
    
@teste_logica_bp.route('/valoresinteiros', methods=['GET', 'POST'])
def valoresinteiros():
    if request.method == 'POST':
        a = int(request.form['a'])
        b = int(request.form['b'])
        c = int(request.form['c'])
        d = int(request.form['d'])

        if (b > c and d > a and (c + d) > (a + b) and c > 0 and d > 0 and a % 2 == 0):
            mensagem = "Valores aceitos"
        else:
            mensagem = "Valores não aceitos"

        return render_template('teste_logica/valoresinteiros.html', mensagem=mensagem)
    else:
        return render_template('teste_logica/valoresinteiros.html')
    
@teste_logica_bp.route('/descontoprodutos', methods=['GET', 'POST'])
def descontoprodutos():
    if request.method == 'POST':
        descricao = request.form['descricao']
        quantidade = int(request.form['quantidade'])
        preco_unitario = float(request.form['preco_unitario'])

        total_sem_desconto = quantidade * preco_unitario

        if quantidade <= 5:
            desconto_percentual = 5.55
        elif quantidade <= 10:
            desconto_percentual = 8
        else:
            desconto_percentual = 12.5

        desconto_valor = total_sem_desconto * (desconto_percentual / 100)

        total_a_pagar = total_sem_desconto - desconto_valor

        return render_template('teste_logica/descontoprodutos.html', descricao=descricao, quantidade=quantidade,
                               preco_unitario=preco_unitario, total_sem_desconto=total_sem_desconto,
                               desconto_percentual=desconto_percentual, desconto_valor=desconto_valor,
                               total_a_pagar=total_a_pagar)
    else:
        return render_template('teste_logica/descontoprodutos.html')
    
@teste_logica_bp.route('/expressaonumerica', methods=['GET', 'POST'])
def expressaonumerica():
    if request.method == 'POST':
        a = int(request.form['a'])
        b = int(request.form['b'])
        c = int(request.form['c'])

        if a == 0 and b == 0 and c != 1:
            mensagem = "Solução impossível"
        else:
            x = (1 - c) / (a + b)
            mensagem = f"O valor de X é: {x:.2f}"

        return render_template('teste_logica/expressaonumerica.html', mensagem=mensagem)
    else:
        return render_template('teste_logica/expressaonumerica.html')
    
@teste_logica_bp.route('/placamercosul', methods=['GET', 'POST'])
def placamercosul():
    if request.method == 'POST':
        placa = request.form['placa'].upper()

        if len(placa) == 7 and placa[:3].isalpha() and placa[3:].isdigit():
            padrao = "Brasil"
            correspondente = placa[:4] + chr(ord('A') + int(placa[4])) + placa[5:]
        elif len(placa) == 7 and placa[:3].isalpha() and placa[3].isdigit() and placa[4].isalpha() and placa[5:].isdigit():
            padrao = "Mercosul"
            correspondente = placa[:4] + str(ord(placa[4]) - ord('A')) + placa[5:]
        else:
            padrao = "Formato inválido"
            correspondente = ""

        return render_template('teste_logica/placamercosul.html', padrao=padrao, correspondente=correspondente)
    else:
        return render_template('teste_logica/placamercosul.html')

@teste_logica_bp.route('/sequenciainteiros', methods=['GET', 'POST'])
def sequenciainteiros():
    if request.method == 'POST':
        n = int(request.form['n'])

        def is_perfeito(num):
            divisores = [i for i in range(1, num) if num % i == 0]
            return sum(divisores) == num

        def is_primo(num):
            if num < 2:
                return False
            for i in range(2, int(num**0.5) + 1):
                if num % i == 0:
                    return False
            return True

        resultados = []
        for numero in range(1, n + 1):
            mensagens = []

            if is_perfeito(numero):
                mensagens.append("número perfeito")
            if numero % 2 == 0:
                mensagens.append("múltiplo de 2")
            if numero % 7 == 0:
                mensagens.append("múltiplo de 7")
            if is_primo(numero):
                mensagens.append("número primo")

            if not mensagens:
                mensagens.append("nenhuma propriedade especial")

            resultados.append((numero, ", ".join(mensagens)))

        return render_template('teste_logica/sequenciainteiros.html', resultados=resultados)
    else:
        return render_template('teste_logica/sequenciainteiros.html')

@teste_logica_bp.route('/tituloformatado', methods=['GET', 'POST'])
def tituloformatado():
    if request.method == 'POST':
        parte_superior = request.form['parte_superior']
        parte_inferior = request.form['parte_inferior']

        def gerar_titulo_formatado(parte_superior, parte_inferior):
            largura_total = max(len(parte_superior), len(parte_inferior)) + 4
            linha_superior = f"{'||' + '|' * (largura_total - 2) + '||'}"
            linha_central_superior = f"|| {parte_superior.center(largura_total - 4)} ||"
            linha_central_inferior = f"|| {parte_inferior.center(largura_total - 4)} ||"
            linha_inferior = linha_superior

            return f"{linha_superior}\n{linha_central_superior}\n{linha_central_inferior}\n{linha_inferior}"

        titulo_formatado = gerar_titulo_formatado(parte_superior, parte_inferior)

        return render_template('teste_logica/tituloformatado.html', titulo_formatado=titulo_formatado)
    else:
        return render_template('teste_logica/tituloformatado.html')

@teste_logica_bp.route('/matrizquadrada', methods=['GET', 'POST'])
def matrizquadrada():
    if request.method == 'POST':
        n = int(request.form['n'])

        def gerar_matriz_caracol(n):
            matriz = [[0] * n for _ in range(n)]
            num = 1
            top, bottom, left, right = 0, n - 1, 0, n - 1

            while num <= n * n:
                for i in range(left, right + 1):
                    matriz[top][i] = num
                    num += 1
                top += 1

                for i in range(top, bottom + 1):
                    matriz[i][right] = num
                    num += 1
                right -= 1

                for i in range(right, left - 1, -1):
                    matriz[bottom][i] = num
                    num += 1
                bottom -= 1

                for i in range(bottom, top - 1, -1):
                    matriz[i][left] = num
                    num += 1
                left += 1

            return matriz

        matriz = gerar_matriz_caracol(n)

        return render_template('teste_logica/matrizquadrada.html', matriz=matriz)
    else:
        return render_template('teste_logica/matrizquadrada.html')

class Pato:
    def __init__(self, nome):
        self.nome = nome

    def grasnar(self):
        return f"{self.nome} diz: Quack! Quack!"

    def nadar(self):
        return f"{self.nome} está nadando no lago... 🌊"

    def voar(self):
        return f"{self.nome} está voando alto no céu! ✈️"

@teste_logica_bp.route('/pato', methods=['GET', 'POST'])
def pato():
    meu_pato = Pato("Patolino")
    mensagem = None

    if request.method == 'POST':
        acao = request.form['acao']

        if acao == 'grasnar':
            mensagem = meu_pato.grasnar()
        elif acao == 'nadar':
            mensagem = meu_pato.nadar()
        elif acao == 'voar':
            mensagem = meu_pato.voar()

    return render_template('teste_logica/pato.html', mensagem=mensagem)