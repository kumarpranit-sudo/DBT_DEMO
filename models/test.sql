SELECT * FROM {{ source('DEMO', 'bike') }}
LIMIT 10