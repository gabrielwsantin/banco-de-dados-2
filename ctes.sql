-- CTES NO SQL

-- Conjuntos de resultados nomeados temporários que podem ser referenciados dentro de uma consulta SELECT, INSERT, UPDATE ou DELETE.

WITH AnunciosComMensagens AS (
SELECT anuncio_id, COUNT(*) AS total_mensagens
FROM mensagens
GROUP BY anuncio_id
HAVING COUNT(*) > 1
)
-- Consulta final para exibir os anúncios e seus títulos
SELECT a.titulo, acm.total_mensagens
FROM anuncios a
JOIN AnunciosComMensagens acm ON a.anuncio_id = acm.anuncio_id;

-- UNION: sem duplicados
-- UNION ALL: com duplicados
-- INTERSECT serve para mostrar apenas os valores que existem nas duas consultas ao mesmo tempo.
-- EXCEPT serve para mostrar o que está na primeira consulta e não está na segunda.