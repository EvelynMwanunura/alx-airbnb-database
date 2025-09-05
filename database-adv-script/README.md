1. Retrieve all bookings and the respective users who made those bookings (INNER JOIN)
   SELECT \*
   FROM booking
   INNER JOIN user
   ON booking.user_id = user.user_id;

Explanation:
This query returns only the bookings that are linked to a valid user.
If a booking has no associated user, it will not appear in the results.

2. Retrieve all properties and their reviews, including properties that have no reviews (LEFT JOIN)
   SELECT \*
   FROM property
   LEFT JOIN review
   ON property.property_id = review.property_id;

Explanation:
This query returns all properties.
If a property has no reviews, the review-related fields will be NULL.

3. Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user (FULL OUTER JOIN)
   SELECT \*
   FROM user
   FULL OUTER JOIN booking
   ON user.user_id = booking.user_id;

Explanation:
This query returns all users and all bookings.

Users without bookings will still appear (with booking fields as NULL).

Bookings without a matching user will also appear (with user fields as NULL).

Summary of Join Types

INNER JOIN → Only matching rows from both tables.

LEFT JOIN → All rows from the left table, plus matching rows from the right.

FULL OUTER JOIN → All rows from both tables, with NULL where no match exists.
