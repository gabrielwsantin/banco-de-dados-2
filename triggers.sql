-- TRIGGERS NO SQL

-- Triggers servem para executar ações automaticamente quando acontece algum evento em uma tabela.

/* MOLDE:
DELIMITER //
CREATE TRIGGER nome_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nome_tabela
FOR EACH ROW
BEGIN
 -- Instruções SQL
END;
// DELIMITER ;
*/

/*
OLD
Valor antigo da linha.
Usado em:
UPDATE
DELETE

NEW
Valor novo da linha.
Usado em:
INSERT
UPDATE
*/

