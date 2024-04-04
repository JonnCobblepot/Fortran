module integra_python
    use iso_c_binding
    implicit none
    
    type :: telefone
        character(len=50) :: nome
        integer, dimension(:), allocatable :: numeros
    end type telefone
    
    type(telefone), allocatable :: agenda(:)

contains

    subroutine check() bind(C)
        integer :: i
        
        ! Verifica se a agenda já foi alocada antes de alocá-la novamente
        if (.not. allocated(agenda)) then
            allocate(agenda(0))
        end if
        
        print '("(from fortran) - Check state of dictionary")'
    end subroutine

    !subroutine adicionar_chave(nome, nome_len, numeros, numeros_len) bind(C)
    subroutine adicionar_chave(nome, numeros) bind(C)
            character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_int) :: nome_len
        integer(c_int), dimension(*), intent(in) :: numeros
        integer(c_int) :: numeros_len
        integer :: i, index
        character(len=50) :: nome_fortran
        integer, dimension(:), allocatable :: numeros_int

        nome_len=len(nome)
        
        ! Convertendo nome para uma string Fortran
        nome_fortran = ''
        do i = 1, nome_len
            if (nome(i) == c_null_char) exit
            nome_fortran(i:i) = nome(i)
        end do
        nome_fortran = adjustl(trim(nome_fortran))
        
        ! Verifica se a chave já existe na agenda
        index = -1
        do i = 1, size(agenda)
            if (trim(adjustl(agenda(i)%nome)) == trim(adjustl(nome_fortran))) then
                index = i
                exit
            end if
        end do
        
        ! Se a chave não existe, adicione-a à agenda
        if (index == -1) then
            index = size(agenda) + 1
            allocate(agenda(index)%numeros(numeros_len))
        end if
        
        agenda(index)%nome = nome_fortran
        
        ! Alocar e atribuir valores a numeros_int
        allocate(numeros_int(numeros_len))
        do i = 1, numeros_len
            numeros_int(i) = numeros(i)
        end do
        
        agenda(index)%numeros = numeros_int
        
        print '("(from fortran) - Chave adicionada com sucesso!")'
    end subroutine adicionar_chave

    subroutine modificar_contato(nome, nome_len, novo_numero) bind(C)
        character(kind=c_allocate(agenda(index)%numeros(numeros_len))
        end ifchar), dimension(*), intent(in) :: nome
        integer(c_int), value :: nome_len
        integer(c_int), value :: novo_numero
        integer :: i
        
        character(len=50) :: nome_fortran
        
        ! Convertendo nome para uma string Fortran
        nome_fortran = ''
        do i = 1, nome_len
            if (nome(i) == c_null_char) exit
            nome_fortran(i:i) = nome(i)
        end do
        nome_fortran = adjustl(trim(nome_fortran))
        
        ! Verificar se o contato existe
        do i = 1, size(agenda)
            if (trim(adjustl(agenda(i)%nome)) == trim(adjustl(nome_fortran))) then
                agenda(i)%numeros = [novo_numero]
                print '("(from fortran) - Contato modificado com sucesso!")'
                return
            end if
        end do

        print '("(from fortran) - Contato não encontrado!")'
    end subroutine modificar_contato

    subroutine print_agenda() bind(C)
        integer :: i, j
        
        print '("(from fortran) - Conteúdo da agenda telefônica:")'
        do i = 1, size(agenda)
            print '("Nome: ", A, ", Números: ", 100i0)', trim(agenda(i)%nome), agenda(i)%numeros
        end do
    end subroutine print_agenda

end module integra_python
