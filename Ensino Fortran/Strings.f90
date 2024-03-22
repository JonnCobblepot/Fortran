program strings
    implicit none
    
    ! Declarando
    character (len=10) :: nome = "Joao"
    character(5), dimension(3) :: vetor
    character(:), allocatable :: i ! Não sabe o tamanho deste caractere
    character(len=20) :: a*4, b*2, c*10, d !mais fácil do que ir linha por linha dizendo seus tamanhos

    vetor = [ character(5) :: "12345", "ola", "oi"] !agora todos estão com a mesma quantidade de caracteres 5
    allocate( character(10) :: i) !torna-se a alocação automática

    ! Execução
    print*, nome, len(nome), trim(nome), len(trim(nome)) !len pega o total, e trim do que foi usado, de caracter
    print*, nome // "Pedro" ! Concatenação, mas foi o nome e os espaços dado Len=10 na declaração
    print*, trim(nome) // " Pedro"
    print*, vetor
    print*, [character(5) :: "12345", "ola", "oi"]
    print*, i
    print*, a, b, c, d
    print*, verify("OLA", "OI") !Verifica e retorna o número do primeiro caracter a estar diferente com a verificaçãou

end program strings