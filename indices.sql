-- ÍNDICES
/*
Um índice é uma estrutura auxiliar que o banco
de dados cria fora da tabela principal, com o
objetivo de acelerar buscas, ordenações e
filtragens.

PRIMARY KEY
Índice exclusivo e obrigatório que identifica cada linha (só pode haver um
por tabela).

UNIQUE
Impede duplicatas em uma coluna (ou conjunto de colunas).

INDEX (ou KEY)
Usado para acelerar buscas (pode haver vários por tabela).

FULLTEXT
Usado para buscar palavras em textos longos (tipo Google).
*/

-- Explicação do profiling - OBSOLETO
-- Com o profiling ativado, o MySQL vai armazenar estatísticas sobre quanto tempo essa query levou para ser executada

-- Removendo índices temporariamente
-- removendo temporariamente
ALTER TABLE vendas DROP INDEX idx_cliente;
ALTER TABLE vendas DROP INDEX idx_data;
-- Testando performance
SET profiling = 1;
SELECT * FROM vendas WHERE cliente_id = 123456;
SHOW PROFILES;

EXPLAIN ANALYZE SELECT * FROM vendas WHERE cliente_id = 123456;
-- cost=0.35 rows=1:
/*O custo de realizar essa operação de busca foi estimado em 0.35 (geralmente uma medida interna do plano de execução do banco de
dados, que pode ser um valor abstrato, mas relacionado ao tempo e aos recursos necessários para executar a operação).
O número de linhas estimado como resultado da operação é 1. Isso significa que a consulta espera encontrar uma única linha (ou
registro) para o cliente_id=123456.*/

-- indice normal	
-- Busca valores exatos
-- FULLTEXT
-- Busca palavras em textos

-- MATCH(conteudo) → coluna onde será feita a busca.
-- AGAINST('mysql') → termo procurado.
SELECT *
FROM artigos
WHERE MATCH(conteudo)
AGAINST('mysql');

