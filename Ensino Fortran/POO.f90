program programacao_orientada_a_objetos
    implicit none
    
    type legal
        integer :: numero
        character(10) :: nome
    end type 

    type(legal) :: i = Legal(10, "Iniciar")
    
    print*, i%numero, i%nome ! São os campos do objeto Legal

end program programacao_orientada_a_objetos