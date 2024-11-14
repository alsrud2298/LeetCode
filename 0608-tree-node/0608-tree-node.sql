# Write a solution to report the type of each node in the tree.
# Root : 부모 노드가 없는 경우
# Leaf : 자식 노드가 없는 경우 (p_id 목록에 없는 경우)
WITH Leaf_CTE AS (
    SELECT id
    FROM Tree
    WHERE id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL)
)

SELECT id
    , CASE WHEN p_id IS NULL THEN 'Root'
    WHEN id IN (SELECT id FROM Leaf_CTE) THEN 'Leaf'
    ELSE 'Inner' END AS type
FROM Tree
