# --- ANÁLISES DE DADOS COM SQL --- #

-- Agrupamentos
-- Filtragem em agrupamentos
-- Subqueries
-- Criação de Views

-- Lembrando das tabelas do banco de dados...

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

# =======        PARTE 1:        =======#
# =======  CRIANDO AGRUPAMENTOS  =======#

-- CASE 1. Você deverá começar fazendo uma análise para descobrir o preço médio de aluguel dos filmes.

select round(AVG(preco_aluguel),2) as preco_medio from filmes;

-- CASE 2. Agora que você sabe o preço médio para se alugar filmes na hashtagmovie, você deverá ir além na sua análise e descobrir qual é o preço médio para cada gênero de filme.

select genero, round(avg(preco_aluguel),2) as preco_medio from filmes
group by genero;  

/*
genero                   | preco_medio
______________________________________
Comédia                  | X
Drama                    | Y
Ficção e Fantasia        | Z
Mistério e Suspense      | A
Arte                     | B
Animação                 | C
Ação e Aventura          | D
*/

-- CASE 3. Adicionando a quantidade de Filmes:

select genero, round(avg(preco_aluguel),2) as preco_medio, count(*) from filmes
group by genero; 

# =======              PARTE 2:               =======#
# =======       FILTROS EM AGRUPAMENTOS       =======#

-- Você deve alterar a consulta DO CASE 2 e considerar o seguinte cenário:

-- CASE 3: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.

select genero, ano_lancamento, round(avg(preco_aluguel),2)  as preco_medio, count(*) from filmes where ano_lancamento = '2011'
group by genero;  


# =======                         PARTE 3:                           =======#
# =======  SUBQUERIES: UTILIZANDO UM SELECT DENTRO DE OUTRO SELECT   =======#

-- CASE 4. Você precisará fazer uma análise de desempenho dos alugueis. Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média. Você seria capaz de fazer isso?

SELECT round(AVG(nota),2) FROM alugueis; -- 7,94

select * from alugueis;

select * from alugueis where nota >= 7.94;

select * from alugueis where nota >= (SELECT round(AVG(nota),2) FROM alugueis);

# =======           PARTE 4:             =======#
# =======  Criando Views - CREATE VIEW   =======#


-- CREATE/DROP VIEW: Guardando o resultado de uma consulta no nosso banco de dados


-- CASE 5. Crie uma view para guardar o resultado do SELECT abaixo.

CREATE VIEW resultado AS
SELECT genero, ROUND(AVG(preco_aluguel), 2) AS media_preco, COUNT(*) AS qtd_filmes FROM filmes
GROUP BY genero;

SELECT * FROM resultado;

