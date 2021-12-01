WITH mycalc AS (
    SELECT 
        a.row
        , SUM(depth) over (order by a.row ROWS BETWEEN 2 preceding AND current row) as depththree
    FROM `advent-of-code-333818.2021.input_d1` a
)

SELECT 
    count(*)
FROM mycalc a
JOIN mycalc b on b.row = (a.row + 1)
            and b.depththree > a.depththree
WHERE a.row >= 3