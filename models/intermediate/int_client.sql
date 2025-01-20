WITH ranking AS(
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY CLIENT_ID ORDER BY REQUEST_TS DESC) as row_n
    FROM {{ ref('base_gdrive__request') }}
)

SELECT 
    CLIENT_ID,
    NAME,
    ADDRESS,
    CITY,
    PHONE   
FROM ranking
WHERE row_n = 1