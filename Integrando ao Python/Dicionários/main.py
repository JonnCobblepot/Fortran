import integra_python
import re

# Função para adicionar uma nova entrada à agenda telefônica
def adicionar_chave(nome, numeros):
    numeros_int = [int(re.sub(r'\D', '', numero)) for numero in numeros]  # Extrai apenas os dígitos dos números de telefone
    # Passar quatro argumentos para a função adicionar_chave em Fortran
    integra_python.adicionar_chave(nome, numeros_int)
    #integra_python.adicionar_chave(nome, len(nome), numeros_int, len(numeros_int))

# Função para imprimir o conteúdo da agenda telefônica
def print_agenda():
    integra_python.print_agenda()

# Função para verificar o estado do dicionário
def check():
    integra_python.check()

# Inicialização da agenda telefônica
def iniciar_agenda():
    while True:
        nome = input("(from python) - Digite o nome da pessoa (ou 'exit' para sair): ")
        if nome == 'exit':
            break
        
        numeros = []
        while True:
            numero = input("(from python) - Digite o número de telefone (ou 'finish' para encerrar): ")
            if numero == 'finish':
                break
            
            numeros.append(numero)
        
        # Chamar a função adicionar_chave com os quatro argumentos necessários
        adicionar_chave(nome, numeros)

# Verificar o estado do dicionário
print("(from python) - Estado inicial do dicionário:")
check()

# Iniciar a agenda telefônica
iniciar_agenda()

# Imprimir o conteúdo da agenda telefônica
print("\nConteúdo da agenda telefônica:")
print_agenda()

# Verificar o estado do dicionário após adicionar entradas
print("\nEstado final do dicionário:")
check()
