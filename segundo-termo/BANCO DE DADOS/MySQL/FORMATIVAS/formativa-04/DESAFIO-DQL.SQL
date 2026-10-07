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