program parametro_kind  ! não desperdiça armazenamento e recursos da máquina
    use iso_fortran_env ! importando um módulo que identifica os tipo kind desse sistema
    implicit none
    
    ! Constantes Nomeadas
    integer, parameter :: simples = 4
    integer, parameter :: dobro = 8
    integer, parameter :: quadruplo = 16

    ! Variáveis
    real (kind = 4) :: valor1 ! variável com 4 bytes, armazenam nela até 32 bits
    real (kind = dobro) :: valor2
    real (kind = quadruplo) :: valor3
    real (8) :: valor4
    integer (kind = 8) :: valor5

    ! Constante nomeada de precisão simples

    real, parameter :: constante = 71._dobro ! tamanho dos dados que devem ser alocados para essa constante

    ! Execução
    write (*,*) valor1, valor2, valor3, valor4, valor5
    write (*,*) kind(valor1), kind(valor2), kind(valor3), kind(valor4), kind(valor5) ! quantidade de armazenamento
    write (*,*) "Precisao decimal da variavel 1: ", precision(valor1) ! quantas casas decimais estão reservadas para ela
    write (*,*) "Faixa do expoente decimal da variavel 1: ", range(valor1) ! gera valores 10** o resultado que der
    write (*,*) "Precisao decimal da variavel 2: ", precision(valor2)

    write (*,*) "Kind do valor literal 0.0", kind(0.0) ! Ao não especificar o tipo, será atribuido a ele arma. de 4 bytes
    write (*,*) "Kind do valor literal 0.0D0", kind(0.0D0) ! o sufixo D0 aumenta sempre para 64 bites
    write (*,*) "Valor da constante: ", constante, "kind: ", kind(constante)

    write (*,*) "Kinds disponiveis para o tipo real: ", real_kinds ! é um array
    write (*,*) "Kinds disponiveis para o tipo inteiros: ", integer_kinds
    write (*,*) "Kinds disponiveis para o tipo caracterer: ", character_kinds

end program parametro_kind