program aprofundando
    implicit none
    
    ! Declarando
    character (10) :: pula_linha
    integer :: matriz1(3,3) = reshape([1, 1, 1, 2, 2, 2, 3, 3, 3], [3,3], [1,2])
    integer :: matriz2(3,2) = 2
    integer :: vetor1(9)
    logical :: verdade(3,3) = .true.
    integer :: matriz3(3,3)
    integer :: soma1(3,3) = reshape([1, 1, 1, 2, 2, 2, 3, 3, 3], [3,3], [1,2]), soma2(3,3), soma3(3,3)
    
    ! Formatação
    99 format ( /, A, //, 3(I2, 1X), / )
    88 format ( //, A, *(g0.3, 2X) )
    77 format ( /, A, //, *(3(L, 2X), / ) )
    pula_linha = new_line("A")

    ! Execução
    write (*, 99) "Transposta da Matriz 1:", transpose(matriz1)
    write (*, 99) "Matriz 2:", matriz2
    write (*, 99) "Multiplicando a Matriz 1 pela 2:", matmul( transpose(matriz1), matriz2 )
    write (*, 99) "Encontrando na matriz 1 a primeira localizacao do elemento 3", findloc(matriz1, 3)
    write (*, 99) "Encontrando na matriz 1 a ultima localizacao do elemento 3", findloc(matriz1, 3, back = .true.) 
    write (*, 99) "O limite inferior da primeira dimensao da Matriz 2:", lbound(matriz2, dim = 1) ! matriz2 é o array
    write (*, 99) "O limite superior da segunda dimensao da Matriz 2:", ubound(matriz2, dim = 2)
    pula_linha = new_line("A")
 
    print*, "Quer continuar com o ensino? "
    read (*,*)
    print*, pula_linha
    print*,"Vamos aprender a transformar vetores em matrizes e vice-versa (Pack, Unpack)"
    write (*,*) "Vetor 1:", vetor1 ! números aleatórios
    vetor1 = pack (matriz1, mask = .true. )
    write (*, 88) "Matriz 1 se tornando vetor: ", vetor1
    vetor1 = pack (matriz1, mask = matriz1 < 3, vector = [5, 5, 5, 5, 5, 5, 5, 5, 5] ) ! completa nos lugares faltantes o elemento 5
    write (*, 88) "Matriz 1 se tornando vetor, apenas para elementos menores que 3: ", vetor1 
    verdade(3,3) = .false. ! Na matriz verdade, o elemento da linha 3 coluna 3 será atribuido o valor de falso
    write (*, 77) "Matriz logica: ", verdade
    matriz3 = unpack ( vetor1, mask = verdade, field = 0 ) ! o shape de "verdade" define o shape da matriz3, e onde for falso, agora é 0
    write (*, 99) "Matriz 3:", matriz3 ! vindo com os elementos do vetor 1 que vieram da matriz 1

    print*, "Quer continuar com o ensino? "
    read (*,*)
    print*, pula_linha
    print*,"Mais operacoes entre matrizes"
    write(*, 99) "Matriz 1 que é o dobro da matriz 2: ", soma1
    soma2 = soma1 / 2
    soma3 = soma1 + soma2
    write (*, 99) "Somando matrizes:", soma3

end program aprofundando