DELIMITER //
CREATE TRIGGER PreventCancelationTrigger
BEFORE UPDATE ON applies
FOR EACH ROW
BEGIN
    DECLARE dateS INT;
    DECLARE activeApps INT;

   select startDate into dateS from job 
    inner join applies on applies.jobID= new.jobID;
    IF dateiff(curdate(),dateS)<10  THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot cancel the application. Cancellation date is too close to the job start date.';
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
