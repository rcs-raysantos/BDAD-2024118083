PARTE A

1. o servidor é o ficha1 e a base de dados é o postgres

2. Name | Owner | Encoding | Locale Provider | Collate | Ctype | Locale | ICU Rules | Access privileges
   -----------+----------+----------+-----------------+-----------------------------+-----------------------------+--------+-----------+-----------------------
   postgres | postgres | UTF8 | libc | English_United Kingdom.1252 | English_United Kingdom.1252 | | |
   template0 | postgres | UTF8 | libc | English_United Kingdom.1252 | English_United Kingdom.1252 | | | =c/postgres +
   | | | | | | | | postgres=CTc/postgres
   template1 | postgres | UTF8 | libc | English_United Kingdom.1252 | English_United Kingdom.1252 | | | =c/postgres +
   | | | | | | | | postgres=CTc/postgres
   (3 rows)

PARTE C

DESAFIO C2
livros.categoria_id -> usa uma foreign key, ou seja, aponta para o id das categorias
categorias.id -> tem uma primary key, que serve para identificar de forma única

PARTE E

1. os nomes são: id, titulo, autor, ano, categoria

2. sim, os nomes das colunas, ou seja, id, titulo, autor, ano, categoria

3. a vírgula ","

4. sim. Na quarta linha na coluna "ano", onde não há nada

PARTE F

1.  código:
    SELECT titulo, ano, categoria
    FROM livros_importados
    WHERE categoria = 'Romance'

resultado:
"A Cidade e as Serras" 1901 "Romance"
"Sem ano" "Romance"

2.  código:
    SELECT titulo, ano
    FROM livros_importados
    WHERE ano < 1980

resultado:
"Fundacao" 1951
"A Cidade e as Serras" 1901

3.  código:
    SELECT COUNT(*)
    FROM livros_importados

resultado:
4

4.  código:
    SELECT COUNT(*) 
    FROM livros_importados
    GROUP BY categoria

resultado:
2
1
1
