

SELECT
    rr.REQUEST_TS,
    rr.CLIENT_ID,
    rr.PET_ID,
    rr.REQUEST_WALK_TS,
    rr.REQUEST_DURATION, 
    cc.CANCEL_TS,
    ww.WALKER_ID,
    ww.PRICE_PAID,
    ww.TAXES_PAID,
    ww.PAID_TO_WALKER,
    ww.REFUND

FROM {{ ref('base_gdrive__request') }} AS rr
LEFT JOIN {{ ref('base_gdrive__cancellation') }} AS cc
ON rr.client_id = cc.client_id
AND rr.request_ts = cc.request_ts
LEFT JOIN {{ ref('base_gdrive__walk') }} AS ww
ON rr.client_id = ww.client_id
AND rr.REQUEST_WALK_TS = ww.START_WALK_TS