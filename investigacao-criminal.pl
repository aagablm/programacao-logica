:- dynamic impressao_digital/1.
:- dynamic motivo/1.
:- dynamic testemunha/1.
:- dynamic relacao/1.

suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
suspeito(maria) :- testemunha(vista_no_lugar_crime), motivo(revenge).
suspeito(carlos) :- impressao_digital(lugar_crime), motivo(pessoal).
teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
teoria(crime_pre_meditado) :- impressao_digital(lugar_crime), motivo(pre_meditado).

investigar :-
    retractall(impressao_digital(_)),
    retractall(motivo(_)),
    retractall(testemunha(_)),
    retractall(relacao(_)),

    write('Foi encontrada uma impressao digital no local do crime? (s/n)'), nl,
    read(ImpressaoDigital),
    (ImpressaoDigital = s -> assert(impressao_digital(lugar_crime)); true),

    write('Ha um motivo financeiro envolvido? (s/n)'), nl,
    read(MotivoFinanceiro),
    (MotivoFinanceiro = s -> assert(motivo(financeiro)); true),

    write('O motivo parece ser vinganca? (s/n)'), nl,
    read(MotivoVinganca),
    (MotivoVinganca = s -> assert(motivo(revenge)); true),

    write('O motivo e de natureza pessoal? (s/n)'), nl,
    read(MotivoPessoal),
    (MotivoPessoal = s -> assert(motivo(pessoal)); true),

    write('O motivo e premeditado? (s/n)'), nl,
    read(MotivoPreMeditado),
    (MotivoPreMeditado = s -> assert(motivo(pre_meditado)); true),

    write('Ha alguma testemunha que viu o suspeito no local do crime? (s/n)'), nl,
    read(TestemunhaNoLocal),
    (TestemunhaNoLocal = s -> assert(testemunha(vista_no_lugar_crime)); true),

    write('Alguma testemunha viu uma discussao entre a vitima e o suspeito? (s/n)'), nl,
    read(TestemunhaDiscussao),
    (TestemunhaDiscussao = s -> assert(testemunha(visto_discutindo)); true),

    write('O suspeito tinha uma relacao intima com a vitima? (s/n)'), nl,
    read(RelacaoIntima),
    (RelacaoIntima = s -> assert(relacao(intima)); true),

    (suspeito(Suspeito) -> 
        write('O suspeito potencial e: '), write(Suspeito), nl; 
        write('Nenhum suspeito identificado com as evidencias fornecidas.'), nl),

    (teoria(Teoria) -> 
        write('A teoria do crime e: '), write(Teoria), nl; 
        write('Nenhuma teoria conclusiva foi encontrada.'), nl).