program condicionais
    implicit none

    ! Declarando as Variáveis
    integer :: numero, i
    character (35) :: mensagem = "Digite um numero para a avaliacao:"

    ! Execução
    write(*,"(/)")
    write (*, "(A)") mensagem
    read (*,*) numero

    if (numero > 10) then
        write (*, "(A)") "Numero maior do que 10"
    else if (numero < 10) then
        write (*, "(A)") "Numero menor do que 10"
    else
        write(*,"(A)") "Numero igual a 10"
    end if

    loop: do i=1, 10              ! "stop" sai de todo o programa
        if ( mod(i,2) == 0) cycle ! "cycle" refere-se que se a condição for verdadeira, ele não executa o que está abaixo, e volta a seguinte
        print*, i                 ! "continue" executa o código independente da condição
    end do loop                   ! "exit" sai do loop

end program condicionais