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

    {{ function1('started_at')}} as  seasons,

    {{ function('STARTED_AT') }},

    from
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
    LIMIT 10 


)

select * from cte