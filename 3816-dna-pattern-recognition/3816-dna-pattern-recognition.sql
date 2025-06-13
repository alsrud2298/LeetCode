-- 1. ATG로 시작하고, ('TAA','TAG','TGA')로 끝나야 함.
-- 2. ATAT를 포함해야 함
-- 최소 3개 이상의 연속된 G를 포함해야 함.

SELECT
    *,
    MAX(CASE WHEN LEFT(dna_sequence,3) = 'ATG' THEN 1 ELSE 0 END) AS has_start,
    MAX(CASE WHEN RIGHT(dna_sequence,3) IN ('TAA', 'TAG', 'TGA') THEN 1 ELSE 0 END) AS has_stop,
    MAX(CASE WHEN dna_sequence LIKE '%ATAT%' THEN 1 ELSE 0 END) AS has_atat,
    MAX(CASE WHEN dna_sequence LIKE '%GGG%' THEN 1 ELSE 0 END) AS has_ggg
FROM Samples
GROUP BY
    sample_id,
    dna_sequence,
    species
ORDER BY
    sample_id ASC