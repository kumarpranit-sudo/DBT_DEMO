WITH daily_Weather As (
SELECT  
        date(time ) as daily_weather,
        weather,
        temp ,
        pressure ,
        humidity, clouds 
 from   
{{ source('DEMO', 'weather') }}
),

daily_weather_Agg AS (
    SELECT daily_weather , weather , ROUND(AVG(temp),2 ) as Temperature  , ROUND(AVG(pressure),2) as Pressure  , 
        ROUND(AVG (humidity),2)  as Humidity  , ROUND(AVG(clouds),2)  as Clouds 
    from daily_Weather 
    GROUP BY daily_weather , weather 
    qualify row_number() OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC ) = 1 
)   
SELECT * from daily_weather_Agg ORDER BY daily_weather ASC 