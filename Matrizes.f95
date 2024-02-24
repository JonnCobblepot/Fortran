program matrizes
    implicit none
    
    ! Declarando variáveis
    !real :: vetor1 (10), vetor2(10), vetor3(10)
    real, dimension (10) :: matriz1
    real :: matriz2 (2,2) ! matriz 2x2
    real :: matriz3 (2,2)
    real :: matriz4 (2,2)
    integer :: i
    integer :: matriz5 (3,3) = reshape( [(i, i=1, 9)], [3,3], order = [2,1])

    matriz2(1,1) = 1; matriz2(1,2) = 2      ! (1  2) a matriz ficaria assim
    matriz2(2,1) = 3; matriz2(2,2) = 4      ! (3  4) mas na saída, o Fortran inverte as colunas vem primeiro que as linhas

    matriz3 = reshape( [1, 2, 3, 4], [2,2], order = [1,2]) ! Corrige a inversão de linha e coluna na saída que o Fortran faz
    matriz4 = transpose( reshape( [1, 2, 3, 4], [2,2] ) ) ! Traz a transposta, mas com ordem se pode escolher qual lê primeiro (linha ou coluna)

    ! Execução

    print*, new_line(""), "----------------- Printando na tela matrizes com elementos nao descritos -----------------", new_line("")
    write (*,*) matriz1, new_line("")
    write (*,77) matriz1
    77 format ( *(g0.3, 2X), / )
    print*, new_line(""), "Quer continuar com a teoria sobre matrizes? "
    read (*,*)

    print*, new_line(""), "----------------- Printando a matrizes com seus elementos -----------------", new_line("")
    write (*, 77) matriz2
    write (*, 77) matriz3
    write (*, 77) matriz4
    write (*, 77) matriz5
    print*, new_line(""), "Quer continuar com a teoria sobre matrizes? "
    read (*,*)

    print*, new_line(""), "----------------- Trabalhando com sub-arrays -----------------", new_line("")
    write (*, 88) "Printando somente os elementos da primeira linha: ", matriz5 (1, :)
    88 format (A, *(g0.3, 2X), / )
    write (*, 88) "Printando somente os elementos da segunda linha: ", matriz5 (2, :)
    write (*, 88) "Printando somente os elementos da terceira linha: ", matriz5 (3, :)

    ! Forma de Exercício, printando a matriz
    do i = 1, 3
        print*, matriz5 (i, :)
    end do

    print*, new_line("")

    ! Outra forma de fazer
    write (*,"( 3(I3, 1X), /)") transpose (matriz5) ! "( *(I3, 1X), /)" assim printará toda a matriz em uma linha


end program matrizes