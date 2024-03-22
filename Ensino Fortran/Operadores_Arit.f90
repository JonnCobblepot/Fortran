program operadores_aritmeticos
    implicit none
    
    ! Declarando as variáveis
    integer :: n1, n2, adicao, subtracao, multiplicacao
    real :: divisao, exponenciacao

    write (*,*) "Digite um número: "
    read (*,*) n1
    write (*,*) "Digite outro número: "
    read (*,*) n2

    ! Executando operações
    adicao = n1 + n2
    subtracao = n1 - n2 
    multiplicacao = n1 * n2
    divisao = n1 / n2
    exponenciacao = n1 ** n2

    write (*,*) "Resultados: ",  adicao, subtracao, multiplicacao, divisao, exponenciacao
    write (*,*) "Resto da divisão inteira: ", mod(n1 , n2) 

end program operadores_aritmeticos