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

-- SELECT de validação:
SELECT *
FROM PEDIDO
WHERE ID_PEDIDO = @pedido_atividade;

-- UPDATE:
UPDATE PEDIDO
SET STATUS_PEDIDO = 'PREPARANDO'
WHERE ID_PEDIDO = @pedido_atividade;

-- SELECT final:
SELECT *
FROM PEDIDO
WHERE ID_PEDIDO = @pedido_atividade;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.

-- SELECT para calcular o total:
SELECT SUM(QUANTIDADE * PRECO_UNITARIO) AS TOTAL
FROM ITEM_PEDIDO
WHERE ID_PEDIDO = @pedido_atividade;

-- UPDATE:
UPDATE PEDIDO
SET VALOR_TOTAL = (
    SELECT SUM(QUANTIDADE * PRECO_UNITARIO)
    FROM ITEM_PEDIDO
    WHERE ID_PEDIDO = @pedido_atividade
)
WHERE ID_PEDIDO = @pedido_atividade;

-- SELECT final:
SELECT *
FROM PEDIDO
WHERE ID_PEDIDO = @pedido_atividade;


-- 12. Escolha um produto e faça uma exclusão lógica.

-- SELECT de validação:
SELECT *
FROM PRODUTO
WHERE ID_PRODUTO = @ID_PRODUTO_1;

-- UPDATE:
UPDATE PRODUTO
SET ATIVO = FALSE
WHERE ID_PRODUTO = @ID_PRODUTO_1;

-- SELECT final:
SELECT *
FROM PRODUTO
WHERE ID_PRODUTO = @ID_PRODUTO_1;


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO)
VALUES ('CLIENTE TESTE', 'TESTE@EMAIL.COM', NULL, 'LIMEIRA', TRUE);

SET @cliente_teste = LAST_INSERT_ID();

-- Localize o cliente:
SELECT *
FROM CLIENTE
WHERE ID_CLIENTE = @cliente_teste;

-- Confira se não possui pedidos:
SELECT *
FROM PEDIDO
WHERE ID_CLIENTE = @cliente_teste;

-- SELECT de validação:
SELECT *
FROM CLIENTE
WHERE ID_CLIENTE = @cliente_teste;

-- DELETE:
DELETE FROM CLIENTE
WHERE ID_CLIENTE = @cliente_teste;

-- SELECT final:
SELECT *
FROM CLIENTE
WHERE ID_CLIENTE = @cliente_teste;


-- 14. Tente excluir um cliente da base original que possua pedidos.

-- SELECT de validação:
SELECT *
FROM CLIENTE
WHERE ID_CLIENTE = 1;

SELECT *
FROM PEDIDO
WHERE ID_CLIENTE = 1;

-- DELETE comentado após o teste:
-- DELETE FROM CLIENTE WHERE ID_CLIENTE = 1;

-- Resultado observado:
-- Erro de chave estrangeira (FOREIGN KEY).
-- O cliente possui pedidos associados e não pode ser excluído.


-- 15. Explique por que a FK bloqueou a exclusão.

-- Resposta:
-- A chave estrangeira impede excluir um cliente que possui
-- pedidos vinculados. Isso mantém a integridade dos dados
-- e evita que os pedidos fiquem sem um cliente associado.


-- 16. Crie uma categoria temporária e remova-a.

INSERT INTO CATEGORIA (NOME)
VALUES ('Excluir Depois');

SET @categoria_teste = LAST_INSERT_ID();

-- SELECT de validação:
SELECT *
FROM CATEGORIA
WHERE ID_CATEGORIA = @categoria_teste;

-- DELETE:
DELETE FROM CATEGORIA
WHERE ID_CATEGORIA = @categoria_teste;

-- SELECT final:
SELECT *
FROM CATEGORIA
WHERE ID_CATEGORIA = @categoria_teste;


-- ============================================================

-- 17. Tente inserir um produto usando uma categoria inexistente.
INSERT INTO PRODUTO (NOME_PRODUTO, PRECO, ATIVO, ID_CATEGORIA)
VALUES ('PRODUTO TESTE', 15.00, TRUE, 9999);

-- 18. Tente cadastrar um cliente usando um e-mail que já existe.
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO)
VALUES ('CLIENTE DUPLICADO', 'JHON@EMAIL.COM',
        '19999999020', 'LIMEIRA', TRUE);

-- 19. Tente criar um pedido para um cliente inexistente.
INSERT INTO PEDIDO (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE)
VALUES (NOW(), 'ABERTO', 0.00, 9999);

-- 20. Identifique qual restrição foi responsável.
-- Resposta:
-- Questão 17: a chave estrangeira (FOREIGN KEY) impede
-- usar uma categoria que não existe.
-- Questão 18: a restrição UNIQUE impede cadastrar um e-mail
-- que já existe, caso EMAIL tenha essa restrição.
-- Questão 19: a chave estrangeira (FOREIGN KEY) impede
-- criar um pedido para um cliente inexistente.

