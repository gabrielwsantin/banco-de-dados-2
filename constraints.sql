-- Tipos de constraints no MySQL
 /*PRIMARY KEY FOREIGN KEY
Integridade entre tabelas

NOT NULL
Campo obrigatório

ENUM
Integridade entre tabelas

CHECK
Regra condicional
UNIQUE

Valor exclusivo

CASCADE
on delete
on update
DEFAULT
valor padrão

Usamos ENUM quando o campo
deve aceitar apenas valores
específicos predefinidos.
*/
-- ENUM
CREATE TABLE Beneficiarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_nascimento DATE,
sexo ENUM('M', 'F', 'Outro'),
cpf CHAR(11) UNIQUE,
status ENUM('Ativo', 'Inativo', 'Cancelado'),
plano_id INT,
data_adesao DATE );

-- UNIQUE
CREATE TABLE Beneficiarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_nascimento DATE,
sexo ENUM('M', 'F', 'Outro'),
cpf CHAR(11) UNIQUE,
status ENUM('Ativo', 'Inativo', 'Cancelado'),
plano_id INT,
data_adesao DATE );

-- CHECK — Regras condicionais
CREATE TABLE Beneficiarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_nascimento DATE CHECK (data_nascimento <= CURDATE()),
sexo ENUM('M', 'F', 'Outro'),
cpf CHAR(11) UNIQUE,
status ENUM('Ativo', 'Inativo', 'Cancelado'),
plano_id INT,
data_adesao DATE );

-- FOREIGN KEY


