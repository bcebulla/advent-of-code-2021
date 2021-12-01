SELECT 
    count(*)
FROM `advent-of-code-333818.2021.input_d1` a
JOIN `advent-of-code-333818.2021.input_d1` b on b.row = (a.row + 1)
                                            and b.depth > a.depth