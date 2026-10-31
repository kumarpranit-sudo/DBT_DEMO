WITH cte AS (
    SELECT
        TO_TIMESTAMP(started_at)             AS started_at,
        DATE(TO_TIMESTAMP(started_at))       AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at))       AS hour_started_at,
        DAYOFWEEK(TO_TIMESTAMP(started_at))  AS day_of_week,
        {{my_new_project.day_type('started_at')}} AS day_type,
        {{my_new_project.season('started_at')}} AS SEASON_OF_YEAR
    FROM {{ source('DEMO', 'bike') }}
)

SELECT * FROM cte