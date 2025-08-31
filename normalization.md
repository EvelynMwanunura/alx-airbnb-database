# Database Normalization for ALX Airbnb Project

This document explains how the initial database schema was reviewed and adjusted to achieve **Third Normal Form (3NF)**. The goal of normalization is to eliminate redundancy, ensure data integrity, and simplify future maintenance.

---

## **1. First Normal Form (1NF)**

**Rules Applied:**

- Each table has a primary key.
- No repeating groups or multi-valued attributes.
- All fields contain atomic values.

**Review Findings:**

- All entities (User, Property, Booking, Payment, Review, Message) already have unique primary keys (UUIDs).
- Fields like `email`, `location`, `pricepernight`, etc., are atomic and properly structured.

**Status:** ✅ **Meets 1NF**

---

## **2. Second Normal Form (2NF)**

**Rules Applied:**

- The database must already be in 1NF.
- All non-key attributes must depend on the entire primary key.

**Review Findings:**

- No composite keys are used.
- Every non-key field depends fully on its entity's primary key.
  - Example: `description` depends on `property_id`, not partially on any other key.

**Status:** ✅ **Meets 2NF**

---

## **3. Third Normal Form (3NF)**

**Rules Applied:**

- The database must be in 2NF.
- No transitive dependencies (non-key attributes depending on other non-key attributes).

**Review and Adjustments:**

### **User Table**

- No changes needed. Attributes like `role`, `email`, and `phone_number` depend solely on `user_id`.

### **Property Table**

- No changes needed. Attributes like `name`, `location`, and `pricepernight` depend only on `property_id`.

### **Booking Table**

- **Review:** `total_price` depends on `start_date`, `end_date`, and `pricepernight` of the related property, not just `booking_id`.
- **Decision:** Keep `total_price` as a **derived field** for faster queries, but document it as **denormalized for performance** while maintaining consistency via triggers or application logic.

### **Payment Table**

- Properly normalized. All fields depend on `payment_id`.

### **Review Table**

- Properly normalized. No transitive dependencies.

### **Message Table**

- Properly normalized. `sender_id` and `recipient_id` are foreign keys referencing the `User` table.

---

## **Final Design Adjustments**

- **Document Derived Fields:** `total_price` in `Booking` table flagged as denormalized for performance.
- **Indexes Added:** Indexed `email` in `User` and `location` in `Property` to support frequent lookups.

---

## **Benefits of 3NF Design**

- Eliminates redundancy and update anomalies.
- Improves query efficiency with proper indexing.
- Makes the schema easier to scale and maintain.

---

## **Conclusion**

The database design meets **Third Normal Form (3NF)**, with one intentional denormalization (`total_price`) for performance optimization.
