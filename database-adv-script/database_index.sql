-- database_index.sql
-- Purpose: Create indexes to improve query performance for high-usage columns

-- -----------------------
-- Indexes for User table
-- -----------------------

-- Index for fast lookup by email (commonly used in WHERE)
CREATE INDEX idx_user_email ON User(email);

-- --------------------------
-- Indexes for Property table
-- --------------------------

-- Index for fast lookup of properties by host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- -------------------------
-- Indexes for Booking table
-- -------------------------

-- Index for fast lookup of bookings by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for fast lookup of bookings by property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Composite index for queries filtering by both user and property
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

-- Check performance before adding indexes
EXPLAIN
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'test@example.com';

-- Measure actual execution after adding indexes
EXPLAIN ANALYZE
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'test@example.com';
