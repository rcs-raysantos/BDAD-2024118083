-- Q1. Mostrar título e autor de todos os livros importados
SELECT titulo, autor
FROM livros_importados;

-- Q2. Mostrar livros publicados a partir de 2000
SELECT *
FROM livros_importados
WHERE ano >= 2000;

-- Q3. Ordenar livros por ano, do mais recente para o mais antigo
SELECT titulo, ano
FROM livros_importados
ORDER BY ano DESC;

SELECT titulo, ano, categoria
FROM livros_importados
WHERE categoria = 'Romance'

SELECT titulo, ano
FROM livros_importados
WHERE ano < 1980

SELECT COUNT(*)
FROM livros_importados

SELECT COUNT(*) 
FROM livros_importados
GROUP BY categoria