program estudando_variveis
    implicit none

!Seção de Declaração
    !Tipos
    INTEGER :: massa
    REAL :: aceleracao
    COMPLEX :: posicao
    LOGICAL :: olimpiada = .true.
    CHARACTER (len = 30) :: discurso
    REAL, PARAMETER :: numero_Pi = 3.14

    !Variáveis
    massa = 75
    aceleracao = 2.75
    posicao = (6 , 2) ! 6 + 2i
    discurso = "Voce ganhou a corrida"

    !Seção de Execução
    Write(*,*) "Sua massa:" , massa
    Write(*,*) "Sua aceleracao:" , aceleracao
    Write(*,*) "Participacao no evento:" , olimpiada
    Write(*,*) "Meus parabens! " , discurso
    Write(*,*) "Valor de Pi" , numero_Pi
    Write(*,*) "Sua posicao no espaco-tempo", posicao

    Write(*,*) "Maior valor inteiro desse programa" , huge(massa) ! 2**32 bits (**0.5 pelos negativos e positivos)
    Write(*,*) "Menor valor real positivo desse programa" , tiny(aceleracao)

end program estudando_variveis