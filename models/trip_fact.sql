WITH trips AS (
    SELECT
        REPLACE(ride_id, '"', '')                                        AS ride_id,
        DATE(TO_TIMESTAMP(REPLACE(started_at, '"', '')))                 AS trip_date,
        REPLACE(start_station_id, '"', '')                                AS start_station_id,
        REPLACE(end_station_id, '"', '')                                 AS end_station_id,
        REPLACE(member_casual, '"', '')                                   AS member_casual,
        TIMESTAMPDIFF(
            SECOND,
            TO_TIMESTAMP(REPLACE(started_at, '"', '')),
            TO_TIMESTAMP(REPLACE(ended_at, '"', ''))
        )                                                                AS trip_duration_seconds
    FROM {{ ref('stagebike') }}
    WHERE TRY_TO_TIMESTAMP(REPLACE(started_at, '"', '')) IS NOT NULL
      AND TRY_TO_TIMESTAMP(REPLACE(ended_at, '"', '')) IS NOT NULL
)

SELECT * FROM trips
