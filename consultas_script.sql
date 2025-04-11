-- ===========================
-- CONSULTAS OBRIGATÓRIAS
-- ===========================

-- Produtos mais vendidos (com base na soma das quantidades vendidas)
SELECT p.Nome, SUM(ip.Quantidade) AS Total_Vendido
FROM Itens_Pedido ip
JOIN Produtos p ON p.ID_Produto = ip.ID_Produto
GROUP BY p.ID_Produto
ORDER BY Total_Vendido DESC;

-- Clientes que mais compraram no último mês
SELECT u.Nome, COUNT(ped.ID_Pedido) AS Quantidade_Compras
FROM Pedidos ped
JOIN Usuarios u ON u.ID_Usuario = ped.ID_Usuario
WHERE ped.Data_Pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY u.ID_Usuario
ORDER BY Quantidade_Compras DESC;

-- Produtos com estoque baixo (menos de 10 unidades)
SELECT Nome, Quantidade_Estoque
FROM Produtos
WHERE Quantidade_Estoque < 10;

-- Faturamento total por período (por mês)
SELECT 
    DATE_FORMAT(Data_Pedido, '%Y-%m') AS Mes,
    SUM(Total_Pedido) AS Faturamento
FROM Pedidos
WHERE Status_Pedido = 'concluído'
GROUP BY Mes
ORDER BY Mes DESC;

-- Média de avaliações de cada produto
SELECT 
    p.Nome,
    ROUND(AVG(a.Nota), 2) AS Media_Avaliacao
FROM Avaliacoes a
JOIN Produtos p ON p.ID_Produto = a.ID_Produto
GROUP BY p.ID_Produto;