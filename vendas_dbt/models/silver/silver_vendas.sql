{{ config(materialized='view')}}

WITH cleaned_data AS (
    SELECT
        email,
        DATE(data) AS data,
        valor,
        quantidade,
        produto
    FROM
        {{ ref('bronze_vendas')}}
    WHERE 
        valor BETWEEN 300 and 800
)

SELECT * FROM cleaned_data
