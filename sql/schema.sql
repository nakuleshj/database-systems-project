CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(20) UNIQUE,
    email VARCHAR2(100) UNIQUE,
    loyalty_points NUMBER DEFAULT 0 CHECK (loyalty_points >= 0),
    created_at DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    role VARCHAR2(30) NOT NULL CHECK (role IN ('Server', 'Cashier', 'Manager', 'Chef')),
    hire_date DATE NOT NULL,
    hourly_rate NUMBER(8,2) CHECK (hourly_rate >= 0),
    status VARCHAR2(20) DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL UNIQUE,
    description VARCHAR2(200)
);

CREATE TABLE menu_items (
    menu_item_id NUMBER PRIMARY KEY,
    category_id NUMBER NOT NULL,
    item_name VARCHAR2(100) NOT NULL UNIQUE,
    item_description VARCHAR2(250),
    price NUMBER(8,2) NOT NULL CHECK (price > 0),
    is_active CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT fk_menu_items_category
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE dining_tables (
    table_id NUMBER PRIMARY KEY,
    table_number NUMBER NOT NULL UNIQUE,
    capacity NUMBER NOT NULL CHECK (capacity BETWEEN 1 AND 20),
    location_zone VARCHAR2(30) NOT NULL
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    employee_id NUMBER NOT NULL,
    table_id NUMBER,
    order_type VARCHAR2(20) NOT NULL CHECK (order_type IN ('Dine-In', 'Takeout', 'Delivery')),
    order_status VARCHAR2(20) DEFAULT 'Open' CHECK (order_status IN ('Open', 'Paid', 'Cancelled')),
    order_datetime DATE DEFAULT SYSDATE NOT NULL,
    notes VARCHAR2(250),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_orders_table
        FOREIGN KEY (table_id) REFERENCES dining_tables(table_id)
);

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    menu_item_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL CHECK (quantity > 0),
    unit_price NUMBER(8,2) NOT NULL CHECK (unit_price > 0),
    special_request VARCHAR2(200),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_menu_item
        FOREIGN KEY (menu_item_id) REFERENCES menu_items(menu_item_id),
    CONSTRAINT uq_order_item UNIQUE (order_id, menu_item_id, special_request)
);

CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL UNIQUE,
    payment_method VARCHAR2(20) NOT NULL CHECK (payment_method IN ('Cash', 'Card', 'Online')),
    payment_amount NUMBER(10,2) NOT NULL CHECK (payment_amount >= 0),
    tip_amount NUMBER(10,2) DEFAULT 0 CHECK (tip_amount >= 0),
    payment_datetime DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
