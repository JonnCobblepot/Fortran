module integra_python
    use iso_c_binding
    integer :: my_module_internal_state = 0 

contains

    subroutine check() bind(C)
        print '("(from fortran) - Internal state is ", i0)', my_module_internal_state
    end subroutine


    subroutine matriz(nlinhas, ncolunas, mat) bind(C, name = 'matriz')
        implicit none
        integer(c_int), intent(in) :: nlinhas, ncolunas
        integer(c_int), intent(out) :: mat(nlinhas, ncolunas)
        integer :: i
        
        07 format (A, I0, A, I0)
        write (*, 07) "(from Fortran) - Dimensões recebidas: nlinhas = ", nlinhas, ", ncolunas = ", ncolunas
        
        mat = reshape( source = [(i, i=0, 100, 5)] , shape = [nlinhas,ncolunas] , order = [1,2], pad = [0]) ! pad completa a matriz
    
        if (nlinhas > 0 .and. ncolunas > 0) then
            print '("(from fortran) - State changed!")'
            my_module_internal_state = -1
        else
            print '("(from fortran) - State changed!")'
            my_module_internal_state = +1
        end if

    end subroutine

end module
