-- Retrieve the display names of every user
-- who has received the Badge that has been
-- awarded the most times, excluding those badges
-- that have been awarded over ten thousand times.
-- Order the result in descending order.
-- 1.1 marks: <12 operators
-- 1.0 marks: <15 operators
-- 0.9 marks: <20 operators
-- 0.8 marks: correct answer

SELECT DISTINCT `DisplayName`
FROM `User` AS `U`
    JOIN `Badge` AS `B` ON (`U`.`Id` = `B`.`UserId`)
    RIGHT JOIN (
        SELECT `Name`, COUNT(`Name`) AS `Frequency`
        FROM `Badge`
        WHERE `Name` NOT IN (
            SELECT `Name`
            FROM `Badge`
            GROUP BY `Name`
            HAVING COUNT(`Name`) >= 10000)
        GROUP BY `Name`
        ORDER BY `Frequency` DESC
        LIMIT 1) AS `A` ON (`B`.`Name` = `A`.`Name`)
ORDER BY `DisplayName` DESC;