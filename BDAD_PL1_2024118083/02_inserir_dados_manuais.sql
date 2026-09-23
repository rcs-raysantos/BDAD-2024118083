INSERT INTO categorias (id, nome)
VALUES
    (1, 'Romance'),
    (2, 'Ficção cientifica'),
    (3, 'Historia');

INSERT INTO livros (id, titulo, autor, ano, categoria_id)
VALUES
    (1, 'Ensaio sobre a Cegueira', 'José Saramago', 1995, 1),
    (2, 'Duna', 'Frank Herbert', 1965, 2),
    (3, 'Sapiens', 'Yuval Noah Harari', 2011, 3),
    (4, 'A Court of Thornes and Roses', 'Sarah J. Maas', 2015, 3),
    (5, 'A Rainha Vermelha', 'Victoria Aveyard', 2016, 2),
    (6, 'O Povo do Sol', 'Rayssa Santos', 2027, 1);

-- INSERT INTO livros (id, titulo, autor, ano, categoria_id)
--VALUES
--    (7, 'The City of Dreams', 'Hailey Griffins', 2017, 4), --> dá erro porque não existe a categoria_id 4

SELECT * FROM categorias;
SELECT * FROM livros;
SELECT * FROM livros_importados;