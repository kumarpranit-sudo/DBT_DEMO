{% macro season(x) %}
    CASE
        WHEN MONTH(TO_TIMESTAMP({{ x }})) IN (12, 1, 2) THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{ x }})) IN (3, 4, 5)  THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{ x }})) IN (6, 7, 8)  THEN 'SUMMER'
        ELSE 'AUTUMN'
    END
{% endmacro %}

{% macro day_type(x) %}
    CASE
            WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat', 'Sun') THEN 'WEEKEND'
            ELSE 'BUSINESS DAY'
    END
{% endmacro %}