% Declarando fatos dinamicos
:- dynamic objetivo/1, experiencia/1, disponibilidade/1.

% Base de dados de treinos com objetivos e detalhes
treino(hipertrofia, 'Treino para ganhar massa muscular: Supino reto (4x10), Agachamento livre (4x12), Levantamento terra (4x8), Rosca direta (3x12), Desenvolvimento com halteres (3x10).').
treino(perda_de_peso, 'Treino para emagrecer: Circuito de alta intensidade com Burpees (3x15), Polichinelos (3x30s), Flexoes de braco (3x10), Agachamentos com salto (3x12), Corrida na esteira (5x1 min com intensidade maxima).').
treino(condicionamento, 'Treino para condicionamento fisico: Corrida continua (30 min em ritmo moderado), Subida no step (3x15), Pular corda (3x2 min), Remada baixa (3x12), Abdominais (3x20).').
treino(resistencia, 'Treino para resistencia: Circuito com Remada curvada (4x10), Pullover (3x12), Leg press (4x15), Elevação lateral (3x12), Extensao de triceps (3x12).').

% Inicio do sistema de recomendacao de treinos
comecar :-
    write('Bem-vindo ao sistema de recomendacao de treinos!'), nl,
    write('Por favor, responda algumas perguntas para personalizarmos o treino para voce.'), nl,
    
    % Perguntar objetivo
    write('Qual e o seu objetivo principal? Temos as opcoes: ganhar_massa, emagrecer, condicionamento.'), nl,
    read(Objetivo), assert(objetivo(Objetivo)),

    % Perguntar experiencia
    write('Qual e a sua experiencia na academia? Temos as opcoes: iniciante, intermediario, avancado.'), nl,
    read(Experiencia), assert(experiencia(Experiencia)),

    % Perguntar disponibilidade
    write('Qual e a sua disponibilidade de tempo? Temos as opcoes: tempo_limitado, tempo_moderado, tempo_livre.'), nl,
    read(Disponibilidade), assert(disponibilidade(Disponibilidade)),
    
    % Recomendacao de treino com base nas respostas
    (treino_recomendado(Plano, Detalhes) ->
        format('Recomendamos o treino: ~w.~nDetalhes: ~w~n', [Plano, Detalhes])
    ;
        write('Nao encontramos um plano de treino ideal para suas preferencias. Por favor, consulte um profissional de educacao fisica.')
    ),
    limpar_respostas.

% Regras de recomendacao de treino
treino_recomendado(hipertrofia, Detalhes) :-
    objetivo(ganhar_massa),
    experiencia(intermediario),
    treino(hipertrofia, Detalhes).

treino_recomendado(perda_de_peso, Detalhes) :-
    objetivo(emagrecer),
    disponibilidade(tempo_limitado),
    treino(perda_de_peso, Detalhes).

treino_recomendado(condicionamento, Detalhes) :-
    objetivo(condicionamento),
    disponibilidade(tempo_moderado),
    treino(condicionamento, Detalhes).

treino_recomendado(resistencia, Detalhes) :-
    objetivo(ganhar_massa),
    experiencia(avancado),
    disponibilidade(tempo_livre),
    treino(resistencia, Detalhes).

% Limpar respostas para nova consulta
limpar_respostas :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).


consult('C:/Users/Ana Gabriela Lima/OneDrive/Área de Trabalho/diagnosticomedico.pl'). 