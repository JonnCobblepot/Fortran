module integra_python
    use iso_c_binding
    implicit none
    
    ! Definição do tipo telefone
    type :: telefone
        character(len=50) :: nome
        integer :: numero
    end type telefone
    
    ! Declaração da variável agenda como um array de telefones
    type(telefone), allocatable :: agenda(:)
    
contains
    
    ! Subrotina para verificar o estado da agenda
    subroutine check() bind(C)
        
        ! Verifica se a agenda já foi alocada antes de alocá-la novamente
        if (.not. allocated(agenda)) then
            allocate(agenda(0))
        end if
        
        print '("(from fortran) - Check state of dictionary")'
    end subroutine check
        
    ! Subrotina para adicionar um contato à agenda
    subroutine adicionar_chave(nome, nome_len, numero) bind(C)
        character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_int) :: nome_len, numero
        integer :: i, index
        character(len=50) :: nome_fortran
        
        ! Convertendo nome para uma string Fortran
        nome_fortran = ''
        do i = 1, min(nome_len, 50)
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
            allocate(agenda(index))
        end if
        
        agenda(index)%nome = nome_fortran
        agenda(index)%numero = numero
        
        print '("(from fortran) - Chave adicionada com sucesso!")'
    end subroutine adicionar_chave
        
    ! Subrotina para modificar um contato existente na agenda
    subroutine alterar_contato(nome, nome_len, novo_nome, novo_nome_len, novo_numero) bind(C)
        character(kind=c_char), dimension(*), intent(in) :: nome, novo_nome
        integer(c_int) :: nome_len, novo_nome_len, novo_numero
        integer :: i
        
        character(len=50) :: nome_fortran, novo_nome_fortran
        
        ! Convertendo nome para uma string Fortran
        nome_fortran = ''
        do i = 1, min(nome_len, 50)
            if (nome(i) == c_null_char) exit
            nome_fortran(i:i) = nome(i)
        end do
        nome_fortran = adjustl(trim(nome_fortran))
        
        ! Convertendo novo_nome para uma string Fortran
        novo_nome_fortran = ''
        do i = 1, min(novo_nome_len, 50)
            if (novo_nome(i) == c_null_char) exit
            novo_nome_fortran(i:i) = novo_nome(i)
        end do
        novo_nome_fortran = adjustl(trim(novo_nome_fortran))
        
        ! Verificar se o contato existe
        do i = 1, size(agenda)
            if (trim(adjustl(agenda(i)%nome)) == trim(adjustl(nome_fortran))) then
                agenda(i)%nome = novo_nome_fortran
                agenda(i)%numero = novo_numero
                print '("(from fortran) - Contato modificado com sucesso!")'
                return
            end if
        end do
    
        print '("(from fortran) - Contato não encontrado!")'
    end subroutine alterar_contato
   
    ! Subrotina para excluir um contato da agenda
    subroutine excluir_contato(nome, nome_len)
        character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_int), value :: nome_len
        integer(c_int) :: index, new_size
        type(telefone), allocatable :: temp(:)
        integer :: find_index
        external :: find_index
        
        ! Função para encontrar o índice do contato na agenda
        index = find_index(nome, nome_len)
        
        ! Se o contato existe, exclua-o da agenda
        if (index /= 0) then
            ! Definindo novo tamanho para a agenda
            new_size = size(agenda) - 1
            
            ! Criando uma nova matriz temporária para armazenar os contatos excluindo o contato desejado
            allocate(temp(new_size))
            temp(1:index-1) = agenda(1:index-1)
            temp(index:new_size) = agenda(index+1:size(agenda))
            
            ! Desalocando a matriz agenda anterior
            deallocate(agenda)
            
            ! Realocando a matriz agenda com base na nova matriz temporária
            allocate(agenda(new_size))
            agenda = temp
            
            ! Desalocando a matriz temporária
            deallocate(temp)
        else
            print *, 'Contato não encontrado na agenda.'
        end if
    end subroutine excluir_contato
    
    ! Subrotina para imprimir o conteúdo da agenda
    subroutine print_agenda() bind(C)
        integer :: i
        
        print '("(from fortran) - Conteúdo da agenda telefônica:")'
        do i = 1, size(agenda)
            print '("Nome: ", A, ", Número: ", I0)', trim(agenda(i)%nome), agenda(i)%numero
        end do
    end subroutine print_agenda
    
end module integra_python