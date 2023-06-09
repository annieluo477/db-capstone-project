-- this sql file is to check for booking on little lemon database 

USE littlelemondb;
DROP PROCEDURE IF EXISTS CheckBooking;

-- using the little lemon database

DELIMITER //

-- creates check booking using procedure
CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_no INT)
BEGIN
IF EXISTS(SELECT 1 FROM Booking WHERE Booking.Date = booking_date AND TableNumber = table_no)
THEN
SELECT CONCAT("Table " , table_no, " is already booked") AS `Booking status`; 
ELSE
SELECT CONCAT("Table " , table_no, " is available") AS `Booking status`; 
END IF;
END //

DELIMITER 

call CheckBooking("2022-12-22", 2);