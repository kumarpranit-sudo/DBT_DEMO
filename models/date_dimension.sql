WITH cte AS (
    SELECT
        TO_TIMESTAMP(started_at)             AS started_at,
        DATE(TO_TIMESTAMP(started_at))       AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at))       AS hour_started_at,
        DAYOFWEEK(TO_TIMESTAMP(started_at))  AS day_of_week,
        CASE
            WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat', 'Sun') THEN 'WEEKEND'
            ELSE 'BUSINESS DAY'
        END AS day_type,
        CASE
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (12, 1, 2) THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3, 4, 5)  THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6, 7, 8)  THEN 'SUMMER'
            ELSE 'AUTUMN'
        END AS season_of_year
    FROM {{ source('DEMO', 'bike') }}
)

SELECT * FROM cte