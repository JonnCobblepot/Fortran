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
        print '("(from fortran) - Check state of dictionary")'
    end subroutine

    subroutine adicionar_chave(nome, nome_len, numeros, numeros_len) bind(C)
        character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_int), value :: nome_len
        integer(c_int), dimension(*), intent(in) :: numeros
        integer(c_int), value :: numeros_len
        integer :: i, index
        
        character(len=50) :: nome_fortran
        
        ! Determina o tamanho da string C
        integer :: str_len
        do str_len = 1, nome_len
            if (nome(str_len) == c_null_char) exit
        end do
        
        ! Copia a string C para uma string Fortran
        nome_fortran = ''
        do i = 1, str_len-1
            nome_fortran(i:i) = nome(i)
        end do
        
        ! Remove espaços em branco extras do final da string
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
        agenda(index)%numeros = numeros(1:numeros_len)
        
        print '("(from fortran) - Chave adicionada com sucesso!")'
    end subroutine

    subroutine print_agenda() bind(C)
        integer :: i, j
        
        print '("(from fortran) - Conteúdo da agenda telefônica:")'
        do i = 1, size(agenda)
            print '("Nome: ", A, ", Números: ", 100i0)', trim(agenda(i)%nome), agenda(i)%numeros
        end do
    end subroutine

end module
