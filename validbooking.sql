-- Booking
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking (IN Booking_Date DATE, IN TableNum INT)
BEGIN
START TRANSACTION;
SELECT BookingID INTO @id FROM Bookings ORDER BY BookingID DESC LIMIT 1;
SET @id = @id + 1;
SELECT BookingDate INTO Booking_Date FROM bookings WHERE BookingDate = Booking_Date LIMIT 1;
SELECT TableNo INTO TableNum FROM bookings WHERE TableNo = TableNum LIMIT 1;
INSERT INTO bookings(BookingID, BookingDate, TableNo, CustomerID, StaffID) values
	(@id, Booking_date, TableNum, null, null);
    SELECT CONCAT('Booking Successful');
    IF TableNum = null THEN COMMIT;
    ELSE ROLLBACK;
    SELECT CONCAT("Table ", TableNum, " is already booked - booking cancelled") AS BookingStatus;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6);