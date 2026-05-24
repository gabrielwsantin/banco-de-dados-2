-- PERMISSÕES E TRANSAÇÕES

-- Cria um novo usuário no MySQL:
CREATE USER 'fulano_de_tal'@'127.0.0.1' IDENTIFIED BY 'senha123456';

-- 2. Excluir user
DROP USER 'beltrano_de_tal'@'127.0.0.1';

-- Trocar senha
ALTER USER 'fulano_de_tal'@'127.0.0.1' IDENTIFIED BY '123456';

-- RENAME USER
RENAME USER 'usuario_antigo'@'host_antigo' TO 'usuario_novo'@'host_novo';

-- grant = permissão
GRANT ALL PRIVILEGES ON *.* TO 'fulano_de_tal'@'127.0.0.1';

-- Características ACID
/* 
Atomicidade
Garante que todas as operações em uma transação sejam executadas ou nenhuma
seja. No MySQL, se ocorrer um erro durante INSERT ou UPDATE em uma transação,
o ROLLBACK restaura o estado anterior.

Consistência
Assegura que a transação transforme o banco de um estado válido para
outro. No MySQL, constraints, triggers e regras de integridade são sempre
respeitadas após o COMMIT.

Isolamento
Impede que transações simultâneas afetem umas às outras. O
MySQL oferece diferentes níveis de isolamento (READ
UNCOMMITTED, READ COMMITTED, REPEATABLE READ,
SERIALIZABLE) para controlar a visibilidade.

Durabilidade
Garante que após o COMMIT, as alterações sejam
permanentemente salvas no banco de dados, mesmo em
caso de queda de energia ou falha do sistema. O MySQL
utiliza logs de transações para assegurar esta propriedade. */

-- compra de ingresso
START TRANSACTION;
-- Etapa 1: Inserir venda
INSERT INTO Vendas
(id_usuario, id_ingresso, data_venda, quantidade, total)
VALUES (4, 1, NOW(), 1, 850.00);
-- Etapa 2: Tornar ingresso indisponível
UPDATE Ingressos
SET disponivel = FALSE WHERE id_ingresso = 1;

-- SAVEPOINT depois_da_venda; ROLLBACK TO depois_da_venda; COMMIT

-- Níveis de Isolamento de Transações
/*
SERIALIZABLE
Maior isolamento, menor concorrência

REPEATABLE READ
Padrão do MySQL, bom equilíbrio

READ COMMITTED
Vê apenas dados confirmados

READ UNCOMMITTED
Menor isolamento, maior concorrência
*/

-- Tipos de Permissões no MySQL
/*
Permissões de Leitura
SELECT
SHOW VIEW

Permissões Administrativas
GRANT OPTION
SUPER
PROCESS

Permissões de Escrita
INSERT
UPDATE
DELETE

Permissões de Estrutura
CREATE
ALTER
DROP
