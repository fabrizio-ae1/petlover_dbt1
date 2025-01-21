WITH ranked as (
    SELECT *,
          ROW_NUMBER() OVER(PARTITION BY pet_id ORDER BY REQUEST_TS DESC) AS row_n
    FROM {{ ref('base_gdrive__request') }}
)

SELECT 
    pet_id, 
    pet_name, 
    client_id
FROM ranked
WHERE row_n = 1