# Vacation Rental Management System

## Overview

This project is a **Vacation Rental Management System** that manages users, properties, bookings, payments, reviews, and messages.  
It uses a relational database with proper indexing, foreign keys, and constraints to ensure data integrity and performance.

---

## Features

- **User Management**: Users with roles (`guest`, `host`, `admin`) and secure password storage.
- **Property Management**: Hosts can list properties with details and pricing.
- **Booking System**: Guests can book properties; track status (`pending`, `confirmed`, `canceled`) and total price.
- **Payment Tracking**: Supports multiple payment methods (`credit_card`, `paypal`, `stripe`).
- **Review System**: Guests can leave ratings (1–5) and comments for properties.
- **Messaging System**: Users can communicate with each other.

---

## Database Schema

### Entities

**User**

- `user_id` (PK, UUID)
- `first_name`, `last_name`
- `email` (unique)
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at` (timestamp)

**Property**

- `property_id` (PK, UUID)
- `host_id` (FK → User)
- `name`, `description`, `location`
- `pricepernight`
- `created_at`, `updated_at` (timestamps)

**Booking**

- `booking_id` (PK, UUID)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`, `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

**Payment**

- `payment_id` (PK, UUID)
- `booking_id` (FK → Booking)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

**Review**

- `review_id` (PK, UUID)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating` (1–5)
- `comment`
- `created_at`

**Message**

- `message_id` (PK, UUID)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body`
- `sent_at`

---

## Database Design Principles

- **UUIDs** as primary keys for uniqueness.
- **Indexes** on primary and foreign keys for performance.
- **Foreign keys** with `ON DELETE CASCADE` for referential integrity.
- **Constraints**: ENUMs and CHECK for valid data.
- **Timestamps**: Automatic creation and update tracking.

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/vacation-rental-system.git
```
