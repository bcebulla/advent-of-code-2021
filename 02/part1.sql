WITH mycalc AS (
    SELECT 
        sum(
            case 
                when d.direction = 'up' then -value 
                when d.direction = 'down' then value
            else 0 end) as depth 
        ,sum(
            case 
                when d.direction = 'forward' then value 
            else 0 end) as horizontal 
    FROM `advent-of-code-333818.2021.input_d2` d
)

SELECT 
    depth*horizontal
FROM mycalc