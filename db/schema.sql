-- database schema--

--hotel_chain (name pk, office_address pk, hotels_num, concact_emails, contact_phone_numbers)
--Each Hotel chain name, office address, email and phone number must be unique
CREATE TABLE hotel_chain (
    name VARCHAR(100) PRIMARY KEY,
    office_address VARCHAR(100) UNIQUE,
    hotels_num INT CHECK (hotels_num >= 0),
    contact_emails TEXT UNIQUE,
    contact_phone_numbers TEXT UNIQUE
);

CREATE TABLE hotel_chain_email (
    name VARCHAR(100),
    office_address VARCHAR(100),
    contact_emails TEXT UNIQUE,
    PRIMARY KEY (name, office_address, contact_emails),
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE
);

CREATE TABLE hotel_chain_phone (
    name VARCHAR(100),
    office_address VARCHAR(100),
    contact_phone_numbers TEXT UNIQUE,
    PRIMARY KEY (name, office_address, contact_phone_numbers),
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE
);

--hotel (hotel_id PK, hotel_chain_name FK, address, email, rooms_num, rating, phone_numbers)
--Each Hotel must have its own unique ID
CREATE TABLE hotel(
    hotel_id SERIAL PRIMARY KEY CHECK (hotel_id <= 10000),
    hotel_chain_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    area VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE CHECK (email ~ '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
    rooms_num INT NOT NULL CHECK (rooms_num >= 0),
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    phone_number TEXT NOT NULL UNIQUE CHECK (phone_number ~ '^\d{3}-\d{3}-\d{4}$'),
    FOREIGN KEY (hotel_chain_name) REFERENCES hotel_chain(name) ON DELETE RESTRICT
);

--hotel_phone (hotel_id PK, phone_number PK)
CREATE TABLE hotel_phone (
    hotel_id INT,
    phone_number VARCHAR(20) UNIQUE,
    PRIMARY KEY (hotel_id, phone_number),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

--room (hotel_id PK, number PK, price, capacity, can_be_extend, view_type, amenities, damages)
CREATE TABLE room (
    hotel_id INT,
    number INT,
    price DECIMAL NOT NULL CHECK (price > 0),
    capacity INT NOT NULL CHECK (capacity BETWEEN 1 AND 6),
    can_be_extend BOOLEAN NOT NULL,
    view_type VARCHAR(50) CHECK (view_type IN ('sea_view', 'mountain_view')),
    amenities TEXT,
    damages TEXT,
    PRIMARY KEY (hotel_id, number),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

--room_problems (hotel_id PK, number PK, problems PK)
CREATE TABLE room_problems (
    hotel_id INT,
    number INT,
    problems TEXT,
    PRIMARY KEY (hotel_id, number, problems),
    FOREIGN KEY (hotel_id, number) REFERENCES room(hotel_id, number) ON DELETE CASCADE
);

--room_amenities (hotel_id PK, number PK, amenities PK)
CREATE TABLE room_amenities (
    hotel_id INT,
    number INT,
    amenities TEXT,
    PRIMARY KEY (hotel_id, number, amenities),
    FOREIGN KEY (hotel_id, number) REFERENCES room(hotel_id, number) ON DELETE CASCADE
);

--employee (ssn PK, hotel_id FK, full_name, address, roles)
CREATE TABLE employee (
    ssn VARCHAR(11) UNIQUE PRIMARY KEY,
    hotel_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    roles TEXT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

--manager (hotel_id PK, e_ssn PK)
CREATE TABLE manager (
    hotel_id INT,
    e_ssn VARCHAR(11),
    UNIQUE (hotel_id),
    PRIMARY KEY (hotel_id, e_ssn),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE,
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE CASCADE
);

--employee_roles (employee_id PK, role PK)
CREATE TABLE employee_roles (
    e_ssn VARCHAR(11),
    role VARCHAR(50),
    PRIMARY KEY (e_ssn, role),
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE CASCADE
);

--customer (ssn PK, name, address, registration_date)
CREATE TABLE customer (
    ssn VARCHAR(11) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE
);

--booking (booking_id PK, customer_ssn FK, hotel_id + room_number FK, start_date, end_date)
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    customer_ssn VARCHAR(11) NOT NULL,
    hotel_id INT NOT NULL,
    room_number INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date > start_date),
    FOREIGN KEY (customer_ssn) REFERENCES customer(ssn) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id, room_number) REFERENCES room(hotel_id, number) ON DELETE CASCADE
);

--renting (renting_id PK, customer_ssn FK, hotel_id + room_number FK, e_ssn FK, start_date, end_date)
CREATE TABLE renting (
    renting_id SERIAL PRIMARY KEY,
    customer_ssn VARCHAR(11) NOT NULL,
    hotel_id INT NOT NULL,
    room_number INT NOT NULL,
    e_ssn VARCHAR(11) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date > start_date),
    FOREIGN KEY (customer_ssn) REFERENCES customer(ssn) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id, room_number) REFERENCES room(hotel_id, number) ON DELETE CASCADE,
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE RESTRICT
);

-- booking_archive (no FKs, history preserved even after deletes)
CREATE TABLE booking_archive (
    booking_id INT PRIMARY KEY,
    customer_ssn VARCHAR(11),
    hotel_id INT,
    room_number INT,
    start_date DATE,
    end_date DATE,
    archived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- renting_archive (no FKs, history preserved even after deletes)
CREATE TABLE renting_archive (
    renting_id INT PRIMARY KEY,
    customer_ssn VARCHAR(11),
    hotel_id INT,
    room_number INT,
    e_ssn VARCHAR(11),
    start_date DATE,
    end_date DATE,
    archived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- payment (per renting, no payment history required per spec)
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    renting_id INT,
    amount DECIMAL NOT NULL CHECK (amount > 0),
    payment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (renting_id) REFERENCES renting(renting_id) ON DELETE SET NULL
);