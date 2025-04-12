WITH vendas_agrupadas AS (
    -- Agrupar por Produto e Região de Cliente, somando as quantidades vendidas
    SELECT 
        produto, 
        regiao_cliente, 
        SUM(quantidade) AS total_vendas
    FROM 
        myDataSource
    GROUP BY 
        produto, regiao_cliente
),
top_10_produtos AS (
    -- Encontrar os 10 produtos mais vendidos
    SELECT 
        produto
    FROM 
        vendas_agrupadas
    GROUP BY 
        produto
    ORDER BY 
        SUM(total_vendas) DESC
    LIMIT 10
)
-- Filtrar as vendas apenas dos 10 produtos mais vendidos e mostrar por região
SELECT 
    v.produto, 
    v.regiao_cliente, 
    v.total_vendas
FROM 
    vendas_agrupadas v
JOIN 
    top_10_produtos t 
ON 
    v.produto = t.produto
ORDER BY 
    v.produto, v.regiao_cliente;
