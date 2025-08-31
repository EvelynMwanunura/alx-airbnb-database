-- ==========================
-- Sample Data for User Table
-- ==========================
INSERT INTO `User` (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '0712345678', 'guest'),
(UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '0723456789', 'host'),
(UUID(), 'Charlie', 'Brown', 'charlie@example.com', 'hashedpassword3', NULL, 'admin'),
(UUID(), 'Diana', 'King', 'diana@example.com', 'hashedpassword4', '0734567890', 'guest'),
(UUID(), 'Ethan', 'Wright', 'ethan@example.com', 'hashedpassword5', '0745678901', 'guest'),
(UUID(), 'Fiona', 'Hall', 'fiona@example.com', 'hashedpassword6', '0756789012', 'host'),
(UUID(), 'George', 'Lee', 'george@example.com', 'hashedpassword7', '0767890123', 'guest'),
(UUID(), 'Hannah', 'Scott', 'hannah@example.com', 'hashedpassword8', '0778901234', 'guest'),
(UUID(), 'Ian', 'Green', 'ian@example.com', 'hashedpassword9', '0789012345', 'guest'),
(UUID(), 'Julia', 'Adams', 'julia@example.com', 'hashedpassword10', '0790123456', 'host');

-- =============================
-- Sample Data for Property Table
-- =============================
INSERT INTO `Property` (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Bob'), 'Seaside Villa', 'Beautiful villa by the beach', 'Cape Town', 1500.00),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Bob'), 'Mountain Cabin', 'Cozy cabin in the mountains', 'Drakensberg', 900.00),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Fiona'), 'City Apartment', 'Modern apartment in downtown', 'Johannesburg', 1200.00),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Fiona'), 'Lake House', 'House by the lake', 'Hartbeespoort', 1400.00),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Julia'), 'Safari Lodge', 'Lodge near Kruger Park', 'Mpumalanga', 2000.00);

-- ===========================
-- Sample Data for Booking Table
-- ===========================
INSERT INTO `Booking` (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM `Property` WHERE name='Seaside Villa'), (SELECT user_id FROM `User` WHERE first_name='Alice'), '2025-09-10', '2025-09-15', 7500.00, 'confirmed'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Mountain Cabin'), (SELECT user_id FROM `User` WHERE first_name='Diana'), '2025-10-01', '2025-10-05', 4500.00, 'pending'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='City Apartment'), (SELECT user_id FROM `User` WHERE first_name='Ethan'), '2025-08-20', '2025-08-25', 6000.00, 'confirmed'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Lake House'), (SELECT user_id FROM `User` WHERE first_name='George'), '2025-11-05', '2025-11-10', 7000.00, 'canceled'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Safari Lodge'), (SELECT user_id FROM `User` WHERE first_name='Hannah'), '2025-12-01', '2025-12-07', 14000.00, 'confirmed');

-- Add more bookings similarly up to ~20 records
-- Repeat with different users, properties, dates, prices, and status

-- ===========================
-- Sample Data for Payment Table
-- ===========================
INSERT INTO `Payment` (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM `Booking` WHERE total_price=7500.00), 7500.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM `Booking` WHERE total_price=4500.00), 4500.00, 'paypal'),
(UUID(), (SELECT booking_id FROM `Booking` WHERE total_price=6000.00), 6000.00, 'stripe'),
(UUID(), (SELECT booking_id FROM `Booking` WHERE total_price=7000.00), 7000.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM `Booking` WHERE total_price=14000.00), 14000.00, 'paypal');

-- Repeat to reach ~20 records, linking to different bookings

-- ==========================
-- Sample Data for Review Table
-- ==========================
INSERT INTO `Review` (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM `Property` WHERE name='Seaside Villa'), (SELECT user_id FROM `User` WHERE first_name='Alice'), 5, 'Amazing stay! Highly recommend.'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Mountain Cabin'), (SELECT user_id FROM `User` WHERE first_name='Diana'), 4, 'Very cozy and quiet location.'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='City Apartment'), (SELECT user_id FROM `User` WHERE first_name='Ethan'), 5, 'Perfect location and clean rooms.'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Lake House'), (SELECT user_id FROM `User` WHERE first_name='George'), 3, 'Nice view but needs maintenance.'),
(UUID(), (SELECT property_id FROM `Property` WHERE name='Safari Lodge'), (SELECT user_id FROM `User` WHERE first_name='Hannah'), 5, 'Once in a lifetime experience!');

-- Repeat to reach ~20–30 reviews

-- ==========================
-- Sample Data for Message Table
-- ==========================
INSERT INTO `Message` (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Alice'), (SELECT user_id FROM `User` WHERE first_name='Bob'), 'Hi, I would like to know if the villa is available next weekend.'),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Bob'), (SELECT user_id FROM `User` WHERE first_name='Alice'), 'Yes, it is available. Please proceed with booking.'),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Diana'), (SELECT user_id FROM `User` WHERE first_name='Fiona'), 'Can you confirm my booking for the cabin?'),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Fiona'), (SELECT user_id FROM `User` WHERE first_name='Diana'), 'Booking confirmed!'),
(UUID(), (SELECT user_id FROM `User` WHERE first_name='Ethan'), (SELECT user_id FROM `User` WHERE first_name='Julia'), 'Is the safari lodge open in December?');

-- Repeat messages to reach ~20–30 records
