import integra_python
    
# Função para adicionar uma nova entrada à agenda telefônica
def adicionar_chave():
    nome = str(input("Digite o nome do contato: "))
    numero = int(input("Digite o número de telefone: "))
    integra_python.adicionar_chave(nome, numero)
    
# Função para imprimir o conteúdo da agenda telefônica
def print_agenda():
    integra_python.print_agenda()
    
# Função para verificar o estado do dicionário
def check():
    integra_python.check()
    
# Função para excluir um contato da agenda telefônica
def excluir_contato():
    nome = str(input("Digite o nome do contato que deseja excluir: "))
    integra_python.excluir_contato(nome)
    
# Função para modificar um contato existente na agenda telefônica
def alterar_contato():
    nome = str(input("Digite o nome do contato que deseja modificar: "))
    novo_nome = str(input("Digite o novo nome para o contato: "))
    novo_numero = int(input("Digite o novo número de telefone: "))
    integra_python.alterar_contato(nome, novo_nome, novo_numero)
    
if __name__ == "__main__":
    while True:
        print("\nMenu:")
        print("1. Adicionar novo contato")
        print("2. Imprimir agenda telefônica")
        print("3. Verificar estado da agenda")
        print("4. Excluir contato")
        print("5. Modificar contato")
        print("0. Sair")
        
        opcao = input("Escolha uma opção: ")
        
        if opcao == '1':
            adicionar_chave()
        elif opcao == '2':
            print_agenda()
        elif opcao == '3':
            check()
        elif opcao == '4':
            excluir_contato()
        elif opcao == '5':
            alterar_contato()
        elif opcao == '0':
            print("Encerrando o programa...")
            break
        else:
            print("Opção inválida! Por favor, escolha uma opção válida.")
