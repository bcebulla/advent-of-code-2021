WITH gamma AS (
    SELECT 
        PERCENTILE_DISC(column1, 0.5) OVER () AS c1 
        , PERCENTILE_DISC(column2, 0.5) OVER () AS c2 
        , PERCENTILE_DISC(column3, 0.5) OVER () AS c3 
        , PERCENTILE_DISC(column4, 0.5) OVER () AS c4 
        , PERCENTILE_DISC(column5, 0.5) OVER () AS c5 
        , PERCENTILE_DISC(column6, 0.5) OVER () AS c6 
        , PERCENTILE_DISC(column7, 0.5) OVER () AS c7 
        , PERCENTILE_DISC(column8, 0.5) OVER () AS c8 
        , PERCENTILE_DISC(column9, 0.5) OVER () AS c9 
        , PERCENTILE_DISC(column10, 0.5) OVER () AS c10 
        , PERCENTILE_DISC(column11, 0.5) OVER () AS c11 
        , PERCENTILE_DISC(column12, 0.5) OVER () AS c12 
    FROM `advent-of-code-333818.2021.input_d3` 
)

, epsilon AS (
    SELECT 
        ABS(PERCENTILE_DISC(column1, 0.5) OVER ()-1) AS c1 
        , ABS(PERCENTILE_DISC(column2, 0.5) OVER ()-1) AS c2 
        , ABS(PERCENTILE_DISC(column3, 0.5) OVER ()-1) AS c3 
        , ABS(PERCENTILE_DISC(column4, 0.5) OVER ()-1) AS c4 
        , ABS(PERCENTILE_DISC(column5, 0.5) OVER ()-1) AS c5 
        , ABS(PERCENTILE_DISC(column6, 0.5) OVER ()-1) AS c6 
        , ABS(PERCENTILE_DISC(column7, 0.5) OVER ()-1) AS c7 
        , ABS(PERCENTILE_DISC(column8, 0.5) OVER ()-1) AS c8 
        , ABS(PERCENTILE_DISC(column9, 0.5) OVER ()-1) AS c9 
        , ABS(PERCENTILE_DISC(column10, 0.5) OVER ()-1) AS c10 
        , ABS(PERCENTILE_DISC(column11, 0.5) OVER ()-1) AS c11 
        , ABS(PERCENTILE_DISC(column12, 0.5) OVER ()-1) AS c12 
    FROM `advent-of-code-333818.2021.input_d3` 
)

SELECT 
    concat(
        max(g.c1)
        , max(g.c2)
        , max(g.c3)
        , max(g.c4)
        , max(g.c5)
        , max(g.c6)
        , max(g.c7)
        , max(g.c8)
        , max(g.c9)
        , max(g.c10)
        , max(g.c11)
        , max(g.c12)
        ) as gamma_rate
    , concat(
        max(e.c1)
        , max(e.c2)
        , max(e.c3)
        , max(e.c4)
        , max(e.c5)
        , max(e.c6)
        , max(e.c7)
        , max(e.c8)
        , max(e.c9)
        , max(e.c10)
        , max(e.c11)
        , max(e.c12)
        ) as epsilon_rate
FROM gamma g
CROSS JOIN epsilon e