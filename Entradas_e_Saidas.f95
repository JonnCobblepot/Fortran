program exemplo_saidas
    implicit none
    
    ! Declarando Variáveis Exemplo 1
    integer :: polegada, n
    real :: centimetro
    real, parameter :: centimetro_para_polegada = 2.54

    ! Declarando Variáveis Exemplo 2
    real (KIND = 16) :: avogadro = 602214000000000000000000.0
    character (8) :: av = "Avogadro"

    ! Execução do Exemplo 1
    write (*, "(/)")
    write (*,"(A, /)") "Comando write, descritores de formato e comando format:"
    write (*, '(A)') "Quanto vale uma polegada? " ! Fortran agora sabe que a saída é uma string/caracteres (A)
    write (*, "(A, 1X, F4.2, 1X, A, /)") "Uma polegada vale", centimetro_para_polegada, "centimetros."

    write (*, "(A, /)") "Coversao de polegadas em centimetros:"
    write (*, "(A)") "Quantos valores deseja converter?"
    read (*,*) n
    do polegada = 1, n
        centimetro = polegada * centimetro_para_polegada
        write (*, 77) polegada, centimetro
    end do
    77 format(I3, 1X, "polegada(s) = ", F5.2, 1X, "centimetros")

    ! Execução do Exemplo 2
    write (*,"(/)")
    write (*, 23) av
    23 format(15X, A)
    write (*, "(/)")

    write (*, 21) avogadro
    21 format("Numero de Avogadro: ", ES8.2) ! Depois do ES é quantos espaços vai usar e depois do ponto são os decimais

    print*, 21, avogadro

end program exemplo_saidas