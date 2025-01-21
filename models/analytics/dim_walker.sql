SELECT 
    WALKER_ID,
    REGISTERED_DATE,
    NAME,
    CITY
FROM {{ ref('int_walker') }}