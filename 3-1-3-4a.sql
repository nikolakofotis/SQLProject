DROP PROCEDURE if exists getGrades;
DELIMITER //
CREATE PROCEDURE getGrades(
    IN grade_lower INT,
    IN grade_upper INT
)
BEGIN
 
   select employee,job from promotion_history
    WHERE
        promotion_history.grade BETWEEN grade_lower AND grade_upper
        order by grade asc;

END //
DELIMITER ;
