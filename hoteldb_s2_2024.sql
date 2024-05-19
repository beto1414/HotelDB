SELECT Hotel_name, COUNT(*) AS Reservations_count
FROM Reservation
GROUP BY Hotel_name;

SELECT Hotels.Hotel_name, Hotels.City, AVG(Staff.Salary) AS Avg_salary
FROM Hotels
INNER JOIN Staff ON Hotels.Hotel_name = Staff.Hotel_name
GROUP BY Hotels.Hotel_name, Hotels.City;

SELECT 'Current_month' AS Time_period, Reservation.Hotel_name, COUNT(*) AS Reservation_count
FROM Reservation
WHERE MONTH(STR_TO_DATE(Reservation.Start_date, '%d-%m-%Y')) = MONTH(CURDATE())
GROUP BY Reservation.Hotel_name
UNION
SELECT 'Next_month' AS Time_period, Reservation.Hotel_name, COUNT(*) AS Reservation_count
FROM Reservation
WHERE MONTH(STR_TO_DATE(Reservation.Start_date, '%d-%m-%Y')) = MONTH(CURDATE()) + 1
GROUP BY Reservation.Hotel_name;

DELIMITER //
DROP FUNCTION IF EXISTS calculate_total_payment;

CREATE FUNCTION calculate_total_payment(reservation_no DECIMAL(4,0)) RETURNS DECIMAL(8,2)
BEGIN
    DECLARE total_amount DECIMAL(8,2);
    SELECT SUM(Amount) INTO total_amount FROM Payment_information WHERE Reservation_no = reservation_no;
    RETURN total_amount;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS update_room_price;

CREATE PROCEDURE update_room_price(in_room_no DECIMAL(3,0), new_price DECIMAL(8,2))
BEGIN
    UPDATE Room_type 
    JOIN Room ON Room.Room_type = Room_type.Room_type
    SET Room_type.Price = new_price 
    WHERE Room.Room_no = in_room_no;
END;
//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS update_room_status;

CREATE TRIGGER update_room_status
AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
    UPDATE Room SET Status = 'Unavailable' WHERE Room_no = NEW.Room_no AND Hotel_name = NEW.Hotel_name;
END;
//
DELIMITER ;

SELECT calculate_total_payment('0001') AS Total_Payment;


SELECT * FROM Room_type;
CALL update_room_price(101, 89.99);
SELECT * FROM Room_type;

ALTER TABLE Room ADD Status VARCHAR(30) DEFAULT 'Available';
SELECT * FROM Room WHERE Hotel_name = 'Sleepy Hotel';
INSERT INTO Reservation (Reservation_no, Start_date, End_date, Guest_name, Room_no, Hotel_name)
VALUES ('0015', '2022-01-01', '2022-01-07', 'John Doe', '101', 'Sleepy Hotel');
SELECT * FROM Room WHERE Hotel_name = 'Sleepy Hotel';

UPDATE Guest
SET First_name = "Anders", Last_name = "Persson"
WHERE Guest_id = "1.00" AND First_name  = "Jonas" AND Last_name = "Schmidt";
SELECT * FROM Guest;

DELETE FROM Room
WHERE Room_no = 403 AND Hotel_name = 'Mountain Lodge';
SELECT * FROM Room
