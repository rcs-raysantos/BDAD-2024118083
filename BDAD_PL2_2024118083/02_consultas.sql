------------------> TAREFA 5 <------------------
--> 1.
-- código
SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM catalogo_livros AS l
JOIN autores_catalogo AS a ON a.id = l.autor_id
JOIN categorias_catalogo AS c ON c.id = l.categoria_id
ORDER BY l.titulo;
-- resultado:
-- "A Cidade e as Serras"	"Eca de Queiros"	"Romance"
-- "Fundacao"	"Isaac Asimov"	"Ficcao cientifica"
-- "Uma Breve Historia do Tempo"	"Stephen Hawking"	"Ciencia"

--> 2.
-- código:
SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM catalogo_livros AS l
JOIN autores_catalogo AS a ON a.id = l.autor_id
JOIN categorias_catalogo AS c ON c.id = l.categoria_id
WHERE ano > 2000
ORDER BY l.titulo;
-- resultado:
-- 

--> 3.
-- código:
SELECT c.nome AS categoria, COUNT(*) AS total_livros
FROM catalogo_livros AS l
JOIN categorias AS c ON l.categoria_id = c.id
GROUP BY c.nome
ORDER BY total_livros DESC;
-- resultado:
-- "Romance"	1
-- "Ficção científica"	1
-- "História"	1

--> 4.
-- código:
SELECT a.nome AS autor, COUNT(*) AS total_livros
FROM catalogo_livros AS l
JOIN autores_catalogo AS a ON l.autor_id = a.id
GROUP BY a.nome
ORDER BY total_livros;
-- resultado:
-- "Eca de Queiros"	1
-- "Isaac Asimov"	1
-- "Stephen Hawking"	1

--> 5.
-- código:
SELECT cat.id, cat.nome
FROM categorias_catalogo AS cat
LEFT JOIN catalogo_livros AS l ON cat.id = l.categoria_id
WHERE l.categoria_id IS NULL;
-- resultado:
-- 

