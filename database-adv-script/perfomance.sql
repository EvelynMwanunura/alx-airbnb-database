SELECT 
b.booking_id,
b.start_date,
b.end_date,
b.total_price AS booking_total,
b.status AS booking_status,

u.user_id,
u.first_name,
u.last_name,
u.email,

p.property_id,
p.nme AS property_name,
p.location AS property_location,
p.price_per_night AS property_price,

pay.payment_id,
pay.amount AS payment_amount,
pay.payment_date,
pay.payment_method

FROM Booking b

JOIN user u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id

LEFT JOIN Payment pay ON b.booking_id = pay.booking_id

WHERE b.status = 'confirmed' AND b.total_price > 0

ORDER BY b.start_date DESC;
