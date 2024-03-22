program name
    implicit none

    ! Declarando
    integer :: i = 100, v(3) = [1,2,3], w(2,2) = 0
    real :: j = 1.0, s(5) = acos(-1.0) ! Arco do cosseno
    real :: m(2,2) = -5.0
    complex :: z = (1,5)
    character (len=1) :: h = "o"
    character (Len=4) :: u = "joao"
    character (Len=10) :: t(10,10)
    logical :: q = .true.

    t = reshape ( [ (char(i+27), i=1, 100) ] , [ 10,10 ] )

    ! Execução dos inteiros
    print "(I4)", i ! Espaço que será usado para i
    print "(I4)", i, i ! Somente 1 inteiro, então printará apenas 1
    print "(2I4)", i, i ! Agora printará os dois inteiros
    print "(2I4)", v ! Este vetor tem 3 inteiros, o 3° será printado na linha de baixo
    print "(2I2)", w ! 2 inteiros por linha dessa matriz 2x2
    print "(4I2)", w ! Linearizou a matriz
    print "(I0)", w ! Posta elemento por elemento
    print*, new_line("A")

    ! Execução dos reais
    print "(F6.4)", j ! 6 espaços para todo o print (conta o ponto/vírgula) e 4 para os decimais
    print "(2F6.4)", j, j ! Printando 2 floats/reais
    print "(F6.4, 2X, I3, /)", j, i ! X é a atribuição de espaços e / pula a linha
    print*, s
    print "(5F6.3)", s
    print "(5(F6.3, /))", s
    print "(d15.5)", m !matriz linha por linha com D+01
    print "(e15.5)", m ! com e de elevado
    print "(es15.5)", m ! notação científica
    print*, new_line("A")

    ! Execução dos complexos
    print*, z, real(z), aimag(z) ! Parte real e imaginária
    print "(2F5.2)", z, real(z), aimag(z)
    print*, new_line("A")

    ! Execução dos caracteres
    print "(A)", h, u ! vai printar cada caracterer em uma linha
    print "(2A)", h, u ! agora permitiu os dois caracteres na mesma linha
    print "(2(A, 1X))", h, u ! agora com espaço entre os dois
    print "(A2)", u ! só printará dois caracteres de u
    print "(3(A4, 1X))", h, u, "yesssssssssss"
    print*, t
    print "(10A)", t ! formatando matriz 10x10 de caracter
    print*, new_line("A")

    ! Execução dos lógicos/booleanos
    print "(L)", q

end program name