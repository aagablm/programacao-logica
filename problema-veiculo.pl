:- dynamic sintoma/1.

problema(problema_no_freio) :- sintoma(ruido_ao_frear), sintoma(vibracao_no_volante).
problema(problema_de_arrefecimento) :- sintoma(superaquecimento_motor), sintoma(vazamento_liquido).
problema(problema_na_bateria) :- sintoma(dificuldade_na_partida), sintoma(luz_de_bateria_painel).
problema(problema_na_suspensao) :- sintoma(ruidos),sintoma(carro_puxando),sintoma(desgaste_irregular_pneu).


diagnosticar :-
    retractall(sintoma(_)),

    write('O carro faz ruido ao frear? (s/n)'), nl,
    read(RuidoAoFrear),
    (RuidoAoFrear = s -> assert(sintoma(ruido_ao_frear)); true),

    write('O volante do carro vibra ao frear? (s/n)'), nl,
    read(VibracaoVolante),
    (VibracaoVolante = s -> assert(sintoma(vibracao_no_volante)); true),

    write('O motor do carro esta super aquecendo (indicador de temperatura acima do normal)? (s/n)'), nl,
    read(SuperaquecimentoMotor),
    (SuperaquecimentoMotor = s -> assert(sintoma(superaquecimento_motor)); true),

    write('Ha vazamento de liquido? (s/n)'), nl,
    read(VazamentoLiquido),
    (VazamentoLiquido = s -> assert(sintoma(vazamento_liquido)); true),

    write('O carro tem dificuldade para dar partida? (s/n)'), nl,
    read(DificuldadePartida),
    (DificuldadePartida = s -> assert(sintoma(dificuldade_na_partida)); true),

    write('O carro tem uma luz de advertencia da bateria acesa no painel? (s/n)'), nl,
    read(LuzBateriaPainel),
    (LuzBateriaPainel = s -> assert(sintoma(luz_de_bateria_painel)); true),

    write('A suspensao esta fazendo barulho? (s/n)'), nl,
    read(Ruidos),
    (Ruidos = s -> assert(sintoma(ruidos)); true),

    write('A direcao do carro esta puxando? (s/n)'), nl,
    read(CarroPuxando),
    (CarroPuxando = s -> assert(sintoma(carro_puxando)); true),

    write('Os pneus tem desgaste irregular? (s/n)'), nl,
    read(DesgasteIrregularPneu),
    (DesgasteIrregularPneu = s -> assert(sintoma(desgaste_irregular_pneu)); true),

    (problema(Problema) -> write('O carro esta com o problema: '), write(Problema), nl; write('Nao foi possivel identificar uma doenca com esses sintomas.'), nl).

