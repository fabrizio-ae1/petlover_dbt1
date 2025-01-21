WITH  daily_walks_metrics as(
    SELECT 
        DATE(START_WALK_TS) as WALKS_DATE,
        SUM(PRICE_PAID) AS REVENUE,
        SUM(PAID_TO_WALKER) AS WALKER_COST,
        SUM(REFUND) AS REFUND_COST
    FROM {{ ref('base_gdrive__walk') }} as walks
    GROUP BY 1
)

SELECT 
    COALESCE(expenses.EXPENSES_DATE,walks.WALKS_DATE) as COSTS_DATE,
    COALESCE(expenses.SALARIES_COST,0) as SALARIES_COST,
    COALESCE(expenses.TOOLS_COST,0) as TOOLS_COST,
    COALESCE(expenses.OTHER_COST,0) as OTHER_COST,
    COALESCE(walks.WALKER_COST,0) as WALKER_COST,
    COALESCE(walks.REFUND_COST,0) as REFUND_COST,
    SALARIES_COST+TOOLS_COST+OTHER_COST+WALKER_COST+REFUND_COST AS TOTAL_COST,
    COALESCE(walks.REVENUE,0) as REVENUE,
    REVENUE - TOTAL_COST AS PROFIT

FROM {{ ref('base_gdrive__expenses') }} as expenses
FULL JOIN daily_walks_metrics as walks
ON expenses.EXPENSES_DATE = walks.WALKS_DATE