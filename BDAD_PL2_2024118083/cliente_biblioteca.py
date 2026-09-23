from getpass import getpass
import psycopg

NOME_BD = "bdad_2024118083"

with psycopg.connect(
    host="localhost", port=5432, dbname=NOME_BD,
    user="postgres", password=getpass("Palavra-passe de postgres: "),
) as conn:
    with conn.cursor() as cur:


        print("\n--- 1. LISTAGEM DO CATÁLOGO ---")
    #Lista a base de dados
        cur.execute("""
            SELECT l.id, l.titulo, a.nome, c.nome
            FROM catalogo_livros AS l
            JOIN autores_catalogo AS a ON a.id = l.autor_id
            JOIN categorias_catalogo AS c ON c.id = l.categoria_id
            ORDER BY l.titulo
        """)

        for livro_id, titulo, autor, categoria in cur.fetchall():
            print(f"{livro_id}: {titulo} — {autor} [{categoria}]")


        print("\n--- 2. PESQUISA POR ANO ---")
    #Pesquisa só pelo ano
        ano_minimo = input("Insere um ano minimo para a pesquisa de livros por ano: ")
        cur.execute(
            "SELECT titulo, ano FROM catalogo_livros WHERE ano >= %s ORDER BY ano",
            (ano_minimo,),
        )

        for titulo, ano in cur.fetchall():
            print(f"{titulo}  [{ano}]")

        print("\n--- 3. NOVO EMPRÉSTIMO ---")
    #Autor para adicionar um emprestimo
        nome_leitor = input("Insira um leitor adicionar um emprestimo: ")
        livro_id = input("Insira um id do livro para realizar o emprestimo: ")
        cur.execute(
            "INSERT INTO emprestimos (livro_id, nome_leitor) VALUES (%s, %s)",
            (livro_id, nome_leitor),
        )
        conn.commit()
        print(f"O livro {livro_id} corresponde ao {titulo} foi atribuido ao leitor  {nome_leitor}")
