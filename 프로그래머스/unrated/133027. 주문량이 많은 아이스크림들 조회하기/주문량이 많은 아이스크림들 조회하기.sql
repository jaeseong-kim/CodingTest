SELECT T1.FLAVOR
FROM FIRST_HALF T1
JOIN (SELECT FLAVOR, 
             SUM(TOTAL_ORDER) TOTAL_ORDER
      FROM JULY
      GROUP BY FLAVOR) T2
ON T1.FLAVOR = T2.FLAVOR
GROUP BY T1.FLAVOR
ORDER BY SUM(T1.TOTAL_ORDER+T2.TOTAL_ORDER) DESC
LIMIT 3;


/*
strawberry 3100 + 520 + 220 = 3840
chocolate 3200 + 520 = 3720
white_chocolate 3100 + 350 = 3450
vanilla  2800 + 560 = 3360
caramel 2600 + 460 = 3060
peach 2450 + 500 = 2950
min_chocolate 1700 + 400 = 2100
*/