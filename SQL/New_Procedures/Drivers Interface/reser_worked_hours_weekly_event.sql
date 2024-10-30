DELIMITER //

CREATE EVENT reset_worked_hours_weekly
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-11-03 00:00:00'
DO
    CALL start_new_week();

//

DELIMITER ;
