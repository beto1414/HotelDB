DROP DATABASE IF EXISTS Hotelmanagement;
CREATE DATABASE IF NOT EXISTS Hotelmanagement;

USE Hotelmanagement;
DROP TABLE IF EXISTS Payment_information;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS Room_type;
DROP TABLE IF EXISTS Hotels;
DROP TABLE IF EXISTS Room;



CREATE TABLE Hotels (
    Hotel_name VARCHAR(30),
    City VARCHAR(30),
    Country VARCHAR(30),
    PRIMARY KEY(Hotel_name)
);


CREATE TABLE Room_type (
    Room_type VARCHAR(30),
    Capacity DECIMAL(3,0),
    Price DECIMAL(8,2),
    PRIMARY KEY(Room_type)
);

CREATE TABLE Guest (
    Guest_id DECIMAL(8,0) PRIMARY KEY,
    First_name VARCHAR(20) NOT NULL,
    Last_name VARCHAR(20) NOT NULL,
    No_guests DECIMAL(35,0),
    Address VARCHAR(255),
    Phone_no DECIMAL(8,0),
    Email VARCHAR(30)
);


CREATE TABLE Room (
    Room_no DECIMAL(3,0),
    Hotel_name VARCHAR(30),
    Room_type VARCHAR(30),
    Price DECIMAL(8,2),
    PRIMARY KEY(Room_no, Hotel_name),
	FOREIGN KEY(Hotel_name) REFERENCES Hotels(Hotel_name),
    FOREIGN KEY(Room_type) REFERENCES Room_type(Room_type)
);

CREATE TABLE Reservation (
    Reservation_no DECIMAL(4,0) PRIMARY KEY,
    Start_date VARCHAR(10),
    End_date VARCHAR(10),
    Guest_name VARCHAR(30),
    Guest_id DECIMAL(8,0),
    Room_no DECIMAL(3,0),
    Hotel_name VARCHAR(30),
    FOREIGN KEY(Guest_id) REFERENCES Guest(Guest_id),
    FOREIGN KEY(Room_no, Hotel_name) REFERENCES Room(Room_no, Hotel_name)
); 
     

CREATE TABLE Staff (
    Staff_id DECIMAL(8,0),
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Hotel_name VARCHAR(30),
    Salary DECIMAL(8,2),
    PRIMARY KEY(Staff_id),
    FOREIGN KEY(Hotel_name) REFERENCES Hotels(Hotel_name)
);

CREATE TABLE Payment_information (
    Payment_id INT, #DECIMAL(8,0)
    Reservation_no DECIMAL(4,0),
    Has_paid VARCHAR(5), # ja eller nej
    Amount DECIMAL(8,2),
    PRIMARY KEY(Payment_id),
    FOREIGN KEY(Reservation_no) REFERENCES Reservation(Reservation_no)
);



INSERT INTO Hotels VALUES
('Sleepy Hotel', 'Copenhagen', 'Denmark'),
('Dreamy Inn', 'Aarhus', 'Denmark'),
('Seaside Resort', 'Odense', 'Denmark'),
('Mountain Lodge', 'Aalborg', 'Denmark'),
('Urban Hotel', 'Esbjerg', 'Denmark');

INSERT INTO Room_type VALUES
('Single', 1, 79.99),
('Double', 2, 89.99),
('Suite', 4, 199.99),
('Deluxe', 2, 139.99),
('Standard', 2, 99.99);


# Room_no, Hotel_name, Room_type, pricee
INSERT INTO Room VALUES
(101, 'Sleepy Hotel', 'Single', 79.99),
(102, 'Sleepy Hotel', 'Double', 89.99),
(103, 'Sleepy Hotel', 'Double', 89.99),

(201, 'Dreamy Inn', 'Suite', 199.99),
(202, 'Dreamy Inn', 'Suite', 199.99),
(203, 'Dreamy Inn', 'Deluxe', 139.99),

(301, 'Seaside Resort', 'Standard', 99.99),
(302, 'Seaside Resort', 'Single', 79.99),
(303, 'Seaside Resort', 'Double', 89.99),

(401, 'Mountain Lodge', 'Single', 79.99),
(402, 'Mountain Lodge', 'Standard', 99.99),
(403, 'Mountain Lodge', 'Suite', 199.99),

(501, 'Urban Hotel', 'Single', 79.99),
(502, 'Urban Hotel', 'Double', 89.99),
(503, 'Urban Hotel', 'Double', 89.99),

(601, 'Dreamy Inn', 'Standard', 99.99),
(602, 'Dreamy Inn', 'Standard', 99.99),
(603, 'Dreamy Inn', 'Deluxe', 139.99);


 INSERT Guest VALUES
 (000001,'Jonas', 'Schmidt', '1', 'Paris Blvd. 4','98342312','jonass@mail.com'),
 (000002, 'Freja', 'Nielsen', 2, 'Brogade 23, 7100 Vejle', '87654321', 'freja.nielsen@email.dk'),
 (000003, 'Lucas', 'Jensen', 1, 'Langgade 34, 8000 Aarhus', '12345678', 'lucas.jensen@email.dk'),
 (000004, 'Sofia', 'Hansen', 3, 'Hovedgaden 45, 6700 Esbjerg', '23456789', 'sofia.hansen@email.dk'),
 
 (000005, 'Emil', 'Petersen', 4, 'Strandvejen 56, 1050 København K', '34567890', 'emil.petersen@email.dk'),
 (000006, 'Ida', 'Larsen', 2, 'Prinsessegade 67, 1422 København K', '45678901', 'ida.larsen@email.dk'),
 (000007, 'Magnus', 'Sørensen', 1, 'Østergade 78, 4000 Roskilde', '56789012', 'magnus.sorensen@email.dk'),
 
 (000008, 'Alma', 'Rasmussen', 3, 'Vestergade 89, 5000 Odense', '67890123', 'alma.rasmussen@email.dk'),
 (000009, 'Oscar', 'Christensen', 2, 'Nørregade 90, 1165 København K', '78901234', 'oscar.christensen@email.dk'),
 (000010, 'Ella', 'Lauridsen', 4, 'Kongensgade 12, 6000 Kolding', '89012345', 'ella.lauridsen@email.dk'),
 
 (000011, 'Alexander', 'Thomsen', 1, 'Borgergade 23, 1300 København K', '90123456', 'alexander.thomsen@email.dk'),
 (000012, 'Maja', 'Svendsen', 3, 'Fiolstræde 34, 1171 København K', '01234567', 'maja.svendsen@email.dk'),
 (000013, 'Noah', 'Andersen', 2, 'Studiestræde 45, 1455 København K', '12345670', 'noah.andersen@email.dk'),
 
 (000014, 'Anna', 'Christiansen', 4, 'Læderstræde 56, 1201 København K', '23456780', 'anna.christiansen@email.dk');
 
 INSERT Reservation VALUES # Reservation_no, start, end, guest_name, guest_id, room_no, Hotel_name
 (0001 ,03-05-2023, '05-05-2023', 'Jonas Schmidt', 000001,101, 'Sleepy Hotel'),
 (0002, '04-06-2023', '08-06-2023', 'Freja Nielsen',000002, 201, 'Dreamy Inn'),
 (0003, '15-07-2023', '20-07-2023', 'Lucas Jensen', 000003,301, 'Seaside Resort'),
 
 (0004, '25-08-2023', '30-08-2023', 'Sofia Hansen',000004, 401, 'Mountain Lodge'),
 (0005, '05-09-2023', '10-09-2023', 'Emil Petersen',000005, 501, 'Urban Hotel'),
 
 (0006, '16-10-2023', '21-10-2023', 'Ida Larsen',000006, 502, 'Urban Hotel'),
 (0007, '27-11-2023', '02-12-2023', 'Magnus Sørensen',000007, 102, 'Sleepy Hotel'),
 (0008, '08-12-2023', '15-12-2023', 'Alma Rasmussen',000008, 402, 'Mountain Lodge'),
 
 (0009, '19-01-2024', '24-01-2024', 'Oscar Christensen',000009, 302, 'Seaside Resort'),
 (0010, '28-02-2024', '05-03-2024', 'Ella Lauridsen', 000010,103, 'Sleepy Hotel'), 
 
 (0011, '12-03-2024', '17-03-2024', 'Alexander Thomsen',000011, 503, 'Urban Hotel'), 
 (0012, '23-04-2024', '28-04-2024', 'Maja Svendsen', 000012,603, 'Dreamy Inn'),
 (0013, '04-05-2024', '09-05-2024', 'Noah Andersen', 000013,601, 'Dreamy Inn'),
 (0014, '15-06-2024', '20-06-2024', 'Anna Christiansen',000014, 602, 'Dreamy Inn');
 
 INSERT Payment_information VALUES
(10001, '0001', TRUE, 159.98),
(10002, '0002', FALSE, 358.98),
(10003, '0003', TRUE, 799.95),
(10004, '0004', FALSE, 279.98),
(10005, '0005', TRUE, 199.99),
(10006, '0006', FALSE, 234.95),
(10007, '0007', TRUE, 279.98),
(10008, '0008', TRUE, 292.98),
(10009, '0009', TRUE, 223.98),
(10010, '0010', FALSE, 223.98),
(10011, '0011', TRUE, 363.98),
(10012, '0012', FALSE, 261.98),
(10013, '0013', FALSE, 142.98),
(10014, '0014', TRUE, 222.98);


INSERT Staff VALUES
(50001, 'Emil', 'Andersen', 'Sleepy Hotel', 3000.00),
(50002, 'Nikola', 'Milanovic', 'Dreamy Inn', 3500.00),
(50003, 'Linda', 'Rasmussen', 'Seaside Resort', 2500.00),
(50004, 'Mikkel', 'Christiansen', 'Mountain Lodge', 4000.00),
(50005, 'Jonas', 'Leth', 'Urban Hotel', 3200.00);

SELECT * FROM Guest;

SELECT * FROM Reservation;	

SELECT * FROM Hotels;

SELECT * FROM Room;

SELECT * FROM Room_type;

SELECT * FROM Staff;

SELECT * FROM Payment_information;





 
 
 

 