-- Retrieve the post id of all posts before July 2010 that
-- have never been linked to, ordered descending
-- 1.1 marks: <6 operators
-- 1.0 marks: <8 operators
-- 0.8 marks: correct answer

SELECT `Id`
FROM `Post`
WHERE `Id` NOT IN (
    SELECT DISTINCT `P`.`Id`
    FROM `Post` AS `P`
        JOIN `Link` AS `L` ON (`P`.`Id` = `L`.`RelatedPostId`))
    AND `CreationDate` <= '2010-06-30'
ORDER BY `Id` DESC;