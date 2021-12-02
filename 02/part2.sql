WITH rolling AS (
    SELECT 
        d.n
        , d.direction
        , d.value
        , sum(
            case 
                when d.direction = 'up' then -value 
                when d.direction = 'down' then value
            else 0 end) OVER (ORDER BY d.n ASC) as rolling_aim
        , sum(
            case 
                when d.direction = 'forward' then value 
            else 0 end) OVER (ORDER BY d.n ASC) as rolling_horizontal
    FROM `advent-of-code-333818.2021.input_d2` d
)

, depth AS (
    SELECT 
        n
        , value*rolling_aim as depth_increase
    FROM rolling
    WHERE direction = 'forward' 
)

, summing AS (
    SELECT 
        sum(depth_increase) as depth_sum
    FROM depth
)

SELECT 
    depth_sum*(SELECT max(rolling_horizontal) FROM rolling)
FROM summing