module integra_python
    use iso_c_binding
    integer :: my_module_internal_state = 0 


contains

    subroutine check() bind(C)
        print '("(from fortran) - internal state is ", i0)', my_module_internal_state
    end subroutine

    subroutine vetor(elementos, n) bind(C, name = 'vetor')
        implicit none
        integer(c_int) :: elementos(n)
        integer(c_int) :: n
        integer :: i
        
        do i = 1, n
            elementos(i) = i 
        end do

        if (size(elementos) /= 0) then
            print '("(from fortran) - State changed!")'
            my_module_internal_state = -1
        else
            print '("(from fortran) - State changed!")'
            my_module_internal_state = +1
        end if

    end subroutine

end module