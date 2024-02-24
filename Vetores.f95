program vetores
    implicit none
    
    ! Declarando tipos e variáveis
    real :: vetor1(8), vetor2(3), vetor3(4), vetor4(7), vetor5(5)
    real :: coordenada1(3) = [ 5, 5, -3 ]   ! Vetor coordenada mostrando a posição no eixo x, y e z
    real :: coordenada2(3) = [ 2, -1, 5 ]

    ! Declarando vetores
    vetor1 = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    vetor2 = 0
    vetor3 = 4
    vetor4 = [ vetor2, vetor3]
    vetor5 = 10
    vetor5 (1:3) = 2
    vetor5 (4) = -6

    ! Execução

    print*, new_line(""), "--------------------- Printando na tela os vetores declarados ---------------------"
    write (*,*) new_line(""), vetor1, new_line(""), vetor2, new_line(""), vetor3, new_line(""), vetor4, new_line(""), vetor5
    print*, new_line(""), "Quer continuar com a teoria sobre vetores? "
    read (*,*)

    print*, new_line(""), "--------------------- Operacoes com vetores e coordenadas ---------------------"
    print*, "- So e possivel somar vetores de mesma dimensao:"
    write (*,*) "Somando ao vetor 3 = ", vetor3 + [ 1, 2, 3, 4 ]     ! vetor3 = [ 4, 4, 4, 4 ]
    write (*,*) "Produto escalar entre a coordenada 1 e 2 = ", dot_product(coordenada1, coordenada2)
    write (*,*) "Norma Euclidiana da coordenada 1 = ", norm2(coordenada1)  !Comprimento do vetor geometricamente e em módulo
    write (*,*) "Comparando a Norma Euclidiana da coordenada 1 = ", sqrt (sum (coordenada1 * coordenada1) ) == norm2(coordenada1)
    print*, new_line(""), "Quer continuar com a teoria sobre vetores? "
    read (*,*)

    print*, new_line(""), "--------------------- Funcoes com vetores ---------------------"
    write (*,*) "Tamanho do vetor 1 = ", size(vetor1)
    write (*,*) "Soma dos elementos do vetor 1 = ", sum(vetor1)
    write (*,*) "Soma dos elementos menores que 5 do vetor 1 = ", sum(vetor1, vetor1 < 5)
    write (*,*) "Produto dos elementos do vetor 1 = ", product(vetor1)
    write (*,*) "Elemento de maior valor do vetor 1 = ", maxval(vetor1)
    write (*,*) "Localizacao do elemento de maior valor do vetor 1 = ", maxloc(vetor1)
    write (*,*) "Elemento de menor valor do vetor 1 = ", minval(vetor1)

end program vetores