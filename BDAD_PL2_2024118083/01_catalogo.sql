------------------> TAREFA 1 <------------------
--> 1.
-- código:
SELECT COUNT(*) AS total_linhas
FROM livros_importados;

-- resultado:
-- 4

--> 2. 
-- código:
SELECT DISTINCT NULLIF(BTRIM(autor), '') AS autor
FROM livros_importados
ORDER BY autor;
-- resultado:
-- "Autor Exemplo"
-- "Eca de Queiros"
-- "Isaac Asimov"
-- "Stephen Hawking"

-- código:
SELECT COUNT (categoria)
FROM livros_importados
-- resultado:
-- 4

--> 3.
-- código:
SELECT *
FROM livros_importados
WHERE NULLIF(BTRIM(titulo), '') IS NULL
OR NULLIF(BTRIM(autor), '') IS NULL
OR NULLIF(BTRIM(categoria), '') IS NULL
OR ano IS NULL;
-- resultado:
-- 104	"Sem ano"	"Autor Exemplo"		"Romance"

--> 4. 
SELECT 
REPLACE(REPLACE(categoria, 
                'FicÃ§Ã£o cientÃ­fica', 'Ficcao cientifica'),
                'CiÃªncia', 'Ciencia')
FROM livros_importados;

-- código:
SELECT COUNT(DISTINCT categoria) AS categorias_originais,
COUNT(DISTINCT LOWER(TRIM(categoria))) AS categorias_normalizadas
FROM livros_importados;
-- resultado:
-- 3	3


------------------> TAREFA 2 <------------------
CREATE TABLE autores_catalogo (
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categorias_catalogo (
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE catalogo_livros (
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
titulo VARCHAR(150) NOT NULL,
ano INTEGER NOT NULL CHECK (ano BETWEEN 1450 AND 2100),
autor_id INTEGER NOT NULL REFERENCES autores_catalogo(id),
categoria_id INTEGER NOT NULL REFERENCES categorias_catalogo(id),
UNIQUE (titulo, ano, autor_id)
);

--> FOREIGN KEYS de catalogo_livros: autor_id e categoria_id


------------------> TAREFA 3 <------------------
INSERT INTO autores_catalogo (nome)
SELECT DISTINCT BTRIM(autor)
FROM livros_importados
WHERE NULLIF(BTRIM(autor), '') IS NOT NULL;

INSERT INTO categorias_catalogo (nome)
SELECT DISTINCT BTRIM(categoria)
FROM livros_importados
WHERE NULLIF(BTRIM(categoria), '') IS NOT NULL;

SELECT * FROM autores_catalogo ORDER BY nome;
--> resultado:
-- 3	"Autor Exemplo"
-- 1	"Eca de Queiros"
-- 4	"Isaac Asimov"
-- 2	"Stephen Hawking"

SELECT * FROM categorias_catalogo ORDER BY nome;
--> resultado:
-- 1	"Ciencia"
-- 3	"Ficcao cientifica"
-- 2	"Romance"

------------------> TAREFA 4 <------------------
SELECT li.titulo, li.ano, a.id AS autor_id, a.nome AS autor,
c.id AS categoria_id, c.nome AS categoria
FROM livros_importados AS li
JOIN autores_catalogo AS a ON a.nome = BTRIM(li.autor)
JOIN categorias_catalogo AS c ON c.nome = BTRIM(li.categoria)
WHERE NULLIF(BTRIM(li.titulo), '') IS NOT NULL
AND li.ano IS NOT NULL;
--> resultado:
-- "Uma Breve Historia do Tempo"	1988	2	"Stephen Hawking"	1
-- "A Cidade e as Serras"	1901	1	"Eca de Queiros"	2
-- "Fundacao"	1951	4	"Isaac Asimov"	3

INSERT INTO catalogo_livros (titulo, ano, autor_id, categoria_id)
SELECT li.titulo, li.ano, a.id, c.id
FROM livros_importados AS li
JOIN autores_catalogo AS a ON a.nome = BTRIM(li.autor)
JOIN categorias_catalogo AS c ON c.nome = BTRIM(li.categoria)
WHERE NULLIF(BTRIM(li.titulo), '') IS NOT NULL
AND li.ano IS NOT NULL;

SELECT COUNT(*) AS importados FROM livros_importados;
--> resultado:
-- 4 importados
SELECT COUNT(*) AS catalogados FROM catalogo_livros;
--> resultado:
-- 3 catalogados

SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM catalogo_livros AS l
JOIN autores_catalogo AS a ON a.id = l.autor_id
JOIN categorias_catalogo AS c ON c.id = l.categoria_id
ORDER BY l.titulo;
--> resultado:
--