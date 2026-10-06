------------------> TAREFA 6 <------------------
CREATE TABLE emprestimos (
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
livro_id INTEGER NOT NULL REFERENCES catalogo_livros(id),
nome_leitor VARCHAR(100) NOT NULL,
data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
data_devolucao DATE,
CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo)
);

INSERT INTO emprestimos(livro_id, nome_leitor, data_emprestimo, data_devolucao)
VALUES(1, 'Rayssa Santos', '2006-01-23', '2006-01-22');

-- ERROR:  new row for relation "emprestimos" violates check constraint "emprestimos_check"
-- Failing row contains (3, 1, Rayssa Santos, 2006-01-23, 2006-01-22). 

-- SQL state: 23514
-- Detail: Failing row contains (3, 1, Rayssa Santos, 2006-01-23, 2006-01-22).

--> deu erro porque a verificação do CHECK() só seria true se a data de devolução fosse depois do empréstimo e não antes.

------------------> TAREFA 7 <------------------
BEGIN; 
--> pode ser para começar um bloco de código ou para iniciar uma transição de uma base de dados

INSERT INTO emprestimos (livro_id, nome_leitor)
VALUES (1, 'Leitor de teste');

SELECT * FROM emprestimos;
--> resultado:
-- 4	1	"Leitor de teste"	"2026-09-23"	

ROLLBACK;
----
BEGIN;

INSERT INTO emprestimos (livro_id, nome_leitor)
VALUES (1, 'Rayssa');

COMMIT;