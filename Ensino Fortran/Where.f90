program where
    implicit none
    
    ! Declarando tipos
    integer :: i
    integer, dimension(10) :: x, y, z
    real, dimension(10, 10) :: a, c

    ! Formatação
    20 format(10I3)
    21 format(10F7.4)

    ! Execução
    x = [(i, i=1, 10)]
    y = x(10:1:-1)
    z = 0

    where (x < 5) z = x
    write (*,20) z
    z = 0

    where (x < 5) 
        z = 2*x
    else where (x == 7)
        z = 0
    else where
        z = 1
    end where
    write (*,20) z

    c = 0.0
    call random_number(a)
    where (a < 0.5) a = c
    write(*,21) a

end program where