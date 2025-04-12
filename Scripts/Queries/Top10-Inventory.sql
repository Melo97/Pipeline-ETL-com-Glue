SELECT
    Produto,
    SUM(Quantidade_novos_produtos) AS total_novos,
    SUM(Quantidade_vendida) AS total_vendida,
    (SUM(Quantidade_novos_produtos) - SUM(Quantidade_vendida)) AS estoque_restante
FROM 
    myDataSource
GROUP BY 
    Produto
ORDER BY 
    estoque_restante ASC
LIMIT 10;