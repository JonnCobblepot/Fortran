program array_comprehension
    implicit none

    ! Declarando variáveis

    integer :: i
    integer :: vetor1(100) = [ ( i, i = 1, 100, 1 ) ] ! indo de i até 100 de 2 em 2 
    
    ! Concatenando dois vetores - adicionando
    ! O compilador já induz qual é o seu tamanho fixo com o parâmetro
    integer, parameter :: vetor2(*) = [ [ ( 2*i, i = 1, 200, 1 ) ] , [ ( 0*i, i = 1, 100, 2 ) ] ] 

    ! Variáveis lógicas

    logical :: pergunta( size(vetor2) ) = vetor2 < 20  ! Só pode ser usada se a variável for um parâmetro, agora fixo

    ! Execução

    print*, new_line(""), "--------------------- Configuracao do vetor 1 ---------------------", new_line("")
    write (*,"(g0.3, 1X)") vetor1
    write (*,*) vetor1
    print*, new_line(""), "Quer continuar com a teoria sobre vetores? "
    read (*,*)

    print*, new_line(""), "--------------------- Configuracao do vetor 2 ---------------------", new_line("")
    write (*,"(g0.3, 1X)") vetor2
    write (*,*) vetor2
    print*, new_line(""), "True or False para os elementos do vetor 2 que forem menor que 20", new_line("")
    write (*,*) pergunta
    write (*,*) new_line(""), "Quantos True aparecem? ", count(pergunta)

end program array_comprehension