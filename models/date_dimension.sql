WITH cleaned AS (
    SELECT TRY_TO_TIMESTAMP(REPLACE(started_at, '"', '')) AS started_ts
    FROM {{ ref('stagebike') }}
),

cte AS (
    SELECT
        started_ts                           AS started_at,
        DATE(started_ts)                     AS date_started_at,
        HOUR(started_ts)                     AS hour_started_at,
        DAYOFWEEK(started_ts)                AS day_of_week,
        {{ my_new_project.day_type('started_ts') }} AS day_type,
        {{ my_new_project.season('started_ts') }}   AS season_of_year
    FROM cleaned
    WHERE started_ts IS NOT NULL
)

SELECT * FROM cte