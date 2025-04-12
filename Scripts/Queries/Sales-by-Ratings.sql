WITH social_vendas_agrupadas AS (
    -- Agrupar por produto e avaliação, somando as quantidades vendidas
    SELECT 
        produto, 
        avaliacao, 
        SUM(quantidade) AS total_vendas
    FROM 
        myDataSource
    GROUP BY 
        produto, avaliacao
)
-- Selecionar o impacto das avaliações nas vendas por produto
SELECT 
    produto, 
    avaliacao, 
    total_vendas
FROM 
    social_vendas_agrupadas
ORDER BY 
    avaliacao, total_vendas DESC;