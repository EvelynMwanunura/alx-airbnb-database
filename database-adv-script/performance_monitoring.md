# Database Performance Monitoring Report

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitored Queries

1. Fetch bookings along with user and property details:

```sql
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
Count bookings per property:

sql
Copy code
SELECT property_id, COUNT(*) AS total_bookings
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY property_id;
Fetch confirmed bookings by date range:

sql
Copy code
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31'
  AND status = 'confirmed';
2. Bottlenecks Identified
Bottleneck Type	Observed Issue	Suggested Fix
Full table scan	type = ALL on Booking	Add indexes on frequently filtered/joined columns (user_id, property_id, start_date)
Slow sorting	Using filesort on start_date	Create index on Booking(start_date)
Joins not using index	key = NULL for joins	Index columns used in JOINs (Booking.user_id, Booking.property_id)
Large aggregations	COUNT queries scan many rows	Consider partitioning Booking table by year or date

3. Implemented Changes
Added indexes:

sql
Copy code
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_property_host_id ON Property(host_id);
Partitioned the Booking table by year (start_date) to enable partition pruning.

4. Performance Improvements Observed
Queries now scan fewer rows due to index usage.

Execution time for date range queries reduced significantly.

Sorting by start_date no longer requires temporary files.

Partitioning improved performance for large tables by limiting scans to relevant partitions.

5. Conclusion
Continuous monitoring using EXPLAIN/EXPLAIN ANALYZE combined with indexing and partitioning significantly improves database performance. Regular analysis ensures efficient query execution and scalability as data grows.
```
