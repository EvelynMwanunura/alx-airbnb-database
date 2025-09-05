
CREATE TABLE Booking_Partitioned (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


INSERT INTO Booking_Partitioned
SELECT * FROM Booking;


EXPLAIN
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';

EXPLAIN
SELECT property_id, COUNT(*) AS total_bookings
FROM Booking_Partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY property_id;