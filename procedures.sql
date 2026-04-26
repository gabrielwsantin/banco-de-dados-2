-- STORED PROCEDURES NO SQL

DELIMITER //
CREATE PROCEDURE AtualizaEstoque(
 IN produto_id INT,
 IN quantidade_vendida INT
)
BEGIN
 UPDATE produtos
 SET estoque = estoque - quantidade_vendida
 WHERE id = produto_id
 AND estoque >= quantidade_vendida;
END
// DELIMITER ;

-- IN: Parâmetros de entrada que não são modificados pela procedure.
-- OUT: Parâmetros de saída que retornam valores da procedure.
-- INOUT: Parâmetros que servem tanto para entrada quanto para saída de dados.

-- IF = se
-- CASE = escolha
-- LOOP = repetir até sair
-- WHILE = enquanto condição verdadeira
-- REPEAT = repete até condição ser verdadeira