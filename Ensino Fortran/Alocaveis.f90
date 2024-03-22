program variaveis_alocaveis
    implicit none
    
    ! Declarando
    integer, allocatable :: v(:)
    ! integer, allocatable :: a(:,:)
    integer :: p(3)
    integer :: erro
    integer, allocatable, dimension(:) :: x, y
    character(:), allocatable :: string_alocavel

    allocate (v, source = p) !alocando v com o tamanho de p
    v = [1, 2, 3]            !aqui vc realoca, então não importou o source em cima, agora se for v = 0, haverá 0 0 0
    write (*,"(3I2)") v
    deallocate (v)  ! agora pode usar a variávei v novamente, alocando ela 

    allocate (v(3), stat = erro)      ! Aloca um vetor de 2 elementos, e tem o parâmetro do erro que vai dizer se deu certo ou não
    v = [4, 5, 6]                     ! Vetor com seus três elementos
    if (erro /= 0) error stop         ! Se der erro, vai parar o programa
    print*, v
    if (allocated(v)) then            ! Se alocou o vetor, vai desalocar ele, caso contrário da o erro e para o programa
         deallocate (v, stat = erro)
    if (erro /= 0) error stop
    end if

    allocate(x(10))
    x = 1
    print*, x             ! cheio de 1
    call move_alloc(x,y)  ! vai mover as variáveis
    print*, x             ! ficou vazio
    print*, y             ! ficou com os elementos movidos

    allocate(character(10)::string_alocavel)
    string_alocavel = "ajsdjasnjasndndasdnkasdjksadsd"  ! É uma string dinâmica
    print*, len(string_alocavel), string_alocavel

end program variaveis_alocaveis