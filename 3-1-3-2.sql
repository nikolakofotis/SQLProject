DROP PROCEDURE IF EXISTS ManageApplication;
DELIMITER //

CREATE PROCEDURE ManageApplication(
    IN empUsername VARCHAR(30),
    IN jobId INT,
    IN ch CHAR(1)
)
BEGIN
declare counter int;
declare stat varchar(10);
declare flag int;
declare empid int;
DECLARE curs CURSOR FOR SELECT count(*), status,id from promotion_request where employee_username=empUsername ;
declare continue handler for not found set flag=1;
case ch

when "i" then 
INSERT INTO promotion_request (
    employee_username,
    job_id,
    status,
    submission_date,
    grade
) VALUES (
    empUsername,
    jobId,
    'active', 
    curdate(), 
    0.0 
);

when "c" then
open curs;
set flag=0;
fetch curs into counter,stat,empid;
while(flag=0)do
fetch curs Into counter,stat,empid;
if counter<=0 then
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No records for this name';
elseif stat="active" then
update promotion_request set status="canceled" where id=empid;
elseif stat="canceled" then
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Already canceled request';
        end if;
        end while;
        
        
when "a" then

open curs;
set flag=0;
fetch curs into counter,stat,empid;
while(flag=0)do
fetch curs Into counter,stat,empid;
if counter<=0 then
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No records for this name';
elseif stat="canceled" then
update promotion_request set status="active" where id=empid;
elseif stat="active" then
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Already active request';
        end if;
        
end while;
else
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occured';
end case;
END //

DELIMITER ;

/*call ManageApplication("zayd_silva", 5,"c");*/
