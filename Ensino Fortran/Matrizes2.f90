program matrizes2_e_alfabeto
    implicit none
    
    ! Declarando variáveis e formatos
    integer :: matriz1 (5,5), matriz2 (3,3)
    integer :: i
    character(len=10) :: pula_linha
    character, parameter :: alfabeto(*) = [ ( char(i), i=97, 122)]
    character, parameter :: alfabeto2(*) = [ ( char(i), i=ichar("a"), ichar("z"))] ! vai devolver os números associados aquelas letras

    88 format ( A, //, 5(I4, 1X), / ) ! Dada a ordem da matriz, substituir no primeiro número
    99 format ( A, //, 3(I4, 1X), / )
    pula_linha = new_line("A")

    matriz1 = reshape( source = [(i, i=0, 1000, 5)] , shape = [5,5] , order = [1,2], pad = [0,1]) ! pad completa a matriz
    matriz2 = reshape( source = [integer :: ] , shape = [3,3] , order = [1,2], pad = [0,-1,10]) ! matriz vazia, se não fosse o pad

    ! Execução
    print*, pula_linha
    write (*, 88) "Representacao da matriz 1 5x5:", matriz1
    write (*, "(/, A, I2, A, I1, /)") "Quantos elementos cabem na matriz 1 e qual sua ordem? ", size(matriz1), " e ", rank(matriz1)
    write (*, 99) "Representacao da matriz 2 3x3:", matriz2
    write (*, "(/, A, /, L, /, L, /)") "Ha na matriz 2 algum elemento < 0? E todos sao < 10?", any(matriz2 < 0), all(matriz2 < 10)

    print*, "Quer continuar com o ensino? "
    read (*,*)
    print*, pula_linha
    print*, "Vamos aprender agora a como identificar a numeracao correspondente a cada caractere para o alfabeto"
    
    do i=1, 127
        print*, i, char(i) ! de char(97) até char(122) são as letras minúsculas do alfebeto
    end do

    write (*, "(/, A, *(A, 1X))") "O alfabeto: ", alfabeto
    write (*, "(/, A, *(A, 1X))") "Novamente: ", alfabeto

end program matrizes2_e_alfabeto