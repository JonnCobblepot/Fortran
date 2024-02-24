program functions_interna
    implicit none  ! Entre o programa principal e o contains, será a execução dos programas

    integer :: v, z, a, b
    
    write(*,"(/, A)") "Digite um numero para saber o seu fatorial:"
    read (*,*) v
    write(*,"(/, A, I2, A, I6, /)") "Fatorial de ", v, " = ", fatorial(v)

    write(*,"(A)") "Digite um numero para saber a sua potencia ao quadrada:"
    read (*,*) z
    write(*,"(/, I2, A, I3, /)")  z, " elevado ao quadrado = ", potencia(z)

    write(*,"(A)") "Digite dois numeros para saber sua soma:"
    read (*,*) a, b
    write(*,"(/, I3, A, I3, A, I4, /)")  a, " + ", b, " = ", soma(a, b)

    contains     ! As funções são declaradas após o contains, mas podem ser fora do programa também, ou em módulos

        function fatorial( v )
           integer :: fatorial
           integer :: v, x, i

           x = 1
           do i=1, v
            x = i*x
           end do

           fatorial = x

        end function fatorial 

        function potencia( z ) 
            integer :: potencia, z
            
            potencia = z**2

        end function potencia

        function soma( a, b )
            integer :: soma
            integer, intent(inout) :: a ! permite que a variável seja mexida, intent(in), trava ela e não pode ser alterada
            integer, value :: b ! com value, só pode modificar a variável dentro da função, do bloco da função

            soma = a + b

        end function soma

end program functions_interna