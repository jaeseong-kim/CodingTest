/*
SELECT MONTH(START_DATE) MONTH,
       CAR_ID,
       COUNT(HISTORY_ID) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY MONTH, CAR_ID
HAVING RECORDS >= 5
ORDER BY MONTH, CAR_ID DESC;
*/

SELECT MONTH(START_DATE) MONTH,
       CAR_ID,
       COUNT(HISTORY_ID) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID, MONTH
HAVING MONTH >= 8 AND CAR_ID IN (SELECT T2.CAR_ID 
                                 FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY T2
                                 WHERE MONTH(T2.START_DATE) IN (8,9,10)
                                 GROUP BY T2.CAR_ID
                                 HAVING COUNT(CAR_ID) >= 5)
ORDER BY MONTH, CAR_ID DESC;