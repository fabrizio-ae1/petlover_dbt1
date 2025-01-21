SELECT 
    WALKER_ID,
    REGISTERED_DATE,
    NAME,
    CITY
FROM {{ ref('base_gdrive__walkers') }}