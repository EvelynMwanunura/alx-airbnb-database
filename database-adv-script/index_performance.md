Index Performance Improvement

Objective: Improve query performance on User, Booking, and Property tables by creating indexes on high-usage columns.

1. Identify High-Usage Columns

Columns commonly used in queries:

Table Column Usage Examples
User user_id JOIN with Booking, Message, Review
User email WHERE email = ?
Property property_id JOIN with Booking, Review
Property host_id WHERE host_id = ? / JOIN with Booking
Booking booking_id JOIN with Payment
Booking user_id WHERE user_id = ? / JOIN with User
Booking property_id WHERE property_id = ? / JOIN with Property 2. Create Indexes
-- User table
CREATE INDEX idx_user_email ON User(email);

-- Property table
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Optional: composite index for frequent queries joining multiple columns
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

✅ Notes:

PRIMARY KEY columns (user_id, property_id, booking_id) are already indexed automatically.

Indexes are useful for columns frequently used in WHERE, JOIN, or ORDER BY.

3. Measure Query Performance

Before adding indexes:

EXPLAIN SELECT \* FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'test@example.com';

After adding indexes:

EXPLAIN SELECT \* FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'test@example.com';

Look at rows scanned and key used to see improvement.

4. Recommended Repository Structure
   alx-airbnb-database/
   └─ database-adv-script/
   ├─ database_index.sql -- Contains CREATE INDEX commands
   └─ index_performance.md -- Documentation and EXPLAIN analysis
