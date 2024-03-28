import integra_python

# Função para adicionar uma nova entrada à agenda telefônica
def adicionar_chave(nome, numeros):
    integra_python.adicionar_chave(nome, numeros)

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
