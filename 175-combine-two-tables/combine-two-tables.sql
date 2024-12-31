SELECT firstName
    , lastName
    , city
    , state
FROM Address a
    RIGHT JOIN Person p ON p.personId = a.personId