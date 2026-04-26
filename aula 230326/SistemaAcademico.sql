-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS SistemaAcademico;
USE SistemaAcademico;
-- Criando a tabela de Estudantes
CREATE TABLE Estudantes (
    id_estudante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
-- Criando a tabela de Professores
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
-- Criando a tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);
-- Criando a tabela de Matrículas
CREATE TABLE Matriculas (
    id_estudante INT NOT NULL,
    id_disciplina INT NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_estudante, id_disciplina, semestre),
    FOREIGN KEY (id_estudante) REFERENCES Estudantes(id_estudante),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- Inserindo dados fictícios
-- Inserindo Estudantes
INSERT INTO Estudantes (nome, email) VALUES
('Alice Souza', 'alice@email.com'),
('Bruno Lima', 'bruno@email.com'),
('Carlos Mendes', 'carlos@email.com');

-- Inserindo Professores
INSERT INTO Professores (nome) VALUES
('Dr. Ricardo Silva'),
('Profa. Juliana Costa'),
('Dr. Marcos Ribeiro');

-- Inserindo Disciplinas
INSERT INTO Disciplinas (nome, id_professor) VALUES
('Banco de Dados', 1),
('Estruturas de Dados', 2),
('Algoritmos', 3);

-- Inserindo Matrículas
INSERT INTO Matriculas (id_estudante, id_disciplina, semestre) VALUES
(1, 1, '2024.1'),
(1, 2, '2024.1'),
(2, 1, '2024.1'),
(3, 3, '2024.1'),
(2, 3, '2024.1');

-- Quais disciplinas a Alice Souza está cursando e quem são os professores?
SELECT 
    e.nome AS Estudante,
    d.nome AS Disciplina,
    p.nome AS Professor
FROM
    Matriculas m
        JOIN
    Estudantes e ON m.id_estudante = e.id_estudante
        JOIN
    Disciplinas d ON m.id_disciplina = d.id_disciplina
        JOIN
    Professores p ON d.id_professor = p.id_professor
WHERE
    e.nome = 'Alice Souza';

-- Quais alunos estão cursando Algoritmos e em qual semestre?
SELECT 
    e.nome AS Estudante, d.nome AS Disciplina, m.semestre
FROM
    Matriculas m
        JOIN
    Estudantes e ON m.id_estudante = e.id_estudante
        JOIN
    Disciplinas d ON m.id_disciplina = d.id_disciplina
WHERE
    d.nome = 'Algoritmos';


-- Quantos alunos estão matriculados em cada disciplina e quem é o professor responsável?
SELECT 
    d.nome AS Disciplina,
    p.nome AS Professor,
    COUNT(m.id_estudante) AS Total_Alunos
FROM
    Matriculas m
        JOIN
    Disciplinas d ON m.id_disciplina = d.id_disciplina
        JOIN
    Professores p ON d.id_professor = p.id_professor
GROUP BY d.nome , p.nome
ORDER BY Total_Alunos DESC;

create view vw_alunos_por_disciplina as
select
	d.nome as disciplina,
    p.nome as professor,
    count(m.id_estudante) as total_alunos
from
	matriculas m
    join
    disciplinas d on m.id_disciplina = d.id_disciplina
    join
    professores p on d.id_professor = p.id_professor
group by d.nome, p.nome
order by total_alunos desc;

create view viewalunos as
select id_estudante, nome, email from estudantes;

create view viewalunosdois as
select id_estudante, nome from estudantes;


    


