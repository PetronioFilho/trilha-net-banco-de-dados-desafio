-- 1 - Buscar o nome e ano dos filmes

SELECT F.Nome, F.Ano FROM Filmes AS F

-----------------------------------------------------------------------------

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT F.Nome, F.Ano FROM Filmes AS F
ORDER BY F.Ano

-----------------------------------------------------------------------------

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT F.Nome, F.Ano, F.Duracao FROM Filmes AS F
WHERE F.Nome LIKE 'de volta para o futuro'

-----------------------------------------------------------------------------

-- 4 - Buscar os filmes lançados em 1997

SELECT * FROM Filmes 
WHERE Ano = 1997

-----------------------------------------------------------------------------

-- 5 - Buscar os filmes lançados APÓS o ano 2000

SELECT * FROM Filmes 
WHERE Ano > 2000

-----------------------------------------------------------------------------

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT * FROM Filmes 
WHERE Duracao BETWEEN 100 AND 150
ORDER BY Duracao

-----------------------------------------------------------------------------

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente


SELECT 
    f.Ano,
    COUNT(*) AS QUANTIDADE,
    SUM(f.Duracao) AS DuracaoTotal
FROM Filmes AS f
GROUP BY f.Ano
ORDER BY DuracaoTotal DESC;

-----------------------------------------------------------------------------

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores
WHERE Genero = 'M'

-----------------------------------------------------------------------------

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-----------------------------------------------------------------------------

-- 10 - Buscar o nome do filme e o gênero

SELECT F.Nome AS NOME, G.Genero AS GENERO
FROM Filmes AS F
INNER JOIN FilmesGenero AS FG
ON FG.IdFilme = F.Id
INNER JOIN Generos AS G
ON G.Id = FG.IdGenero

-----------------------------------------------------------------------------

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT f.Nome, g.Genero FROM Filmes AS F
INNER JOIN FilmesGenero AS FG
ON FG.IdFilme = F.Id
INNER JOIN Generos AS G
ON G.Id = FG.IdGenero
WHERE G.Genero = 'Mistério'

-----------------------------------------------------------------------------

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT F.Nome, A.PrimeiroNome, A.UltimoNome, EF.Papel FROM Filmes AS F
INNER JOIN ElencoFilme AS EF
ON EF.IdFilme = F.Id
INNER JOIN Atores AS A
ON A.Id = EF.IdAtor
