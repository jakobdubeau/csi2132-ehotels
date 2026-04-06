-- seed data

-- 5 hotel chains
INSERT INTO hotel_chain (name, office_address, hotels_num, contact_emails, contact_phone_numbers) VALUES
('Marriott', '10400 Fernwood Rd, Bethesda, MD', 8, 'info@marriott.com', '1-800-228-9290'),
('Hilton', '7930 Jones Branch Dr, McLean, VA', 8, 'info@hilton.com', '1-800-445-8667'),
('Days Inn', '22 Sylvan Way, Parsippany, NJ', 8, 'info@daysinn.com', '1-800-225-3297'),
('Wyndham', '1 Sylvan Way, Parsippany, NJ', 8, 'info@wyndham.com', '1-800-466-1589'),
('Continental', '1 World Way, Los Angeles, CA', 8, 'info@continental.com', '1-800-555-0100');

-- chain emails
INSERT INTO hotel_chain_email (name, office_address, contact_emails) VALUES
('Marriott', '10400 Fernwood Rd, Bethesda, MD', 'info@marriott.com'),
('Marriott', '10400 Fernwood Rd, Bethesda, MD', 'support@marriott.com'),
('Hilton', '7930 Jones Branch Dr, McLean, VA', 'info@hilton.com'),
('Days Inn', '22 Sylvan Way, Parsippany, NJ', 'info@daysinn.com'),
('Wyndham', '1 Sylvan Way, Parsippany, NJ', 'info@wyndham.com'),
('Continental', '1 World Way, Los Angeles, CA', 'info@continental.com');

-- chain phones
INSERT INTO hotel_chain_phone (name, office_address, contact_phone_numbers) VALUES
('Marriott', '10400 Fernwood Rd, Bethesda, MD', '1-800-228-9290'),
('Hilton', '7930 Jones Branch Dr, McLean, VA', '1-800-445-8667'),
('Days Inn', '22 Sylvan Way, Parsippany, NJ', '1-800-225-3297'),
('Wyndham', '1 Sylvan Way, Parsippany, NJ', '1-800-466-1589'),
('Continental', '1 World Way, Los Angeles, CA', '1-800-555-0100');

-- marriott
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Marriott', '1 King St W, Toronto, ON', 'Downtown', 'toronto@marriott.com', 5, 5, '416-555-0101'),
('Marriott', '900 De La Gauchetiere, Montreal, QC', 'Downtown', 'montreal@marriott.com', 5, 4, '514-555-0102'),
('Marriott', '100 Kent St, Ottawa, ON', 'Suburbs', 'ottawa@marriott.com', 5, 3, '613-555-0103'),
('Marriott', '1128 W Georgia St, Vancouver, BC', 'Beachfront', 'vancouver@marriott.com', 5, 5, '604-555-0104'),
('Marriott', '9700 Airport Rd, Calgary, AB', 'Airport', 'calgary@marriott.com', 5, 3, '403-555-0105'),
('Marriott', '150 Park Ave, New York, NY', 'Downtown', 'newyork@marriott.com', 5, 4, '212-555-0106'),
('Marriott', '501 S Miami Ave, Miami, FL', 'Beachfront', 'miami@marriott.com', 5, 2, '305-555-0107'),
('Marriott', '1000 N Lake Shore, Chicago, IL', 'Countryside', 'chicago@marriott.com', 5, 1, '312-555-0108');

-- hilton
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Hilton', '145 Richmond St W, Toronto, ON', 'Downtown', 'toronto@hilton.com', 5, 4, '416-555-0201'),
('Hilton', '1255 Jeanne-Mance, Montreal, QC', 'Downtown', 'montreal@hilton.com', 5, 5, '514-555-0202'),
('Hilton', '361 Queen St, Ottawa, ON', 'Suburbs', 'ottawa@hilton.com', 5, 3, '613-555-0203'),
('Hilton', '433 Robson St, Vancouver, BC', 'Mountain', 'vancouver@hilton.com', 5, 4, '604-555-0204'),
('Hilton', '711 4th Ave SW, Calgary, AB', 'Airport', 'calgary@hilton.com', 5, 3, '403-555-0205'),
('Hilton', '335 Ave of Americas, New York, NY', 'Downtown', 'newyork@hilton.com', 5, 5, '212-555-0206'),
('Hilton', '1601 Bayshore Dr, Miami, FL', 'Beachfront', 'miami@hilton.com', 5, 2, '305-555-0207'),
('Hilton', '720 S Michigan Ave, Chicago, IL', 'Countryside', 'chicago@hilton.com', 5, 1, '312-555-0208');

-- days inn
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Days Inn', '30 Carlton St, Toronto, ON', 'Suburbs', 'toronto@daysinn.com', 5, 2, '416-555-0301'),
('Days Inn', '1005 Guy St, Montreal, QC', 'Downtown', 'montreal@daysinn.com', 5, 3, '514-555-0302'),
('Days Inn', '319 Rideau St, Ottawa, ON', 'Suburbs', 'ottawa@daysinn.com', 5, 2, '613-555-0303'),
('Days Inn', '2075 Kingsway, Vancouver, BC', 'Mountain', 'vancouver@daysinn.com', 5, 3, '604-555-0304'),
('Days Inn', '1250 McKinnon Dr, Calgary, AB', 'Airport', 'calgary@daysinn.com', 5, 1, '403-555-0305'),
('Days Inn', '215 W 94th St, New York, NY', 'Suburbs', 'newyork@daysinn.com', 5, 4, '212-555-0306'),
('Days Inn', '4299 Collins Ave, Miami, FL', 'Beachfront', 'miami@daysinn.com', 5, 3, '305-555-0307'),
('Days Inn', '644 W Diversey, Chicago, IL', 'Countryside', 'chicago@daysinn.com', 5, 1, '312-555-0308');

-- wyndham
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Wyndham', '90 Bloor St E, Toronto, ON', 'Downtown', 'toronto@wyndham.com', 5, 3, '416-555-0401'),
('Wyndham', '1415 Rue St-Hubert, Montreal, QC', 'Suburbs', 'montreal@wyndham.com', 5, 4, '514-555-0402'),
('Wyndham', '480 Rideau St, Ottawa, ON', 'Downtown', 'ottawa@wyndham.com', 5, 3, '613-555-0403'),
('Wyndham', '1176 Granville St, Vancouver, BC', 'Beachfront', 'vancouver@wyndham.com', 5, 5, '604-555-0404'),
('Wyndham', '612 Macleod Tr SE, Calgary, AB', 'Mountain', 'calgary@wyndham.com', 5, 2, '403-555-0405'),
('Wyndham', '270 W 43rd St, New York, NY', 'Downtown', 'newyork@wyndham.com', 5, 4, '212-555-0406'),
('Wyndham', '1545 Collins Ave, Miami, FL', 'Beachfront', 'miami@wyndham.com', 5, 3, '305-555-0407'),
('Wyndham', '162 E Ontario St, Chicago, IL', 'Airport', 'chicago@wyndham.com', 5, 1, '312-555-0408');

-- continental
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Continental', '56 Yonge St, Toronto, ON', 'Downtown', 'toronto@continental.com', 5, 4, '416-555-0501'),
('Continental', '505 Sherbrooke E, Montreal, QC', 'Suburbs', 'montreal@continental.com', 5, 3, '514-555-0502'),
('Continental', '112 Sussex Dr, Ottawa, ON', 'Downtown', 'ottawa@continental.com', 5, 5, '613-555-0503'),
('Continental', '845 Hornby St, Vancouver, BC', 'Mountain', 'vancouver@continental.com', 5, 4, '604-555-0504'),
('Continental', '888 7th Ave SW, Calgary, AB', 'Countryside', 'calgary@continental.com', 5, 3, '403-555-0505'),
('Continental', '45 W 44th St, New York, NY', 'Downtown', 'newyork@continental.com', 5, 5, '212-555-0506'),
('Continental', '2001 Ocean Dr, Miami, FL', 'Beachfront', 'miami@continental.com', 5, 2, '305-555-0507'),
('Continental', '505 N Michigan Ave, Chicago, IL', 'Airport', 'chicago@continental.com', 5, 1, '312-555-0508');

-- 5 rooms per hotel1
DO $$
BEGIN
    FOR h IN 1..40 LOOP
        INSERT INTO room (hotel_id, number, price, capacity, can_be_extend, view_type, amenities, damages) VALUES
        (h, 101, 80 + (h * 3), 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
        (h, 102, 120 + (h * 3), 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
        (h, 201, 160 + (h * 3), 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
        (h, 202, 220 + (h * 3), 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
        (h, 301, 300 + (h * 3), 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL);
    END LOOP;
END $$;

-- room amenities
INSERT INTO room_amenities (hotel_id, number, amenities) VALUES
(1, 101, 'TV'), (1, 101, 'WiFi'),
(1, 102, 'TV'), (1, 102, 'WiFi'), (1, 102, 'Fridge'),
(1, 201, 'TV'), (1, 201, 'WiFi'), (1, 201, 'AC'),
(2, 101, 'TV'), (2, 101, 'WiFi'),
(5, 301, 'Jacuzzi'), (5, 301, 'Minibar');

-- room problems
INSERT INTO room_problems (hotel_id, number, problems) VALUES
(3, 101, 'Leaky faucet'),
(5, 202, 'Broken AC'),
(12, 102, 'Stained carpet'),
(20, 201, 'Noisy window');

-- employees (2 per hotel, 80 total)
DO $$
BEGIN
    FOR h IN 1..40 LOOP
        INSERT INTO employee (ssn, hotel_id, full_name, address, roles) VALUES
        (LPAD((h * 2 - 1)::TEXT, 3, '0') || '-00-' || LPAD((h * 2 - 1)::TEXT, 4, '0'),
         h, 'Manager ' || h, h || ' Staff St', 'manager'),
        (LPAD((h * 2)::TEXT, 3, '0') || '-00-' || LPAD((h * 2)::TEXT, 4, '0'),
         h, 'Employee ' || h, h || ' Worker Ave', 'receptionist');
    END LOOP;
END $$;

-- employee roles
DO $$
BEGIN
    FOR h IN 1..40 LOOP
        INSERT INTO employee_roles (e_ssn, role) VALUES
        (LPAD((h * 2 - 1)::TEXT, 3, '0') || '-00-' || LPAD((h * 2 - 1)::TEXT, 4, '0'), 'manager'),
        (LPAD((h * 2)::TEXT, 3, '0') || '-00-' || LPAD((h * 2)::TEXT, 4, '0'), 'receptionist');
    END LOOP;
END $$;

-- managers
DO $$
BEGIN
    FOR h IN 1..40 LOOP
        INSERT INTO manager (hotel_id, e_ssn) VALUES
        (h, LPAD((h * 2 - 1)::TEXT, 3, '0') || '-00-' || LPAD((h * 2 - 1)::TEXT, 4, '0'));
    END LOOP;
END $$;

-- bookings
INSERT INTO booking (hotel_id, room_number, start_date, end_date) VALUES
(1, 101, '2026-04-10', '2026-04-15'),
(1, 201, '2026-04-12', '2026-04-14'),
(2, 102, '2026-04-20', '2026-04-25'),
(5, 301, '2026-05-01', '2026-05-05'),
(10, 101, '2026-04-15', '2026-04-18'),
(15, 202, '2026-05-10', '2026-05-14'),
(20, 101, '2026-04-08', '2026-04-12'),
(25, 301, '2026-06-01', '2026-06-07');

-- rentings
INSERT INTO renting (hotel_id, room_number, e_ssn, start_date, end_date) VALUES
(1, 102, '002-00-0002', '2026-04-01', '2026-04-05'),
(3, 201, '006-00-0006', '2026-04-02', '2026-04-06'),
(10, 202, '020-00-0020', '2026-04-05', '2026-04-09');

-- customers
INSERT INTO customer (ssn, booking_id, renting_id, name, address, registration_date) VALUES
('111-22-3333', 1, NULL, 'Alice Johnson', '123 Main St, Toronto, ON', '2025-01-15'),
('222-33-4444', 2, NULL, 'Bob Smith', '456 Oak Ave, Montreal, QC', '2025-02-20'),
('333-44-5555', 3, 1, 'Carol Williams', '789 Pine Rd, Ottawa, ON', '2025-03-10'),
('444-55-6666', 4, NULL, 'David Brown', '321 Elm St, Vancouver, BC', '2025-04-05'),
('555-66-7777', 5, 2, 'Eve Davis', '654 Maple Dr, Calgary, AB', '2025-05-12'),
('666-77-8888', 6, NULL, 'Frank Miller', '987 Cedar Ln, New York, NY', '2025-06-18'),
('777-88-9999', 7, 3, 'Grace Wilson', '147 Birch Blvd, Miami, FL', '2025-07-22'),
('888-99-0000', 8, NULL, 'Henry Taylor', '258 Spruce Ct, Chicago, IL', '2025-08-30');
