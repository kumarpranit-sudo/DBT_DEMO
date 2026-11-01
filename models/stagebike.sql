WITH bike AS (
    SELECT
        ride_id,
        REPLACE(started_at,'"','') AS Started_At,
        REPLACE(ended_at,'"','') AS Ended_At,
        start_station_name,
        start_statio_id AS start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_csual AS member_casual
    FROM {{ source('DEMO', 'bike') }}
    WHERE ride_id != 'bikeid'
)

SELECT * FROM bike
