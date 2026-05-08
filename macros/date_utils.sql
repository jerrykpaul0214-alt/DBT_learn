{% macro function(x) %}

case when TO_TIMESTAMP({{x}}) < CURRENT_DATE
THEN 'PAST'
ELSE 'FUTURE'
END

{% endmacro %}


{% macro function1(x) %}

 CASE
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (11,12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) in( 3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) in(5,6,7)
    THEN 'SUMMER'
    ELSE'RAINY'
    END

{% endmacro %}