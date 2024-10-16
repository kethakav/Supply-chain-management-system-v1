DELIMITER //

CREATE PROCEDURE Show_Stores()
BEGIN
    select * from store ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Show_Trucks()
BEGIN
    select * from truck ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Show_Customers()
BEGIN
    select * from customer ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Show_Store_Managers()
BEGIN
    select * from manager ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Show_Drivers()
BEGIN
    select * from driver ;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE Show_assistant_Drivers()
BEGIN
    select * from assistant_driver ;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Show_Trains()
BEGIN
    select * from train ;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE Show_financeandorder_manager()
BEGIN
    select * from financeandorder_manager ;
END //

DELIMITER ;
