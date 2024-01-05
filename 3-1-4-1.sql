-
DELIMITER //
CREATE TRIGGER job_log_trigger
AFTER INSERT ON job
FOR EACH ROW
BEGIN
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', 'Inserted into job table', NOW());
END;
//
DELIMITER ;
-
DELIMITER //
CREATE TRIGGER jobupd_log_trigger
AFTER update ON job
FOR EACH ROW
BEGIN
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', 'Updated job table', NOW());
END;
//
DELIMITER ;

-
DELIMITER //
CREATE TRIGGER jobdel_log_trigger
AFTER delete ON job
FOR EACH ROW
BEGIN
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', 'Deleted a job table', NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER userinsert_log_trigger
BEFORE INSERT on user
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = 'Inserted into user table';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER userUpadate_log_trigger
BEFORE update on user
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = 'Updated users table';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER userdelete_log_trigger
BEFORE delete on user
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = 'Deleted a user ';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER degrins_log_trigger
BEFORE insert on degree
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = ' Inserted in degree table';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER degupd_log_trigger
BEFORE update on degree
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = ' Updated degree table';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER degrdel_log_trigger
BEFORE delete on degree
FOR EACH ROW
BEGIN
    DECLARE action_desc VARCHAR(255);
        SET action_desc = 'deleted from degree table';
    INSERT INTO dba_log (dba_username, action_description, start_date)
    VALUES ('rick', action_desc, NOW());
END;
//
DELIMITER ;





