SELECT
    _FILE,
    _LINE,
    _MODIFIED AS _MODIFIED_TS,
    _fivetran_synced AS _fivetran_synced_ts,
    CAST(WALKER_ID AS STRING) AS WALKER_ID,
    REGISTERED_DATE,
    NAME,
    CITY
FROM {{ source('gdrive', 'walkers') }}