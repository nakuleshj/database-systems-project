# Restaurant Order Management System

This project is a database-backed application designed for a restaurant environment. It demonstrates normalized relational design, Oracle SQL implementation, referential integrity, and representative business data.

## Included Deliverables
- `sql/schema.sql`: Oracle DDL with primary keys, foreign keys, checks, and indexes
- `sql/sample_data.sql`: Representative sample inserts
- `sql/reset.sql`: Safe reset script that drops tables in dependency order
- `Restaurant_Order_Management_Report.pdf`: Final report
- `assets/restaurant_er_diagram.png`: ER diagram image

## Core Business Scope
The database supports:
- customer records
- employees and roles
- menu organization by category
- table management
- order creation
- order line items
- payment tracking

## Normalization
The design is normalized to 3NF:
- lookup-style data such as menu categories is separated from transactional tables
- repeating groups are removed through `order_items`
- payment data is stored separately from orders
- non-key attributes depend on the key, the whole key, and nothing but the key

## Submission Link
This repository was created for the Final Database Project submission.
