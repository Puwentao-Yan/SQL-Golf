-- Retrieve the Post that has the highest
-- score, summed over itself and all its children
-- 1.1 marks: <8 operators
-- 1.0 marks: <10 operators
-- 0.9 marks: <12 operators
-- 0.8 marks: correct answer

SELECT `P1`.`Id` AS `Id`, SUM(`FamilyScore` + `P1`.`Score`) AS `FamilyScore`
FROM `Post` AS `P1`
    JOIN (
        SELECT SUM(`Score`) AS `FamilyScore`, `ParentId`
        FROM `Post`
        GROUP BY `ParentId`
    ) AS `P2` ON (`P1`.`Id` = `P2`.`ParentId`)
GROUP BY `Id`
ORDER BY `FamilyScore` DESC
LIMIT 1;