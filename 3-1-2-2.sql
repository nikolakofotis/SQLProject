DELIMITER //

CREATE PROCEDURE EvaluatePromotionRequest(
    IN request_id INT,
    IN evaluator1_grade INT,
    IN evaluator2_grade INT
)
BEGIN
    DECLARE request_status VARCHAR(20);
    DECLARE avg_grade DECIMAL(5,2);
    DECLARE BSC INT;
    DECLARE MSC INT;
    DECLARE PHD INT;
    DECLARE FLANG INT;
    DECLARE PROJECT INT;
	DECLARE CANDUNAME VARCHAR(50);
	
	SELECT employee_username INTO CANDUNAME FROM promotion_request WHERE id = request_id;
	
	

    
    SELECT status INTO request_status
    FROM promotion_request
    WHERE id = request_id;

  
    IF request_status != 'canceled' THEN
        
        SET avg_grade = (evaluator1_grade + evaluator2_grade) / 2;

       
        IF evaluator1_grade IS NULL OR evaluator2_grade IS NULL THEN
          

            
            SELECT 
                COUNT(*) INTO BSC 
            FROM 
                hasdegree inner join degree on degrTitle=degree.titlos
            WHERE 
                candUsername = CANDUNAME
                AND degree.bathmida = 'bsc';

            SELECT 
                COUNT(*) INTO MSC 
            FROM 
                hasdegree inner join degree on degrTitle=degree.titlos
            WHERE 
                candUsername = CANDUNAME
                AND degree.bathmida = 'msc';

            SELECT 
                COUNT(*) INTO PHD 
            FROM 
                hasdegree inner join degree on degrTitle=degree.titlos
            WHERE 
                candUsername = CANDUNAME
                AND degree.bathmida = 'phd';

            -- Γλώσσες
            SELECT 
                COUNT(*) INTO FLANG 
            FROM 
                languages
            WHERE 
                candid = CANDUNAME;

            -- Έργα
            SELECT 
                COUNT(*) INTO PROJECT 
            FROM 
                project
            WHERE 
                candid = CANDUNAME;

            -- Υπολογισμός συνολικού βαθμού
            SET avg_grade = avg_grade + BSC * 1 + MSC * 2 + PHD * 3 + FLANG * 1 + PROJECT * 1;
        END IF;
		
		 SELECT 
            employee_username
        FROM 
            promotion_request
        WHERE 
            job_id = (SELECT job_id FROM promotion_request WHERE id = request_id)
        ORDER BY 
            grade DESC, submission_date ASC
        LIMIT 1;

        
        UPDATE promotion_request
        SET grade = avg_grade
        WHERE id = request_id;
		
		INSERT INTO promotion_history (employee_username, job_id, status, grade)
        VALUES (selected_employee_username, (SELECT job_id FROM promotion_request WHERE id = request_id), 'completed', avg_grade);
		
		 DELETE FROM promotion_request
        WHERE id = request_id;
		
		
	ELSE
	
	 INSERT INTO promotion_history (employee_username, job_id, status, grade)
        VALUES ((SELECT employee_username FROM promotion_request WHERE id = request_id), (SELECT job_id FROM promotion_request WHERE id = request_id), 'completed', 0);
		
		
		DELETE FROM promotion_request
        WHERE id = request_id;
	END IF;
		
	
		
		
	
	
END //

DELIMITER ;
