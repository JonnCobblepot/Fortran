program repeticoes_limitadas
    implicit none

    ! Declarando as variáveis
    integer :: numero, tabuada, i, j, fatorial, n, vetor(10), matriz(10,10)
    character(15) :: fala = "Eu sou a Lenda"

    ! Execução
    write(*,"(/, A)") "Digite um numero entre 1 e 10:"
    read (*,*) numero

    do i = 1, 10
        tabuada = numero * i
        write (*,"(I2, A, I2, A, I3)") numero, " x ", i, " = ", tabuada
    end do

    write (*,"(/)")

    do i = 0, 100, 20
        write (*,"(I3)") i
        write (*,"(A)") fala
    end do

    write (*,"(/, A)") "Digite um numero para se calcular seu valor fatorial:"
    read (*,*) fatorial
    
    n = 1
    do i = 1, fatorial
        n = n * i 
    end do
    write (*,*) n 

    do i=1, 10
        vetor(i) = i
        do j=1, 10
            matriz(i,j) = i + j
        end do
    end do
    write (*, "(I0)") vetor
    write (*,*) new_line("")
    write (*, "(10I3, 1X)") matriz ! Quase um binômio de newton
    
    do concurrent(i=1:10, j=1:10, i == j) ! outra forma de fazer o loop dentro do loop, e dá para colocar condições ali 
        print*, i, j
        matriz (i, j) = 1
    end do
    
end program repeticoes_limitadas