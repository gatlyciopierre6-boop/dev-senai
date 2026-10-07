-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: _JHON WENSKY PIERRE______________________________________________
-- Turma: _2DEVIES_____________________ Data: ___30/09/2026______________
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_PIERRE;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO CLIENTE(NOME,EMAIL,TELEFONE,CIDADE,ATIVO) VALUES
('JHON PIERRE', 'JHON@EMAIL.COM', '19999999012', 'CAP HAITIEN', TRUE),
('GUSTAVO COUTO', 'COUTO@EMAIL.COM', '19999999013', 'IPATINGA', TRUE);
-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO CATEGORIA (NOME)
VALUES ('ESPECIAIS DA CASA');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
INSERT INTO PRODUTO (NOME_PRODUTO, PRECO, ATIVO, ID_CATEGORIA) VALUES
('CAFÉ DA CASA', 12.00, TRUE,8 ),
('SANDUÍCHE ESPECIAL', 24.90, TRUE, 8),
('BOLO ESPECIAL', 16.50, TRUE,8 );

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO)
VALUES ('JACÓ RUFINO', 'RUFINO@EMAIL.COM', NULL, 'LIMEIRA', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO PEDIDO (DATA_PEDIDO,STATUS_PEDIDO,VALOR_TOTAL,ID_CLIENTE)
VALUES ((NOW), 'ABERTO', 0.00, 1)

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @ID_PEDIDO_NOVO = LAST_INSERT_ID();

INSERT INTO ITEM_PEDIDO
    (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO)
VALUES
    (@ID_PEDIDO_NOVO, @ID_PRODUTO_1, 1, 12.00, 'Sem açúcar'),
    (@ID_PEDIDO_NOVO, @ID_PRODUTO_2, 1, 24.90, NULL);

SELECT p.ID_PEDIDO, p.ID_CLIENTE, i.ID_PRODUTO, i.QUANTIDADE,
       i.PRECO_UNITARIO, i.OBSERVACAO
FROM PEDIDO AS p
JOIN ITEM_PEDIDO AS i ON i.ID_PEDIDO = p.ID_PEDIDO
WHERE p.ID_PEDIDO = @ID_PEDIDO_NOVO;


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

UPDATE CLIENTE
SET TELEFONE = '19999999019'
WHERE ID_CLIENTE = 67;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE CLIENTE 
SET TELEFONE = '19999999015',
CIDADE = 'PIRACICABA'
WHERE ID_CLIENTE = 68;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE CATEGORIA
SET PRECO = PRECO * 0,08
WHERE ID_CATEGORIA = 9;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.



SELECT * FROM PRODUTO;