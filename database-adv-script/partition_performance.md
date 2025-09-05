Partitioning Report: Booking Table

Objective: Improve query performance on large Booking table by partitioning on start_date.

Implementation:

Created Booking_Partitioned table using RANGE partitioning by YEAR(start_date).

Copied existing bookings into the new partitioned table.

Partitioned by year for easy pruning.

Testing Queries:

SELECT \* FROM Booking_Partitioned WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';

SELECT property_id, COUNT(\*) FROM Booking_Partitioned WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31' GROUP BY property_id;

Observations:

Query scanning only the relevant partition (partition pruning).

Execution time reduced significantly compared to scanning the full Booking table.

Aggregation and filtering queries are faster for date-specific operations.

Conclusion:
Partitioning by start_date improves performance for queries filtered by date ranges, especially on large Booking tables.
