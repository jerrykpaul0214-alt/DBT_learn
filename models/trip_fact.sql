with cte as (

    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    STARTING_STATION_ID,
    END_STATION_ID,
    MEMBER_CASUAL AS MEMBER_OR_CASUAL,
    datediff(MINUTE, TO_TIMESTAMP(STARTED_AT)::TIMESTAMP, TO_TIMESTAMP(ENDED_AT)::TIMESTAMP) AS TIME_TAKEN_IN_MINUTES,
    

    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'

)
select 
*
from cte