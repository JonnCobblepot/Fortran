program sistema_de_alarme
    implicit none

    ! Declarando variáveis
    character (len = 20) :: porta, janela1, janela2
    logical :: situacao, sit_porta, sit_janela1, sit_janela2

    ! Situações
    porta = "fechada"
    janela1 = "aberta"
    janela2 = "fechada"

    ! Execução

    write (*,*) "A porta esta aberta? ", porta == "aberta", new_line("a") ! == é comparação

    situacao = porta == "aberta" .or. janela1 == "aberta" .or. janela2 == "aberta"
    write (*,*) "Ha alguma entrada aberta? ", situacao, new_line("a") ! é convencional "a", representa quebra de linha

    write (*,*) "O alarme esta desligado? ", .not. situacao

    situacao = janela1 == "aberta" .and. janela2 == "aberta"
    write (*,*) new_line("a"), "Todas as janelas estao abertas? ", situacao

    ! Convertendo as strings em variáveis lógicas
    sit_porta = (porta == "aberta")
    sit_janela1 = (janela1 == "aberta")
    sit_janela2 = (janela2 == "aberta")
    situacao = (sit_porta .eqv. sit_janela1) .and. (sit_janela1 .eqv. sit_janela2)
    write (*,"(/, A, 1X, L)") "Todas as janelas estao na mesma condicao?", situacao
    
end program sistema_de_alarme