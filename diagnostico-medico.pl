:- dynamic sintoma/1.

doenca(gripe) :- sintoma(febre), sintoma(tosse), sintoma(cansaco). 
doenca(infeccao_viral) :- sintoma(febre), sintoma(enjoo). 
doenca(resfriado) :- sintoma(espirro); sintoma(tosse),sintoma(dor_garganta).
doenca(dengue) :- sintoma(febre),sintoma(cansaco),sintoma(dor_muscular). 
doenca(gravidez) :- sintoma(enjoo), sintoma(cansaco).
doenca(renite) :- sintoma(espirro).  
doenca(preguica) :- sintoma(cansaco). 
doenca(enxaqueca) :- sintoma(dor_de_cabeca). 


diagnosticar :-
    retractall(sintoma(_)),

    write('Voce tem febre? (s/n)'), nl,
    read(Febre),
    (Febre = s -> assert(sintoma(febre)); true),

    write('Voce tem dor de cabeca? (s/n)'), nl,
    read(DorDeCabeca),
    (DorDeCabeca = s -> assert(sintoma(dor_de_cabeca)); true),

    write('Voce tem tosse? (s/n)'), nl,
    read(Tosse),
    (Tosse = s -> assert(sintoma(tosse)); true),

    write('Voce tem dor de garganta? (s/n)'), nl,
    read(DorDeGarganta),
    (DorDeGarganta = s -> assert(sintoma(dor_garganta)); true),

    write('Voce tem dor muscular? (s/n)'), nl,
    read(DorMuscular),
    (DorMuscular = s -> assert(sintoma(dor_muscular)); true),

    write('Voce tem cansaco? (s/n)'), nl,
    read(Cansaco),
    (Cansaco = s -> assert(sintoma(cansaco)); true),

    write('Voce tem enjoo? (s/n)'), nl,
    read(Enjoo),
    (Enjoo = s -> assert(sintoma(enjoo)); true),

    write('Voce tem espirro? (s/n)'), nl,
    read(Espirro),
    (Espirro = s -> assert(sintoma(espirro)); true),

    (doenca(Doenca) -> write('Voce tem a doenca: '), write(Doenca), nl; write('Não foi possivel identificar uma doenca com esses sintomas.'), nl).

