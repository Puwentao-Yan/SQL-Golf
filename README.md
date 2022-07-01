# SQL-Golf Task

Code Golf is a sort of recreational programming activity in which one tries to implement functionality using as few characters as possible. The general goal is to think of alternative solutions to a problem and it derives its name from the sport of golf, in which one tries to minimise the number of whacks with an iron shaft to put a tiny ball in a far-flung hole. In this assignment, you will try not just to write SQL queries that are correct, but that also are "minimal."

As an example, imagine that you have two relations: Employee(employee_id, employee_name, dept_id) and Department(dept_id, dept_name) and you would like to find the names of all employees in a department named "Shipping & Receiving". A simple solution would be:

SELECT `employee_name`
FROM `Employee`
    NATURAL JOIN `Department`
WHERE `dept_name` LIKE 'Shipping \& Receiving';
Certainly, another "correct" solution would be:

SELECT `employee_name`
FROM `Employee`
WHERE `dept_id` IN (
    SELECT `dept_id`
    FROM `Department`
    WHERE `dept_name` LIKE 'Shipping \& Receiving' );
Both queries retrieve the same result, but the second query is unnecessarily complex, or at the very least non-idiomatic. I hope that you prefer the first solution. Even if not, this assignment is designed to encourage you to write the first query by rewarding you inversely to the number of times any of the following tokens appears in your SQL query:

SELECT (i.e., projection operator)
FROM (i.e., the table- or index-scan operator)
, (i.e., the cross product operator, including other appearances such as in a SELECT clause)
JOIN (i.e., a theta-, natural, or outer join or per MySQL an intersection)
UNION (i.e., the bag union operator)
DISTINCT (i.e., the duplicate elimination operator)
GROUP (i.e., the group-by operator)
ORDER (i.e., the sort operator)
HAVING (i.e., the selection operator applied to groups)
WHERE (i.e., the selection operator applied to tuples)
LIMIT (i.e., the MySQL top-k operator)
This gives us a metric by which to claim the first query is better: it only uses 4 instances of the above set of operators (SELECT, FROM, JOIN, and WHERE), whereas the second query uses 6 instances (2×SELECT, 2×FROM, 2×WHERE). This is the metric that you should aim to minimise with the SQL queries that you submit. You would receive more marks for the first query than the second one.

It is important to remember that this is an exercise in code simplification and creative thinking, not in performance optimisation. Although you are trying to minimise the number of operator references, SQL is a declarative language and there is no specific reason to assume that the first example query will run faster than the second one. However, simple and idiomatic code is easier for compilers to optimise, so there could be tangential performance benefits to striving for simpler—or at least shorter—queries. The real intent here is to leverage an assumed correlation between this "golf score" metric and the quality of a SQL query to encourage you to write better SQL.

You are given instructions to create (optionally) a MySQL database or to connect to one on a remote server. Moreover, you are given fiften .sql files that are unfortunately empty except for a comment indicating their intended query and their mapping between "SQL Golf" scores (i.e., total instances of the aforementioned operators/tokens) and grade. For example, the above problem would be represented by the following example.sql file:

-- Find the names of all employees in a department named "Shipping & Receiving"
-- 1.1 marks: <4 operators
-- 1.0 marks: <6 operators
-- 0.8 marks: correct answer

-- Replace this comment line with the actual query
Alongside the .sql file will be a .tsv file showing the expected result, which you can use for testing.
