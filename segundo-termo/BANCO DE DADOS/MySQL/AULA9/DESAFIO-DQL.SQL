-- Active: 1788351694370@@127.0.0.1@3306@smartcoffee_dml_pierre
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: __jhon wensky pierre_____________________________________________
-- Turma: ___2 devies___________________ Data: ___07/10/2026______________
-- Base: smartcoffee_dql
-- ============================================================
-- USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

SELECT NOME, CIDADE, EMAIL FROM CLIENTE;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT CIDADE FROM  CLIENTE;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME_PRODUTO, PRECO 
FROM PRODUTO 
ORDER BY PRECO ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME_PRODUTO, PRECO 
FROM produto
ORDER BY  NOME_PRODUTO DESC 
LIMIT 5 OFFSET 5;


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO 
WHERE PRECO BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou PIRACICABA.
SELECT NOME, CIDADE
FROM CLIENTE
WHERE CIDADE IN ('LIMEIRA','PIRACICABA');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT Nome_Produto
FROM Produto
WHERE Nome_Produto LIKE 'Café%';

-- 9. Liste os clientes que não informaram telefone.

SELECT NOME, TELEFONE
FROM cliente
WHERE TELEFONE IS NULL;
-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT * FROM PEDIDO
WHERE STATUS_PEDIDO = 'FINALIZADO' 
AND VALOR_TOTAL > 20
ORDER BY VALOR_TOTAL DESC;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS Quantidade_Produtos FROM Produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(Preco) AS Menor_preco,
    MAX(Preco) AS Maior_preco,
    AVG(Preco) AS Preco_medio
FROM Produto;
-- 13. Informe quantos clientes existem em cada cidade.

SELECT Cidade,
COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

SELECT Cidade,
COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

SELECT SUM(Valor_total) AS Faturamento
FROM Pedido
WHERE Status_Pedido = 'FINALIZADO';

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_Pedido, P.Data_Pedido, C.Nome AS Nome_Cliente,
P.Status_Pedido, P.Valor_total
FROM Pedido P
INNER JOIN Cliente C 
ON P.ID_Cliente = C.ID_Cliente;
-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT P.Nome_Produto, C.
FROM Produto P
INNER JOIN Categoria C
ON P.ID_PRODUTO = C.ID_Categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;


-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO ASC;


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
