% Declarando generos e interesses como fatos dinamicos
:- dynamic genero/1, interesse/1.

% Base de dados de livros com generos e interesses
livro('Duna', ficcao_cientifica, aventura, 'Um epico de ficcao cientifica sobre politica, religiao e poder em um futuro distante.').
livro('Jane Eyre', romance, drama, 'A vida e os desafios de uma jovem orfa em busca de independencia e amor.').
livro('Cosmos', ciencia, astronomia, 'Carl Sagan explora os misterios do universo e a ciencia por tras de sua formacao.').
livro('Como Fazer Amigos e Influenciar Pessoas', autoajuda, comunicacao, 'Dicas praticas para melhorar relacionamentos interpessoais e profissionais.').
livro('O Guia do Mochileiro das Galaxias', comedia, aventura, 'Uma saga comica e absurda pelo universo.').
livro('O Conde de Monte Cristo', classico, vinganca, 'Um homem busca vinganca apos ser traido e preso injustamente.').
livro('Assassinato no Expresso do Oriente', misterio, crime, 'Hercule Poirot investiga um assassinato a bordo de um luxuoso trem.').
livro('Meditacoes', filosofia, introspeccao, 'Reflexoes do imperador romano Marco Aurelio sobre a vida e virtude.').
livro('O Fisico', ficcao_historica, medicina, 'A jornada de um jovem medico na Idade Media em busca do conhecimento.').
livro('A Arte da Guerra', estrategia, lideranca, 'Um tratado classico sobre estrategia militar aplicavel a vida moderna.').

livro('A Cabana', ficcao, espiritualidade, 'Uma historia sobre perda, perdao e um encontro com Deus.').
livro('A Danca dos Dragoes', fantasia, intriga, 'Parte da serie Cronicas de Gelo e Fogo, repleta de dragoes e disputas por poder.').
livro('O Apocalipse dos Trabalhadores', contemporaneo, sociedade, 'Um olhar ironico e profundo sobre as vidas de trabalhadores comuns.').
livro('As Cronicas de Narnia', fantasia, moralidade, 'Um grupo de criancas descobre um mundo magico cheio de aventuras e licoes de vida.').
livro('A Revolucao dos Animais', ficcao_politica, alegoria, 'Uma releitura moderna da Revolucao dos Bichos com novos contextos sociais.').
livro('O Pequeno Manual Antirracista', contemporaneo, diversidade, 'Reflexoes praticas e diretas sobre como combater o racismo na sociedade.').
livro('Sherlock Holmes: O Cao dos Baskervilles', suspense, investigacao, 'O detetive Sherlock Holmes enfrenta um misterio envolvendo um cao sobrenatural.').
livro('A Republica', filosofia, politica, 'Platao explora a natureza da justica e a estrutura ideal de uma sociedade.').
livro('Anna Karenina', classico, relacoes_humanas, 'A tragica historia de amor de Anna Karenina na alta sociedade russa.').
livro('O Sol e Para Todos', contemporaneo, justica_social, 'Um drama sobre racismo e injustica no sul dos Estados Unidos.').

% Inicio do sistema de recomendacao
comecar :-
    write('Bem-vindo ao sistema de recomendacao de livros!'), nl,
    write('Por favor, escolha suas preferencias abaixo.'), nl,
    write('Qual genero literario voce prefere? Temos:'), nl,
    write('ficcao_cientifica, romance, ciencia, autoajuda, comedia, classico, misterio, filosofia, ficcao_historica, estrategia.'), nl,
    read(Genero), assert(genero(Genero)),
    write('Qual e o seu principal interesse? Temos:'), nl,
    write('aventura, drama, astronomia, comunicacao, introspeccao, medicina, lideranca, espiritualidade, intriga, diversidade.'), nl,
    read(Interesse), assert(interesse(Interesse)),
    
    % Recomendacao de livro com base no genero e interesse
    (livro(Titulo, Genero, Interesse, Sinopse) -> 
        format('Recomendamos o livro: ~w.~nSinopse: ~w~n', [Titulo, Sinopse])
    ; 
        (livro(TituloGenero, Genero, _, SinopseGenero) ->
            format('Nao encontramos um livro que combine todas as suas preferencias, mas recomendamos: ~w.~nSinopse: ~w~n', [TituloGenero, SinopseGenero])
        ;
            write('Nenhum livro encontrado com essas preferencias. Sugerimos visitar uma livraria para mais opcoes.')
        )
    ),
    limpar_preferencias.

% Limpar preferencias para nova consulta
limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).
