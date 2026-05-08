with cte as (

    select
    STARTING_STATION,
    STARTING_STATION_ID,
    START_LAT,
    START_LNG,

    
    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'

          
)

select
*
from cte