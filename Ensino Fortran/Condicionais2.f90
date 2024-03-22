program select_case
    implicit none
    
    ! Declarando Variáveis
    integer :: i = 5
    character :: letra = "v"

    !Execução

    select case (i)
        case (1:4, 7:10) 
            print*, "O numero esta entre 5 e 6"
        case (5)
            print*, "O numero e 5"
    end select


    select case (letra)
        case ("a":"n")
            print*, "Letra entre a e n"
        case default
            stop !sai de todo o programa, exit sai do loop
    end select

end program select_case
