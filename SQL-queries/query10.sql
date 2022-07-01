-- Retrieve the postid and display name of the user who posted it
-- for *all* posts that have linked to at least twenty other posts,
-- ordered by postId
-- 1.1 marks: <8 operators
-- 1.0 marks: <9 operators
-- 0.9 marks: <11 operators
-- 0.8 marks: correct answer

SELECT `PostId`, MIN(`DisplayName`) AS `DisplayName`
FROM `Post` AS `P`
    JOIN `User` AS `U` ON (`P`.`OwnerUserId` = `U`.`Id`)
    RIGHT JOIN `Link` AS `L` ON (`L`.`PostId` = `P`.`Id`)
GROUP BY `PostId`
HAVING COUNT(`PostId`) > 19
ORDER BY `PostId`;