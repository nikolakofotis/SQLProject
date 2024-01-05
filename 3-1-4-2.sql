DELIMITER //
CREATE TRIGGER preventAppTrigger
BEFORE INSERT ON applies
FOR EACH ROW
BEGIN
    DECLARE activeapps INT;
    declare datetimeA datetime;
    
    select startDate into datetimeA from job 
    inner join applies on applies.jobID= new.jobID;
    
    IF dateiff(curdate(),datetimeA)<15 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot apply for the job';
    END IF;

   
    SELECT COUNT(*) INTO activeapps
    FROM applies
    WHERE candUsername = NEW.candUsername;

    IF activeapps >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot apply for the job. Maximum number of active applications reached.';
    END IF;
END;
//
DELIMITER ;
