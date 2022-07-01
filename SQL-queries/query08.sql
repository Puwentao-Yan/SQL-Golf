-- Note: Aspects of this are *very* tricky
-- Retrieve the display name of all users who have
-- never posted a post that has been linked by another post
-- ordered ascending
-- 1.1 marks: <8 operators
-- 1.0 marks: <10 operators
-- 0.8 marks: correct answer

SELECT `DisplayName`
FROM `User`
WHERE `Id` NOT IN (
    SELECT DISTINCT `U`.`Id`
    FROM `Post` AS `P`
        JOIN `Link` AS `L` ON (`P`.`Id` = `L`.`RelatedPostId`)
        JOIN `User` AS `U` ON (`U`.`Id` = `P`.`OwnerUserId`))
ORDER BY `DisplayName`;