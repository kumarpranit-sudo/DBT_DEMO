WITH CTE AS (

SELECT t.* ,w.* from 
    {{ ref('trip_fact') }} t 
    left join {{ ref('daily_weather') }} w ON 
    t.TRIP_DATE = w.DAILY_WEATHER

)

SELECT * from CTE 