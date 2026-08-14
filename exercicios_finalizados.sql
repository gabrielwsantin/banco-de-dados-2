CREATE DATABASE db_company;
use db_company;

/*criar a tabela tb_cargo*/
CREATE TABLE tb_cargo (
    id_cargo INT NOT NULL PRIMARY KEY,
    nm_cargo VARCHAR(60) NOT NULL,
    salario DECIMAL(9 , 2 ) NOT NULL
);

/*criar a tabela departamento*/ 
CREATE TABLE tb_departamento (
    id_departamento INT NOT NULL PRIMARY KEY,
    nm_departamento VARCHAR(40) NOT NULL
);

/*criar a tabela departamento*/ 
CREATE TABLE tb_empregado (
    matricula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sexo ENUM('F', 'M') NOT NULL,
    dt_admissao DATE NOT NULL,
    fk_cargo INT NOT NULL,
    fk_departamento INT NOT NULL,
    FOREIGN KEY (fk_cargo)
        REFERENCES tb_cargo (id_cargo),
    FOREIGN KEY (fk_departamento)
        REFERENCES tb_departamento (id_departamento)
);

-- Inserir valores na tabela tb_cargo
insert into tb_cargo 
(id_cargo, nm_cargo, salario) values
(1, 'Advogado', 9200.00),
(2 , 'Administrador', 6500.00),
(3, 'Contador', 5600.00),
(4, 'Estagiário', 980.00),
(5, 'Gerente de Projeto', 8300.00),
(6, 'Programador', 7500.00),
(7, 'Administrador de Banco de Dados', 5990.00),
(8, 'Cientista de Dados', 8700.00),
(9, 'Secretária', 2200.00);

-- Inserir valores na tabela tb_departamento
INSERT INTO tb_departamento
(id_departamento, nm_departamento) VALUES
(100, 'Administrativo'),
(200, 'Jurídico'),
(300, 'Contábil'),
(400, 'Tecnologia da Informação'),
(500, 'Recursos Humanos'),
(600, 'Comercial'),
(700, 'Financeiro');

-- Inserir valores na tabela tb_empregado
INSERT INTO tb_empregado(matricula, nome, dt_nascimento, sexo,
dt_admissao, fk_cargo, fk_departamento) VALUES
(123, 'Vânia Alves', '1967-07-02', 'F', '2010-12-08', 2, 100),
(124, 'Florisbela Silva', '1999-10-02', 'F', '2019-10-01', 1, 200),
(125, 'Walter Amaral', '1998-02-02', 'M', '2018-05-25', 7, 400),
(126, 'Ana Cristina Peixoto', '1980-03-02', 'F', '2018-10-02', 4, 200),
(127, 'Clara Rodrigues', '1998-07-05', 'F', '2020-10-02', 4, 400),
(128, 'Flávio Luiz Silva', '1990-09-05', 'M', '2016-02-15', 6, 400),
(129, 'Roberto Oliveira', '1981-03-10', 'M', '2012-12-10', 8, 400),
(130, 'Cristina Moura', '1980-12-20', 'F', '2020-10-02', 9, 100),
(131, 'Gabriel Silva Costa', '1985-10-2', 'M', '2017-01-02', 3,300);

-- Contar quantidade de empregados
SELECT count(*) from tb_empregado;

-- Faz a média de salario dos cargos
SELECT 
	round(AVG(salario), 2) AS salario_medio
FROM
	tb_cargo;
  
-- Busca o salário mais alto
SELECT
	MAX(salario) AS maior_salario
FROM
	tb_cargo;
    
-- Busca o salário mais baixo
SELECT
	MIN(salario) AS menor_salario
FROM
	tb_cargo;

/* Seleciona: 
- "Nome do departamento" e 
- Conta as matriculas da tabela "tb_empregado" para a coluna "total_empregados".

'tb_empregado e' o "e" simplifica o nome da tabela, assim como 'tb_departamento d'.

Objetivo:
Selecionar nome do departamento da tabela 'd'(tb_departamento) e 
Contagem das matriculas da tabela 'e'(tb_empregados)
Quando (on) a chave estrangeira da tabela 'e' (e.fk_departamnto) 
for igual ao id da tabela 'd' (d.id_departamento)

Agrupando (group by) pelo nome do departamento.
*/
SELECT 
	d.nm_departamento, 
    COUNT(e.matricula) AS total_empregados
FROM 
	tb_empregado e
    join tb_departamento d 
    on e.fk_departamento=d.id_departamento
group by d.nm_departamento;
/*
show databases;

SHOW TABLES;
*/

/* 1*/
SELECT count(*) from tb_empregado;

/*2*/
select sum(salario) as total_salario from tb_cargo;

/*3*/
select round(avg(salario),2) as media_salario from tb_cargo;

/*4*/
select max(salario) as maior_salario from tb_cargo;

/*5*/
select min(salario) as menor_salario from tb_cargo;

/*6*/
select count(id_departamento) as total_departamentos from tb_departamento;

/*7*/
select nm_cargo,
	(select (count(*))
    from tb_empregado e
    where e.fk_cargo = c.id_cargo) as quantidade_empregados
from tb_cargo c;

/*8*/
select nm_cargo,
	round(
    (select avg(salario)
    from tb_cargo c2
    where c2.id_cargo = c.id_cargo) ,2)
    as salario_medio
from tb_cargo c;

/*9*/
select nm_departamento
from tb_departamento d
where (
	select count(*)
    from tb_empregado e
    where e.fk_departamento = d.id_departamento
) > 2;

/*10*/
select nm_cargo as maximo_salario
from tb_cargo c
where salario = 
	(select max(salario)
    from tb_cargo c);

/*11*/
select nm_cargo as minimo_salario
from tb_cargo c
where salario =
	(select min(salario)
    from tb_cargo c);
    
/*12*/
select matricula as salario_acima_da_media
from tb_empregado e
where (
	select salario
    from tb_cargo c
    where c.id_cargo = e.fk_cargo) > (
    select avg(salario) from tb_cargo);
    
    
    

