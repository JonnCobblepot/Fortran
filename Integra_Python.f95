! Exemplo de rotina simples em Fortran
subroutine soma(a, b, c)
    real, intent(in) :: a, b
    real, intent(out) :: c
    
    c = a + b
end subroutine soma

    