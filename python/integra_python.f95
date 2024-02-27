module integra_python
    use iso_c_binding
    integer :: my_module_internal_state = 0 

contains

    subroutine check() bind(C)
        print '("(from fortran) internal state is ", i0)', my_module_internal_state
    end subroutine

    subroutine soma(a, b, c) bind(C, name='soma')
        real(c_double), intent(in)  :: a, b
        real(c_double), intent(out) :: c

        c = a + b

        if (c > 0) then
            print '("(from fortran) state changed!")'
            my_module_internal_state = -1
        else
            print '("(from fortran) state changed!")'
            my_module_internal_state = +1
        end if
    end subroutine

end module
