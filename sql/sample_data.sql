-- sample_data.sql
-- Representative sample data for Restaurant Order Management System

INSERT INTO customers (customer_id, first_name, last_name, phone, email, loyalty_points, created_at) VALUES (1, 'Emma', 'Carter', '555-1001', 'emma.carter@email.com', 120, TO_DATE('2026-04-01', 'YYYY-MM-DD'));
INSERT INTO customers (customer_id, first_name, last_name, phone, email, loyalty_points, created_at) VALUES (2, 'Liam', 'Patel', '555-1002', 'liam.patel@email.com', 80, TO_DATE('2026-04-02', 'YYYY-MM-DD'));
INSERT INTO customers (customer_id, first_name, last_name, phone, email, loyalty_points, created_at) VALUES (3, 'Sophia', 'Nguyen', '555-1003', 'sophia.nguyen@email.com', 40, TO_DATE('2026-04-03', 'YYYY-MM-DD'));
INSERT INTO customers (customer_id, first_name, last_name, phone, email, loyalty_points, created_at) VALUES (4, 'Noah', 'Rivera', '555-1004', 'noah.rivera@email.com', 15, TO_DATE('2026-04-05', 'YYYY-MM-DD'));
INSERT INTO customers (customer_id, first_name, last_name, phone, email, loyalty_points, created_at) VALUES (5, 'Ava', 'Johnson', '555-1005', 'ava.johnson@email.com', 200, TO_DATE('2026-04-06', 'YYYY-MM-DD'));

INSERT INTO employees (employee_id, first_name, last_name, role, hire_date, hourly_rate, status) VALUES (1, 'Mia', 'Lopez', 'Manager', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 28.50, 'Active');
INSERT INTO employees (employee_id, first_name, last_name, role, hire_date, hourly_rate, status) VALUES (2, 'Ethan', 'Brooks', 'Server', TO_DATE('2025-02-15', 'YYYY-MM-DD'), 15.75, 'Active');
INSERT INTO employees (employee_id, first_name, last_name, role, hire_date, hourly_rate, status) VALUES (3, 'Olivia', 'Chen', 'Cashier', TO_DATE('2025-03-01', 'YYYY-MM-DD'), 16.25, 'Active');
INSERT INTO employees (employee_id, first_name, last_name, role, hire_date, hourly_rate, status) VALUES (4, 'Lucas', 'Hall', 'Chef', TO_DATE('2023-09-20', 'YYYY-MM-DD'), 24.00, 'Active');

INSERT INTO categories (category_id, category_name, description) VALUES (1, 'Appetizers', 'Starters and shareable plates');
INSERT INTO categories (category_id, category_name, description) VALUES (2, 'Main Course', 'Entrees and chef specials');
INSERT INTO categories (category_id, category_name, description) VALUES (3, 'Desserts', 'Desserts and sweets');
INSERT INTO categories (category_id, category_name, description) VALUES (4, 'Beverages', 'Soft drinks and specialty drinks');

INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (1, 1, 'Garlic Bread', 'Toasted bread with garlic butter', 6.50, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (2, 1, 'Crispy Calamari', 'Fried calamari with lemon aioli', 11.00, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (3, 2, 'Margherita Pizza', 'Classic pizza with mozzarella and basil', 15.00, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (4, 2, 'Grilled Salmon', 'Salmon with seasonal vegetables', 22.00, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (5, 2, 'Pasta Alfredo', 'Creamy alfredo pasta', 17.50, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (6, 3, 'Chocolate Lava Cake', 'Warm chocolate cake with vanilla ice cream', 8.50, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (7, 4, 'Fresh Lemonade', 'House-made lemonade', 4.50, 'Y');
INSERT INTO menu_items (menu_item_id, category_id, item_name, item_description, price, is_active) VALUES (8, 4, 'Iced Tea', 'Unsweetened iced tea', 3.75, 'Y');

INSERT INTO dining_tables (table_id, table_number, capacity, location_zone) VALUES (1, 1, 2, 'Main Hall');
INSERT INTO dining_tables (table_id, table_number, capacity, location_zone) VALUES (2, 2, 4, 'Main Hall');
INSERT INTO dining_tables (table_id, table_number, capacity, location_zone) VALUES (3, 3, 6, 'Patio');
INSERT INTO dining_tables (table_id, table_number, capacity, location_zone) VALUES (4, 4, 4, 'Window');

INSERT INTO orders (order_id, customer_id, employee_id, table_id, order_type, order_status, order_datetime, notes) VALUES (1001, 1, 2, 2, 'Dine-In', 'Paid', TO_DATE('2026-04-08 18:15', 'YYYY-MM-DD HH24:MI'), 'Birthday dinner');
INSERT INTO orders (order_id, customer_id, employee_id, table_id, order_type, order_status, order_datetime, notes) VALUES (1002, 2, 3, NULL, 'Takeout', 'Paid', TO_DATE('2026-04-08 19:05', 'YYYY-MM-DD HH24:MI'), 'Extra napkins');
INSERT INTO orders (order_id, customer_id, employee_id, table_id, order_type, order_status, order_datetime, notes) VALUES (1003, 3, 2, 1, 'Dine-In', 'Open', TO_DATE('2026-04-09 12:30', 'YYYY-MM-DD HH24:MI'), 'No onions');
INSERT INTO orders (order_id, customer_id, employee_id, table_id, order_type, order_status, order_datetime, notes) VALUES (1004, 4, 3, NULL, 'Delivery', 'Paid', TO_DATE('2026-04-09 13:10', 'YYYY-MM-DD HH24:MI'), 'Leave at front desk');
INSERT INTO orders (order_id, customer_id, employee_id, table_id, order_type, order_status, order_datetime, notes) VALUES (1005, 5, 2, 4, 'Dine-In', 'Cancelled', TO_DATE('2026-04-09 20:20', 'YYYY-MM-DD HH24:MI'), 'Customer left before service');

INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (1, 1001, 1, 1, 6.50, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (2, 1001, 4, 2, 22.00, 'Medium well');
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (3, 1001, 6, 1, 8.50, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (4, 1002, 3, 1, 15.00, 'Add mushrooms');
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (5, 1002, 7, 2, 4.50, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (6, 1003, 5, 1, 17.50, 'No onions');
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (7, 1003, 8, 1, 3.75, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (8, 1004, 2, 1, 11.00, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (9, 1004, 5, 2, 17.50, NULL);
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, unit_price, special_request) VALUES (10, 1005, 3, 1, 15.00, NULL);

INSERT INTO payments (payment_id, order_id, payment_method, payment_amount, tip_amount, payment_datetime) VALUES (5001, 1001, 'Card', 59.00, 9.00, TO_DATE('2026-04-08 19:10', 'YYYY-MM-DD HH24:MI'));
INSERT INTO payments (payment_id, order_id, payment_method, payment_amount, tip_amount, payment_datetime) VALUES (5002, 1002, 'Online', 24.00, 0.00, TO_DATE('2026-04-08 19:07', 'YYYY-MM-DD HH24:MI'));
INSERT INTO payments (payment_id, order_id, payment_method, payment_amount, tip_amount, payment_datetime) VALUES (5003, 1004, 'Cash', 46.00, 4.00, TO_DATE('2026-04-09 13:45', 'YYYY-MM-DD HH24:MI'));

COMMIT;
