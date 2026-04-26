-- VIEWS NO SQL

-- Consulta Direta

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

-- view

CREATE VIEW alunos_por_disciplina AS
SELECT
d.nome AS Disciplina,
p.nome AS Professor,
COUNT(m.id_estudante) AS Total_Alunos
FROM

Matriculas
JOIN

Disciplinas d ON m.id_disciplina = d.id_disciplina
JOIN

Professores p oN d.id_professor = p.id_professor
GROUP BY d.nome , p.nome
ORDER BY Total_Alunos DESC;

-- views nao armazenam dados

-- Atualizar uma VIEW existente
CREATE OR REPLACE VIEW nome_view AS
SELECT coluna1, coluna2, nova_coluna
FROM nome_tabela
WHERE condicao;

-- Removendo uma View: 
DROP VIEW nome_da_view;

