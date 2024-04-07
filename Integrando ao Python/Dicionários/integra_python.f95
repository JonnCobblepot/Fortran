module integra_python
    use iso_c_binding
    implicit none
    
    ! Definição do tipo telefone
    type :: telefone
        character(len=100) :: nome
        integer(c_size_t) :: numero
    end type telefone
    
    ! Declaração da variável agenda como um array de telefones
    type(telefone), allocatable :: agenda(:)
    
contains
    
    ! Subrotina para verificar o estado da agenda
    subroutine check() bind(C)
        ! Verifica se a agenda já foi alocada
        print '("(from fortran) - Check state of dictionary: allocated? ", g0)', allocated(agenda)
    end subroutine check
        
    ! Subrotina para adicionar um contato à agenda
    subroutine adicionar_chave(nome, nome_len, numero) bind(C)
        character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_size_t), value :: nome_len
        integer(c_size_t), value :: numero
        integer(c_size_t) :: i, index
        character(len=nome_len) :: nome_fortran
        type(telefone) :: new_telefone
        print '("(from fortran) - inside adicionar_chave")'
        
        ! Convertendo nome para uma string Fortran
        do i = 1, nome_len
            nome_fortran(i:i) = nome(i)
        end do

        ! Cria nova entrada
        new_telefone % nome = nome_fortran
        new_telefone % numero = numero

        ! Verifica se a agenda está alocada
        if (allocated(agenda)) then
            ! Verifica se a chave já existe na agenda
            index = findloc(agenda(:) % nome == nome_fortran, .true., 1)
            ! Se a chave não existe, adicione-a à agenda
            if (.not. index > 0) then
                agenda = [ agenda, new_telefone ]
            end if
        else ! Caso contrário aloca a primeira entrada
            agenda = [ new_telefone ]
        end if

        print '("(from fortran) - Chave adicionada com sucesso!")'
        
    end subroutine adicionar_chave
        
    ! Subrotina para modificar um contato existente na agenda
    subroutine alterar_contato(nome, nome_len, novo_nome, novo_nome_len, novo_numero) bind(C)
        character(kind=c_char), dimension(*), intent(in) :: nome, novo_nome
        integer(c_size_t), value :: nome_len, novo_nome_len, novo_numero
        integer(c_size_t) :: index
        
        character(len=50) :: nome_fortran, novo_nome_fortran
        
        ! Convertendo nome para uma string Fortran
        nome_fortran = c_to_f_string(nome, nome_len)
        
        ! Convertendo novo_nome para uma string Fortran
        novo_nome_fortran = c_to_f_string(novo_nome, novo_nome_len)

        ! Verificar se o contato existe
        index = findloc(agenda(:) % nome == nome_fortran, .true., 1)
        if (index > 0) then
            agenda(index) % nome = novo_nome_fortran
            agenda(index) % numero = novo_numero
            print '("(from fortran) - Contato modificado com sucesso!")'
            return
        end if

        print '("(from fortran) - Contato não encontrado!")'
    end subroutine alterar_contato
   
    ! Subrotina para excluir um contato da agenda
    subroutine excluir_contato(nome, nome_len) bind(c)
        character(kind=c_char), dimension(*), intent(in) :: nome
        integer(c_size_t), value :: nome_len
        integer(c_size_t) :: index, new_size
        type(telefone), allocatable :: temp(:)
        character(len=nome_len) :: temp_nome

        temp_nome = c_to_f_string(nome,nome_len)
        
        ! Função para encontrar o índice do contato na agenda
        index = findloc(agenda(:) % nome == temp_nome, .true., 1)
        
        ! Se o contato existe, exclua-o da agenda
        if (index > 0) then
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
        integer(c_size_t) :: i
        
        print '("(from fortran) - Conteúdo da agenda telefônica:")'
        do i = 1, size(agenda)
            print '("Nome: ", A, ", Número: ", I0)', trim(agenda(i)%nome), agenda(i)%numero
        end do
    end subroutine print_agenda

    ! Função útil para converter strings do C para o Fortran
    function c_to_f_string(c_string, c_size) result(f_string)
        character(c_char), intent(in) :: c_string(*)
        integer(c_size_t), intent(in) :: c_size
        character(len=c_size) :: f_string
        integer(c_size_t) :: i
        do i=1,c_size
            f_string(i:i) = c_string(i)
        end do
    end function

end module integra_python
