-- database schema--

--hotel_chain (name pk, office_address pk, hotels_num, concact_emails, contact_phone_numbers)
--Each Hotel chain name, office address, email and phone number must be unique
CREATE TABLE hotel_chain (
    name VARCHAR(100) PRIMARY KEY,
    office_address VARCHAR(100) UNIQUE,
    hotels_num INT CHECK (hotels_num >= 0),
    contact_emails TEXT UNIQUE,
    contact_phone_numbers TEXT UNIQUE,
)

CREATE TABLE hotel_chain_email (
    name VARCHAR(100) UNIQUE,
    office_address VARCHAR(100) UNIQUE,
    contact_emails TEXT UNIQUE,
    PRIMARY KEY (name, office_address, contact_emails),
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE
)

CREATE TABLE hotel_chain_phone (
    name VARCHAR(100) UNIQUE,
    office_address VARCHAR(100) UNIQUE,
    contact_phone_numbers TEXT UNIQUE,
    PRIMARY KEY (name, office_address, contact_phone_numbers),
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE
)

--hotel (hotel_id PK, hotel_chain_name FK, address, email, rooms_num, rating, phone_numbers)
--Each Hotel must have its own unique ID
CREATE TABLE hotel(
    hotel_id SERIAL PRIMARY KEY CHECK,
    hotel_chain_name VARCHAR(100),
    address VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    rooms_num INT CHECK (rooms_num >= 0),
    rating DECIMAL CHECK (rating >= 0 AND rating <= 5),
    phone_number TEXT UNIQUE,
    FOREIGN KEY (hotel_chain_name) REFERENCES hotel_chain(name) ON DELETE SET NULL
)

--hotel_phone (hotel_id PK, phone_number PK)
CREATE TABLE hotel_phone (
    hotel_id INT,
    phone_number VARCHAR(20) UNIQUE,
    PRIMARY KEY (hotel_id, phone_number),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
)

--room (hotel_id PK, number PK, price, cpacity, can_be_extend, view_type, amenities, damages)
CREATE TABLE room (
    hotel_id INT,
    number INT UNIQUE,
    price DECIMAL CHECK (price >= 0),
    capacity INT CHECK (capacity > 0),
    can_be_extend BOOLEAN,
    view_type VARCHAR(50) CHECK (view_type IN ('sea_view', 'mountain_view')),
    amenities TEXT,
    damages TEXT,
    PRIMARY KEY (hotel_id, number),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
)

--room_problems (hotel_id PK, number PK, problems PK)
CREATE TABLE room_problems (
    hotel_id INT,
    number INT,
    problems TEXT,
    PRIMARY KEY (hotel_id, number, problems),
    FOREIGN KEY (hotel_id, number) REFERENCES room(hotel_id, room_num) ON DELETE CASCADE
)

--room_amenities (hotel_id PK, number PK, amenities PK)
CREATE TABLE room_amenities (
    hotel_id INT,
    number INT,
    amenities TEXT,
    PRIMARY KEY (hotel_id, number, amenities),
    FOREIGN KEY (hotel_id, number) REFERENCES room(hotel_id, room_num) ON DELETE CASCADE
)

--employee (ssn PK, hotel_id FK, full_name, address, roles)
CREATE TABLE employee (
    ssn VARCHAR(11) UNIQUE PRIMARY KEY,
    hotel_id INT,
    full_name VARCHAR(100) NOT NULL,
    address TEXT,
    roles TEXT,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
)

--manager (hotel_id PK, e_ssn PK)
CREATE TABLE manager (
    hotel_id INT,
    e_ssn VARCHAR(11),
    PRIMARY KEY (hotel_id, e_ssn),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE,
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE CASCADE
)

--employee_roles (employee_id PK, role PK)
CREATE TABLE employee_roles (
    e_ssn VARCHAR(11),
    role VARCHAR(50),
    PRIMARY KEY (e_ssn, role),
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE CASCADE
)

--renting (renting_id PK, room_num FK, e_ssn FK, start_date, end_date)
CREATE TABLE renting (
    renting_id SERIAL PRIMARY KEY,
    room_num INT,
    e_ssn VARCHAR(11),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (room_num) REFERENCES room(hotel_id, room_num) ON DELETE SET NULL,
    FOREIGN KEY (e_ssn) REFERENCES employee(ssn) ON DELETE SET NULL
)

--booking (booking_id PK, room_num FK, start_date, end_date)
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    room_num INT,
    start_date DATE,
    end_date DATE CHECK (end_date > start_date),
    FOREIGN KEY (room_num) REFERENCES room(hotel_id, room_num) ON DELETE SET NULL
)

--customer (ssn PK, booking_id FK, renting_id FK, name, address, registration_date,)
CREATE TABLE customer (
    ssn VARCHAR(11) PRIMARY KEY,
    booking_id INT,
    renting_id INT,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    registration_date DATE,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE SET NULL,
    FOREIGN KEY (renting_id) REFERENCES renting(renting_id) ON DELETE SET NULL
)

-