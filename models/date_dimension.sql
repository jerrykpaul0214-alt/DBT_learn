with cte as(

    select
    TO_TIMESTAMP(started_at) as STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE,
    HOUR(TO_TIMESTAMP(started_at)) AS HOUR,

    CASE
    WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUISNESSDAY'
    END AS DAYTYPE,

    CASE
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (11,12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(started_at)) in( 3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(started_at)) in(5,6,7)
    THEN 'SUMMER'
    ELSE'RAINY'
    END AS SEASONS,

    from
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
    LIMIT 10 


)

select * from cte