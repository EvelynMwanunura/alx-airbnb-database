SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b 
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

WITH property_bookings AS (
    SELECT 
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b 
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
)
SELECT
    property_id,
    name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number
FROM property_bookings
ORDER BY total_bookings DESC;

