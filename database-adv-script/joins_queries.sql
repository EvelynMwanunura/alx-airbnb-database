SELECT *
FROM booking
JOIN user ON user.user_id = booking.user_id;


SELECT *
FROM property
LEFT JOIN review ON property.property_id = review.property_id;


SELECT *
FROM user
FULL OUTER JOIN booking ON user.user_id = booking.user_id;