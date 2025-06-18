
SELECT
    cp.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(MIN(cn.test_date),MIN(cp.test_date)) AS recovery_time
FROM covid_tests cp
INNER JOIN covid_tests cn
    ON cp.patient_id = cn.patient_id
    AND cp.test_date < cn.test_date
    AND cp.result = 'Positive' 
    AND cn.result = 'Negative'
INNER JOIN patients p
    ON cp.patient_id = p.patient_id
GROUP BY    
    1,2,3
ORDER BY
    recovery_time,
    patient_name