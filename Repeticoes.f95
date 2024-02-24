program repeticoes
    implicit none
    
    ! Declarando as variáveis
    integer :: numero, i, j
    character (100) :: mensagem = "Digite um numero positivo para continuar ou um negativo para parar a repeticao"

    ! Execucao
    exemplo: do
        write(*,"(/, A, /)") mensagem
        read (*,*) numero

        if (numero <= 0) exit

        if (mod(numero, 2) == 0) then
            write (*, "(A)") "O numero e par"
        else
            write (*, "(A)") "O numero e impar"
        end if
    end do exemplo

    write(*,"(/, A, /)") "Digite um numero positivo para um segundo teste de repeticao"
    read(*,*) numero

    do while (numero > 0)

        if (mod(numero, 2) == 0) then
            write (*, "(A, /)") "O numero e par"
        else
            write (*, "(A, /)") "O numero e impar"
        end if

        write(*,"(/, A, /)") mensagem
        read (*,*) numero
    
    end do 

    externo: do i=1, 5
        interno: do j=1, 3
            print*, i, j
        end do interno
    end do externo

end program repeticoes