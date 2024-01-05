DROP PROCEDURE IF EXISTS GetEvaluationGrade;
DELIMITER //
CREATE PROCEDURE GetEvaluationGrade(
    IN evaluator_username VARCHAR(30),
    IN employee_username VARCHAR(30),
    IN job_id INT,
    OUT evaluation_grade INT
)
BEGIN
    DECLARE
        eval VARCHAR(30) ; DECLARE grad INT ; DECLARE BSC INT ; DECLARE MSC INT ; DECLARE PHD INT ; DECLARE FLANG INT ; DECLARE PROJECT INT ;
    SELECT
        evaluator
    INTO eval
FROM
    job
WHERE
    job.id = job_id ;
SELECT
    grade
INTO grad
FROM
    applies
WHERE
    applies.candUsername = employee_username ;
	IF eval != evaluator_username THEN
SET
    evaluation_grade = 0 ;
    
	elseif grad is not NULL THEN
    SET
evaluation_grade = grad ;
 ELSE
SELECT
    COUNT(*)
INTO BSC
FROM
    hasdegree
INNER JOIN degree ON degrTitle = degree.titlos
WHERE
    candUsername = employee_username AND degree.bathmida = 'bsc' ;
SELECT
    COUNT(*)
INTO MSC
FROM
    hasdegree
INNER JOIN degree ON degrTitle = degree.titlos
WHERE
    candUsername = employee_username AND degree.bathmida = 'msc' ;
SELECT
    COUNT(*)
INTO PHD
FROM
    hasdegree
INNER JOIN degree ON degrTitle = degree.titlos
WHERE
    candUsername = employee_username AND degree.bathmida = 'phd' ;
SELECT
    COUNT(*)
INTO FLANG
FROM
    languages
WHERE
    candid = employee_username ;
SELECT
    COUNT(*)
INTO PROJECT
FROM
    project
WHERE
    candid = employee_username ;
SET evaluation_grade=0;
set 
    evaluation_grade = evaluation_grade + BSC * 1 + MSC * 2 + PHD * 3 + FLANG * 1 + PROJECT * 1 ;
END IF ;
UPDATE
    applies
SET
    grade = evaluation_grade
WHERE
    candUsername = employee_username ;
END //
DELIMITER ;