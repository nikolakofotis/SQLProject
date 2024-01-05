DROP PROCEDURE if exists getEval ;
DELIMITER //
CREATE PROCEDURE getEval(
    IN evaluator Varchar(30)
)
BEGIN
	
   select employee,job  from promotion_history
    WHERE
        promotion_history.evaluator1=evaluator or promotion_history.evaluator2=evaluator
        order by job asc;

END //
DELIMITER ;
