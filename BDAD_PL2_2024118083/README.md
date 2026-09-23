# PL2 — Rayssa Santos - 2024118083

Base de dados: bdad_2024118083

## Estado

- [ X ] Tarefas de base concluídas
- [ X ] Tarefas de extensão concluídas
- [ X ] Desafio Python concluído

Decisões sobre dados incompletos:
* nesta aula, linhas sem título, autor, categoria ou ano ficam na tabela de importação e não entram no catálogo final. Assim, os dados de origem são preservados.

Problemas encontrados e como foram resolvidos:
--> para resolver o exercício 4 da Tarefa 1, foi necessário utilizar o REPLACE() para tirar o erros de formatação da categoria.

## Tarefas
### Tarefa 1. 
1. 
* código:
SELECT COUNT(*) AS total_linhas
FROM livros_importados;
* resultado:
4

2. 
* código:
SELECT DISTINCT NULLIF(BTRIM(autor), '') AS autor
FROM livros_importados
ORDER BY autor;
* resultado:
"Autor Exemplo"
"Eca de Queiros"
"Isaac Asimov"
"Stephen Hawking"

* código:
SELECT COUNT (categoria)
FROM livros_importados
* resultado:
4

3. 
* código:
SELECT *
FROM livros_importados
WHERE NULLIF(BTRIM(titulo), '') IS NULL
OR NULLIF(BTRIM(autor), '') IS NULL
OR NULLIF(BTRIM(categoria), '') IS NULL
OR ano IS NULL;
* resultado:
104	"Sem ano"	"Autor Exemplo"		"Romance"

4. 
* correção:
SELECT 
REPLACE(REPLACE(categoria, 
                'FicÃ§Ã£o cientÃ­fica', 'Ficcao cientifica'),
                'CiÃªncia', 'Ciencia')
FROM livros_importados;

* código:
SELECT COUNT(DISTINCT categoria) AS categorias_originais,
COUNT(DISTINCT LOWER(TRIM(categoria))) AS categorias_normalizadas
FROM livros_importados;
* resultado:
3	3


### Tarefa 2. 
FOREIGN KEYS de catalogo_livros: autor_id e categoria_id

### Tarefa 3. 
Nada.

### Tarefa 4. 
Os totais importados são diferentes dos catalogados porque para um livro ser catalogado, ele precisa ter ano, ou seja, ser não nulo, como o livro "Sem ano" não tem ano, não é catalogado.

### Tarefa 6. 
> ERROR:  new row for relation "emprestimos" violates check constraint "emprestimos_check"
> Failing row contains (3, 1, Rayssa Santos, 2006-01-23, 2006-01-22). 

> SQL state: 23514
> Detail: Failing row contains (3, 1, Rayssa Santos, 2006-01-23, 2006-01-22).

--> Deu erro porque a verificação do CHECK() só seria true se a data de devolução fosse depois do empréstimo e não antes.

### Tarefa 7. 
Uma transação que evita informações incompletas, utiliza o ROLLBACK, já que serve para voltar atrás com os RUD (insert, update, delete) feitos na Query, voltando o estado anterior da base de dados. 