-- 코드를 작성해주세요
SELECT ID, 
    CASE 
        WHEN CNT IS NULL THEN 0
        ELSE CNT
    END AS CHILD_COUNT
FROM ECOLI_DATA 
    LEFT JOIN (SELECT PARENT_ID, COUNT(*) AS CNT
            FROM ECOLI_DATA
            GROUP BY PARENT_ID) AS TMP 
    ON ECOLI_DATA.ID = TMP.PARENT_ID
ORDER BY ID;