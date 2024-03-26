from integra_python import matriz, check

# Chama a função check no fortran que tem acesso a variável my_internal_state
check()

# Pedindo ao usuário para digitar o número de linhas e colunas da matriz
nlinhas = int(input("(from python) - Digite o número de linhas da matriz: "))
ncolunas = int(input("(from python) - Digite o número de colunas da matriz: "))

mat = matriz(nlinhas, ncolunas)

# Imprimindo a matriz
print('(from python) - A matriz formada é:')
for linha in mat:
    print(' '.join(map(str, linha)))

check()

















"""
check()

# Pedindo ao usuário para digitar um número inteiro
n = int(input("(from pyhton) - Digite um numero inteiro: "))

# Chamando a função em Fortran para criar a lista
lista = vetor(n)

# Vai printar a lista
print(f'(from python) - A lista formada pelos inteiro de 1 até {n} é:')

for i in range(n):
    print(lista[i], end=' ')
print()

# print(lista)
# check()
"""


"""

# Chama a função check no fortran que tem acesso a variável my_internal_state
check()

for a,b in [(1.0,2.0),(-1.0,2.0)]:
    c = soma(a,b)
    print(f'(from python) a soma de {a} com {b} dá {c}')
    check()

"""

"""

# Chamando uma matriz
m = int(input("Quantidade de linhas: "))
h = int(input("Quantidade de colunas: "))
matriz = []
for i in range(m):
  linha = []
  for j in range(h):
    linha.append(0)
  matriz.append(linha)
print(matriz)


# Chamando um dicionário
agenda= {}
def InserirPessoa(nome):
    if not nome in agenda:
        agenda[nome] = []
    return agenda

def InserirTelefone(nome,tel):
    if nome in agenda:
        if len(agenda[nome]) == 0:
            agenda[nome] = [tel]
        else:
            agenda[nome]+=[tel]
    else:
        agenda[nome] = [tel]
    return agenda

def ExcluirTelefone(nome,tel):
    if nome in agenda:
        if tel in agenda[nome]:
            agenda[nome].remove(tel)
    return agenda
def ExcluirPessoa(nome):
    if nome in agenda:
        del agenda[nome]
    return agenda

while (True):
    entrada = eval(input())

    # Avaliando a string usando eval()
    tupla_avaliada = eval(f"{entrada}")

    # Obtendo a função e os argumentos da tupla
    funcao, *argumentos = tupla_avaliada

    if funcao == "Encerrar":
        break

    # Chamar a função dinamicamente
    resultado = eval(f"{funcao}(*argumentos)")
# Exibir o resultado
print(resultado)


"""