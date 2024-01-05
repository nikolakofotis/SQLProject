CREATE TABLE `promotion_request` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_username` varchar(30) NOT NULL,
  `job_id` int(10) NOT NULL,
  `status` enum('active','completed','canceled') NOT NULL,
  `submission_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employee` (`employee_username`),
  KEY `FK_job` (`job_id`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`employee_username`) REFERENCES `employee` (`username`),
  CONSTRAINT `FK_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
);


DELIMITER //
CREATE TRIGGER before_insert_promotion_request
BEFORE INSERT ON promotion_request
FOR EACH ROW
BEGIN
    DECLARE start_date DATE;
    SET start_date = (SELECT startDate FROM job WHERE id = NEW.job_id);
    IF NEW.status = 'active' AND DATEDIFF(start_date, NEW.submission_date) > 15 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New requests must be submitted up to 15 days before job start date';
    END IF;
END;
//
DELIMITER ;



-- update aithshs an thelei na allaksei apo akirosi se active 
DELIMITER //
CREATE TRIGGER before_update_promotion_request
BEFORE UPDATE ON promotion_request
FOR EACH ROW
BEGIN
    DECLARE active_count INT;
    SET active_count = (
        SELECT COUNT(*)
        FROM promotion_request
        WHERE employee_username = NEW.employee_username AND status = 'active'
    );

    IF NEW.status = 'active' AND active_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An employee cannot have more than three active requests.';
    END IF;
END;
//
DELIMITER ;

--DEN MPOREI NA KATAXORISEI NEA AITHSH AN EXEI HDH 3 ENERGES
DELIMITER //
CREATE TRIGGER beforeInsertCheckCount
BEFORE INSERT ON promotion_request
FOR EACH ROW
BEGIN
    DECLARE active_count INT;
    SET active_count = (
        SELECT COUNT(*)
        FROM promotion_request
        WHERE employee_username = NEW.employee_username AND status = 'active'
    );

    IF active_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An employee cannot have more than three active requests.';
    END IF;
END;
//
DELIMITER ;
--Η αίτηση ενός εργαζομένου μπορεί να ακυρωθεί μέχρι 10 μέρες πριν την ημερομηνία έναρξης της θέσης
DELIMITER //
CREATE TRIGGER preventCancelation
BEFORE UPDATE ON promotion_request
FOR EACH ROW
BEGIN
    DECLARE start_date DATE;
    SET start_date = (SELECT startDate FROM job WHERE id = NEW.job_id);
    IF NEW.status = 'canceled' AND DATEDIFF(start_date, NOW()) <= 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Canceled requests can only be submitted up to 10 days before job start date';
    END IF;
END;
//
DELIMITER ;
-- Insert ston pinaka// anna_wright exei 3 request (energopoiei trigger)
INSERT INTO `promotion_request` (`id`, `employee_username`, `job_id`, `status`, `submission_date`) VALUES (NULL, 'anna_wright', '2', 'active', '2023-12-29 18:38:01.000000');
INSERT INTO `promotion_request` (`id`, `employee_username`, `job_id`, `status`, `submission_date`) VALUES (NULL, 'cody_curtis', '3', 'active', '2023-12-29 18:39:18.000000'), (NULL, 'zayd_silva', '5', 'active', '2023-12-29 18:39:18.000000'), (NULL, 'anna_wright', '6', 'active', '2023-12-29 18:39:18.000000'), (NULL, 'anna_wright', '4', 'active', '2023-12-29 18:39:18.000000');

