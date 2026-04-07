-- seed data

-- 5 hotel chains
INSERT INTO hotel_chain (name, office_address, hotels_num, contact_emails, contact_phone_numbers) VALUES
('Marriott', '10400 Fernwood Rd, Bethesda, MD', 10, 'info@marriott.com', '1-800-228-9290'),
('Hilton', '7930 Jones Branch Dr, McLean, VA', 10, 'info@hilton.com', '1-800-445-8667'),
('Days Inn', '22 Sylvan Way, Parsippany, NJ', 10, 'info@daysinn.com', '1-800-225-3297'),
('Wyndham', '1 Sylvan Way, Parsippany, NJ', 10, 'info@wyndham.com', '1-800-466-1589'),
('Continental', '1 World Way, Los Angeles, CA', 10, 'info@continental.com', '1-800-555-0100');

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

-- marriott (hotels 1-8)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Marriott', '1 King St W, Toronto, ON', 'Downtown', 'toronto@marriott.com', 5, 5, '416-555-0101'),
('Marriott', '900 De La Gauchetiere, Montreal, QC', 'Downtown', 'montreal@marriott.com', 5, 4, '514-555-0102'),
('Marriott', '100 Kent St, Ottawa, ON', 'Suburbs', 'ottawa@marriott.com', 5, 3, '613-555-0103'),
('Marriott', '1128 W Georgia St, Vancouver, BC', 'Beachfront', 'vancouver@marriott.com', 5, 5, '604-555-0104'),
('Marriott', '9700 Airport Rd, Calgary, AB', 'Airport', 'calgary@marriott.com', 5, 3, '403-555-0105'),
('Marriott', '150 Park Ave, New York, NY', 'Downtown', 'newyork@marriott.com', 5, 4, '212-555-0106'),
('Marriott', '501 S Miami Ave, Miami, FL', 'Beachfront', 'miami@marriott.com', 5, 2, '305-555-0107'),
('Marriott', '1000 N Lake Shore, Chicago, IL', 'Countryside', 'chicago@marriott.com', 5, 1, '312-555-0108');

-- hilton (hotels 9-16)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Hilton', '145 Richmond St W, Toronto, ON', 'Downtown', 'toronto@hilton.com', 5, 4, '416-555-0201'),
('Hilton', '1255 Jeanne-Mance, Montreal, QC', 'Downtown', 'montreal@hilton.com', 5, 5, '514-555-0202'),
('Hilton', '361 Queen St, Ottawa, ON', 'Suburbs', 'ottawa@hilton.com', 5, 3, '613-555-0203'),
('Hilton', '433 Robson St, Vancouver, BC', 'Mountain', 'vancouver@hilton.com', 5, 4, '604-555-0204'),
('Hilton', '711 4th Ave SW, Calgary, AB', 'Airport', 'calgary@hilton.com', 5, 3, '403-555-0205'),
('Hilton', '335 Ave of Americas, New York, NY', 'Downtown', 'newyork@hilton.com', 5, 5, '212-555-0206'),
('Hilton', '1601 Bayshore Dr, Miami, FL', 'Beachfront', 'miami@hilton.com', 5, 2, '305-555-0207'),
('Hilton', '720 S Michigan Ave, Chicago, IL', 'Countryside', 'chicago@hilton.com', 5, 1, '312-555-0208');

-- days inn (hotels 17-24)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Days Inn', '30 Carlton St, Toronto, ON', 'Suburbs', 'toronto@daysinn.com', 5, 2, '416-555-0301'),
('Days Inn', '1005 Guy St, Montreal, QC', 'Downtown', 'montreal@daysinn.com', 5, 3, '514-555-0302'),
('Days Inn', '319 Rideau St, Ottawa, ON', 'Suburbs', 'ottawa@daysinn.com', 5, 2, '613-555-0303'),
('Days Inn', '2075 Kingsway, Vancouver, BC', 'Mountain', 'vancouver@daysinn.com', 5, 3, '604-555-0304'),
('Days Inn', '1250 McKinnon Dr, Calgary, AB', 'Airport', 'calgary@daysinn.com', 5, 1, '403-555-0305'),
('Days Inn', '215 W 94th St, New York, NY', 'Suburbs', 'newyork@daysinn.com', 5, 4, '212-555-0306'),
('Days Inn', '4299 Collins Ave, Miami, FL', 'Beachfront', 'miami@daysinn.com', 5, 3, '305-555-0307'),
('Days Inn', '644 W Diversey, Chicago, IL', 'Countryside', 'chicago@daysinn.com', 5, 1, '312-555-0308');

-- wyndham (hotels 25-32)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Wyndham', '90 Bloor St E, Toronto, ON', 'Downtown', 'toronto@wyndham.com', 5, 3, '416-555-0401'),
('Wyndham', '1415 Rue St-Hubert, Montreal, QC', 'Suburbs', 'montreal@wyndham.com', 5, 4, '514-555-0402'),
('Wyndham', '480 Rideau St, Ottawa, ON', 'Downtown', 'ottawa@wyndham.com', 5, 3, '613-555-0403'),
('Wyndham', '1176 Granville St, Vancouver, BC', 'Beachfront', 'vancouver@wyndham.com', 5, 5, '604-555-0404'),
('Wyndham', '612 Macleod Tr SE, Calgary, AB', 'Mountain', 'calgary@wyndham.com', 5, 2, '403-555-0405'),
('Wyndham', '270 W 43rd St, New York, NY', 'Downtown', 'newyork@wyndham.com', 5, 4, '212-555-0406'),
('Wyndham', '1545 Collins Ave, Miami, FL', 'Beachfront', 'miami@wyndham.com', 5, 3, '305-555-0407'),
('Wyndham', '162 E Ontario St, Chicago, IL', 'Airport', 'chicago@wyndham.com', 5, 1, '312-555-0408');

-- continental (hotels 33-40)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Continental', '56 Yonge St, Toronto, ON', 'Downtown', 'toronto@continental.com', 5, 4, '416-555-0501'),
('Continental', '505 Sherbrooke E, Montreal, QC', 'Suburbs', 'montreal@continental.com', 5, 3, '514-555-0502'),
('Continental', '112 Sussex Dr, Ottawa, ON', 'Downtown', 'ottawa@continental.com', 5, 5, '613-555-0503'),
('Continental', '845 Hornby St, Vancouver, BC', 'Mountain', 'vancouver@continental.com', 5, 4, '604-555-0504'),
('Continental', '888 7th Ave SW, Calgary, AB', 'Countryside', 'calgary@continental.com', 5, 3, '403-555-0505'),
('Continental', '45 W 44th St, New York, NY', 'Downtown', 'newyork@continental.com', 5, 5, '212-555-0506'),
('Continental', '2001 Ocean Dr, Miami, FL', 'Beachfront', 'miami@continental.com', 5, 2, '305-555-0507'),
('Continental', '505 N Michigan Ave, Chicago, IL', 'Airport', 'chicago@continental.com', 5, 1, '312-555-0508');

-- additional locations (hotels 41-50, 2 per chain in new cities)
INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number) VALUES
('Marriott',    '555 S Figueroa St, Los Angeles, CA',  'Beachfront', 'losangeles@marriott.com',      5, 4, '213-555-0109'),
('Marriott',    '200 Stuart St, Boston, MA',            'Downtown',   'boston@marriott.com',          5, 5, '617-555-0110'),
('Hilton',      '1301 6th Ave, Seattle, WA',            'Mountain',   'seattle@hilton.com',           5, 3, '206-555-0209'),
('Hilton',      '2222 West Loop S, Houston, TX',        'Downtown',   'houston@hilton.com',           5, 4, '713-555-0210'),
('Days Inn',    '1530 N 52nd St, Phoenix, AZ',          'Suburbs',    'phoenix@daysinn.com',          5, 2, '602-555-0309'),
('Days Inn',    '4040 Quebec St, Denver, CO',           'Mountain',   'denver@daysinn.com',           5, 2, '720-555-0310'),
('Wyndham',     '3000 Paradise Rd, Las Vegas, NV',      'Downtown',   'lasvegas@wyndham.com',         5, 3, '702-555-0409'),
('Wyndham',     '165 Courtland St NE, Atlanta, GA',     'Downtown',   'atlanta@wyndham.com',          5, 4, '404-555-0410'),
('Continental', '345 Stockton St, San Francisco, CA',   'Beachfront', 'sanfrancisco@continental.com', 5, 5, '415-555-0509'),
('Continental', '1401 K St NW, Washington, DC',         'Downtown',   'washingtondc@continental.com', 5, 4, '202-555-0510');

-- rooms (5 per hotel, 200 total)
INSERT INTO room (hotel_id, number, price, capacity, can_be_extend, view_type, amenities, damages) VALUES
-- Marriott Toronto (1, rating 5)
(1, 101, 185, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(1, 102, 265, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(1, 201, 340, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(1, 202, 450, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(1, 301, 620, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Montreal (2, rating 4)
(2, 101, 165, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(2, 102, 240, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(2, 201, 310, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(2, 202, 415, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(2, 301, 570, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Ottawa (3, rating 3)
(3, 101, 145, 1, FALSE, 'sea_view', 'TV, WiFi', 'Leaky faucet'),
(3, 102, 210, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(3, 201, 275, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(3, 202, 365, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(3, 301, 500, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Vancouver (4, rating 5)
(4, 101, 195, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(4, 102, 280, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(4, 201, 360, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(4, 202, 475, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(4, 301, 640, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Calgary (5, rating 3)
(5, 101, 140, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(5, 102, 200, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(5, 201, 265, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(5, 202, 350, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', 'Broken AC'),
(5, 301, 480, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott New York (6, rating 4)
(6, 101, 220, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(6, 102, 310, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(6, 201, 395, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(6, 202, 520, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(6, 301, 700, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Miami (7, rating 2)
(7, 101, 130, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(7, 102, 185, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(7, 201, 240, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(7, 202, 320, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(7, 301, 440, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', 'Cracked mirror'),
-- Marriott Chicago (8, rating 1)
(8, 101, 110, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(8, 102, 160, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(8, 201, 210, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(8, 202, 280, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(8, 301, 380, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Toronto (9, rating 4)
(9, 101, 175, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(9, 102, 250, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(9, 201, 320, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(9, 202, 425, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(9, 301, 580, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Montreal (10, rating 5)
(10, 101, 195, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(10, 102, 275, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(10, 201, 355, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(10, 202, 465, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(10, 301, 635, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Ottawa (11, rating 3)
(11, 101, 140, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(11, 102, 200, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(11, 201, 260, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(11, 202, 345, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(11, 301, 470, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Vancouver (12, rating 4)
(12, 101, 180, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(12, 102, 255, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', 'Stained carpet'),
(12, 201, 330, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(12, 202, 435, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(12, 301, 590, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Calgary (13, rating 3)
(13, 101, 135, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(13, 102, 195, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(13, 201, 255, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(13, 202, 340, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(13, 301, 460, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton New York (14, rating 5)
(14, 101, 230, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(14, 102, 325, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(14, 201, 415, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(14, 202, 545, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(14, 301, 730, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Miami (15, rating 2)
(15, 101, 125, 1, FALSE, 'sea_view', 'TV, WiFi', 'Broken lamp'),
(15, 102, 180, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(15, 201, 235, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(15, 202, 310, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(15, 301, 425, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Chicago (16, rating 1)
(16, 101, 105, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(16, 102, 150, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(16, 201, 200, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(16, 202, 265, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(16, 301, 360, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Toronto (17, rating 2)
(17, 101, 85, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(17, 102, 120, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(17, 201, 155, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(17, 202, 205, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(17, 301, 280, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Montreal (18, rating 3)
(18, 101, 95, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(18, 102, 135, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(18, 201, 175, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(18, 202, 230, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(18, 301, 315, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Ottawa (19, rating 2)
(19, 101, 80, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(19, 102, 115, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(19, 201, 150, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(19, 202, 200, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(19, 301, 270, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Vancouver (20, rating 3)
(20, 101, 100, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(20, 102, 140, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(20, 201, 180, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', 'Loose window latch'),
(20, 202, 240, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(20, 301, 325, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Calgary (21, rating 1)
(21, 101, 70, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(21, 102, 100, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(21, 201, 130, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(21, 202, 175, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(21, 301, 240, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn New York (22, rating 4)
(22, 101, 130, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(22, 102, 185, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(22, 201, 240, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(22, 202, 315, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(22, 301, 430, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Miami (23, rating 3)
(23, 101, 90, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(23, 102, 130, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(23, 201, 170, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(23, 202, 225, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(23, 301, 305, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Chicago (24, rating 1)
(24, 101, 65, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(24, 102, 95, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(24, 201, 125, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(24, 202, 165, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', 'Damaged headboard'),
(24, 301, 225, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Toronto (25, rating 3)
(25, 101, 115, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(25, 102, 165, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(25, 201, 215, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(25, 202, 285, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(25, 301, 390, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Montreal (26, rating 4)
(26, 101, 135, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(26, 102, 190, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(26, 201, 250, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(26, 202, 330, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(26, 301, 450, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Ottawa (27, rating 3)
(27, 101, 110, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(27, 102, 160, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(27, 201, 205, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(27, 202, 275, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(27, 301, 375, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Vancouver (28, rating 5)
(28, 101, 175, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(28, 102, 250, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(28, 201, 320, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(28, 202, 425, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(28, 301, 580, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Calgary (29, rating 2)
(29, 101, 95, 1, FALSE, 'sea_view', 'TV, WiFi', 'Torn curtain'),
(29, 102, 135, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(29, 201, 175, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(29, 202, 235, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(29, 301, 320, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham New York (30, rating 4)
(30, 101, 185, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(30, 102, 265, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(30, 201, 340, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(30, 202, 450, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(30, 301, 610, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Miami (31, rating 3)
(31, 101, 120, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(31, 102, 170, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(31, 201, 225, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(31, 202, 295, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(31, 301, 405, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Chicago (32, rating 1)
(32, 101, 85, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(32, 102, 120, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(32, 201, 160, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(32, 202, 210, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(32, 301, 290, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Toronto (33, rating 4)
(33, 101, 155, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(33, 102, 220, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(33, 201, 285, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(33, 202, 380, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(33, 301, 515, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Montreal (34, rating 3)
(34, 101, 130, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(34, 102, 185, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(34, 201, 240, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(34, 202, 320, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(34, 301, 435, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Ottawa (35, rating 5)
(35, 101, 185, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(35, 102, 265, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(35, 201, 340, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(35, 202, 450, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(35, 301, 615, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Vancouver (36, rating 4)
(36, 101, 165, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(36, 102, 235, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(36, 201, 305, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(36, 202, 405, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(36, 301, 550, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Calgary (37, rating 3)
(37, 101, 125, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(37, 102, 180, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(37, 201, 235, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(37, 202, 310, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(37, 301, 425, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental New York (38, rating 5)
(38, 101, 240, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(38, 102, 340, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(38, 201, 435, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(38, 202, 570, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(38, 301, 765, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Miami (39, rating 2)
(39, 101, 115, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(39, 102, 165, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(39, 201, 215, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(39, 202, 285, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(39, 301, 390, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Chicago (40, rating 1)
(40, 101, 90, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(40, 102, 130, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(40, 201, 170, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(40, 202, 225, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(40, 301, 305, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Los Angeles (41, rating 4)
(41, 101, 170, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(41, 102, 245, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(41, 201, 315, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(41, 202, 420, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(41, 301, 575, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Marriott Boston (42, rating 5)
(42, 101, 210, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(42, 102, 295, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(42, 201, 380, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(42, 202, 500, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(42, 301, 670, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Seattle (43, rating 3)
(43, 101, 145, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(43, 102, 205, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(43, 201, 270, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(43, 202, 355, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(43, 301, 485, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Hilton Houston (44, rating 4)
(44, 101, 160, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(44, 102, 230, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(44, 201, 295, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(44, 202, 395, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(44, 301, 540, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Phoenix (45, rating 2)
(45, 101, 75, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(45, 102, 110, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(45, 201, 145, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(45, 202, 190, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(45, 301, 260, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Days Inn Denver (46, rating 2)
(46, 101, 80, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(46, 102, 115, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(46, 201, 150, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(46, 202, 200, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(46, 301, 270, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Las Vegas (47, rating 3)
(47, 101, 120, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(47, 102, 170, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(47, 201, 225, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(47, 202, 295, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(47, 301, 405, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Wyndham Atlanta (48, rating 4)
(48, 101, 140, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(48, 102, 200, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(48, 201, 260, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(48, 202, 345, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(48, 301, 470, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental San Francisco (49, rating 5)
(49, 101, 220, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(49, 102, 310, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(49, 201, 400, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(49, 202, 525, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(49, 301, 705, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL),
-- Continental Washington DC (50, rating 4)
(50, 101, 170, 1, FALSE, 'sea_view', 'TV, WiFi', NULL),
(50, 102, 245, 2, TRUE, 'mountain_view', 'TV, WiFi, Fridge', NULL),
(50, 201, 315, 3, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC', NULL),
(50, 202, 420, 4, TRUE, 'mountain_view', 'TV, WiFi, Fridge, AC, Minibar', NULL),
(50, 301, 575, 5, TRUE, 'sea_view', 'TV, WiFi, Fridge, AC, Minibar, Jacuzzi', NULL);

-- room amenities (sample)
INSERT INTO room_amenities (hotel_id, number, amenities) VALUES
(1, 101, 'TV'), (1, 101, 'WiFi'),
(1, 102, 'TV'), (1, 102, 'WiFi'), (1, 102, 'Fridge'),
(1, 201, 'TV'), (1, 201, 'WiFi'), (1, 201, 'Fridge'), (1, 201, 'AC'),
(1, 202, 'TV'), (1, 202, 'WiFi'), (1, 202, 'Fridge'), (1, 202, 'AC'), (1, 202, 'Minibar'),
(1, 301, 'TV'), (1, 301, 'WiFi'), (1, 301, 'Fridge'), (1, 301, 'AC'), (1, 301, 'Minibar'), (1, 301, 'Jacuzzi'),
(2, 101, 'TV'), (2, 101, 'WiFi'),
(2, 102, 'TV'), (2, 102, 'WiFi'), (2, 102, 'Fridge'),
(5, 301, 'TV'), (5, 301, 'WiFi'), (5, 301, 'Fridge'), (5, 301, 'AC'), (5, 301, 'Minibar'), (5, 301, 'Jacuzzi'),
(10, 101, 'TV'), (10, 101, 'WiFi'),
(14, 301, 'TV'), (14, 301, 'WiFi'), (14, 301, 'Fridge'), (14, 301, 'AC'), (14, 301, 'Minibar'), (14, 301, 'Jacuzzi'),
(38, 301, 'TV'), (38, 301, 'WiFi'), (38, 301, 'Fridge'), (38, 301, 'AC'), (38, 301, 'Minibar'), (38, 301, 'Jacuzzi');

-- room problems
INSERT INTO room_problems (hotel_id, number, problems) VALUES
(3, 101, 'Leaky faucet'),
(5, 202, 'Broken AC'),
(7, 301, 'Cracked mirror'),
(12, 102, 'Stained carpet'),
(15, 101, 'Broken lamp'),
(20, 201, 'Loose window latch'),
(24, 202, 'Damaged headboard'),
(29, 101, 'Torn curtain');

-- employees (2 per hotel, 80 total)
INSERT INTO employee (ssn, hotel_id, name, address, roles) VALUES
('001-00-0001', 1,  'James Carter',       '1 Elm St, Toronto, ON',      'manager'),
('002-00-0002', 1,  'Carlos Rivera',      '2 Oak Ave, Toronto, ON',     'receptionist'),
('003-00-0003', 2,  'Sarah Mitchell',     '3 Elm St, Montreal, QC',     'manager'),
('004-00-0004', 2,  'Olivia Bennett',     '4 Oak Ave, Montreal, QC',    'concierge'),
('005-00-0005', 3,  'Robert Hughes',      '5 Elm St, Ottawa, ON',       'manager'),
('006-00-0006', 3,  'Derek Johnson',      '6 Oak Ave, Ottawa, ON',      'housekeeping'),
('007-00-0007', 4,  'Emily Foster',       '7 Elm St, Vancouver, BC',    'manager'),
('008-00-0008', 4,  'Natalie Cruz',       '8 Oak Ave, Vancouver, BC',   'maintenance'),
('009-00-0009', 5,  'David Chen',         '9 Elm St, Calgary, AB',      'manager'),
('010-00-0010', 5,  'Anthony Simmons',    '10 Oak Ave, Calgary, AB',    'receptionist'),
('011-00-0011', 6,  'Maria Gonzalez',     '11 Elm St, New York, NY',    'manager'),
('012-00-0012', 6,  'Hannah Edwards',     '12 Oak Ave, New York, NY',   'security'),
('013-00-0013', 7,  'Michael Brown',      '13 Elm St, Miami, FL',       'manager'),
('014-00-0014', 7,  'Marcus Bell',        '14 Oak Ave, Miami, FL',      'concierge'),
('015-00-0015', 8,  'Jennifer Lee',       '15 Elm St, Chicago, IL',     'manager'),
('016-00-0016', 8,  'Priya Sharma',       '16 Oak Ave, Chicago, IL',    'receptionist'),
('017-00-0017', 9,  'William Scott',      '17 Elm St, Toronto, ON',     'manager'),
('018-00-0018', 9,  'Tyler Brooks',       '18 Oak Ave, Toronto, ON',    'housekeeping'),
('019-00-0019', 10, 'Amanda Torres',      '19 Elm St, Montreal, QC',    'manager'),
('020-00-0020', 10, 'Zoe Campbell',       '20 Oak Ave, Montreal, QC',   'receptionist'),
('021-00-0021', 11, 'Thomas Harris',      '21 Elm St, Ottawa, ON',      'manager'),
('022-00-0022', 11, 'Nathan Foster',      '22 Oak Ave, Ottawa, ON',     'maintenance'),
('023-00-0023', 12, 'Lisa Park',          '23 Elm St, Vancouver, BC',   'manager'),
('024-00-0024', 12, 'Sofia Ramirez',      '24 Oak Ave, Vancouver, BC',  'concierge'),
('025-00-0025', 13, 'Christopher Adams',  '25 Elm St, Calgary, AB',     'manager'),
('026-00-0026', 13, 'Ethan Cooper',       '26 Oak Ave, Calgary, AB',    'receptionist'),
('027-00-0027', 14, 'Rachel King',        '27 Elm St, New York, NY',    'manager'),
('028-00-0028', 14, 'Alyssa Reed',        '28 Oak Ave, New York, NY',   'housekeeping'),
('029-00-0029', 15, 'Daniel White',       '29 Elm St, Miami, FL',       'manager'),
('030-00-0030', 15, 'Owen Murphy',        '30 Oak Ave, Miami, FL',      'security'),
('031-00-0031', 16, 'Nicole Martinez',    '31 Elm St, Chicago, IL',     'manager'),
('032-00-0032', 16, 'Kayla Richardson',   '32 Oak Ave, Chicago, IL',    'receptionist'),
('033-00-0033', 17, 'Kevin Thompson',     '33 Elm St, Toronto, ON',     'manager'),
('034-00-0034', 17, 'Isaac Powell',       '34 Oak Ave, Toronto, ON',    'concierge'),
('035-00-0035', 18, 'Stephanie Anderson', '35 Elm St, Montreal, QC',    'manager'),
('036-00-0036', 18, 'Maya Howard',        '36 Oak Ave, Montreal, QC',   'receptionist'),
('037-00-0037', 19, 'Brian Wilson',       '37 Elm St, Ottawa, ON',      'manager'),
('038-00-0038', 19, 'Caleb Jenkins',      '38 Oak Ave, Ottawa, ON',     'housekeeping'),
('039-00-0039', 20, 'Michelle Taylor',    '39 Elm St, Vancouver, BC',   'manager'),
('040-00-0040', 20, 'Leah Long',          '40 Oak Ave, Vancouver, BC',  'maintenance'),
('041-00-0041', 21, 'Jason Moore',        '41 Elm St, Calgary, AB',     'manager'),
('042-00-0042', 21, 'Connor Patterson',   '42 Oak Ave, Calgary, AB',    'receptionist'),
('043-00-0043', 22, 'Laura Jackson',      '43 Elm St, New York, NY',    'manager'),
('044-00-0044', 22, 'Jasmine Price',      '44 Oak Ave, New York, NY',   'concierge'),
('045-00-0045', 23, 'Ryan Martin',        '45 Elm St, Miami, FL',       'manager'),
('046-00-0046', 23, 'Eli Sanchez',        '46 Oak Ave, Miami, FL',      'security'),
('047-00-0047', 24, 'Heather Lewis',      '47 Elm St, Chicago, IL',     'manager'),
('048-00-0048', 24, 'Chloe Perry',        '48 Oak Ave, Chicago, IL',    'receptionist'),
('049-00-0049', 25, 'Andrew Hall',        '49 Elm St, Toronto, ON',     'manager'),
('050-00-0050', 25, 'Liam Gray',          '50 Oak Ave, Toronto, ON',    'housekeeping'),
('051-00-0051', 26, 'Samantha Young',     '51 Elm St, Montreal, QC',    'manager'),
('052-00-0052', 26, 'Ella Ward',          '52 Oak Ave, Montreal, QC',   'receptionist'),
('053-00-0053', 27, 'Matthew Clark',      '53 Elm St, Ottawa, ON',      'manager'),
('054-00-0054', 27, 'Noah Coleman',       '54 Oak Ave, Ottawa, ON',     'maintenance'),
('055-00-0055', 28, 'Ashley Walker',      '55 Elm St, Vancouver, BC',   'manager'),
('056-00-0056', 28, 'Avery Butler',       '56 Oak Ave, Vancouver, BC',  'concierge'),
('057-00-0057', 29, 'Joshua Allen',       '57 Elm St, Calgary, AB',     'manager'),
('058-00-0058', 29, 'Logan Henderson',    '58 Oak Ave, Calgary, AB',    'receptionist'),
('059-00-0059', 30, 'Megan Wright',       '59 Elm St, New York, NY',    'manager'),
('060-00-0060', 30, 'Aria Cox',           '60 Oak Ave, New York, NY',   'housekeeping'),
('061-00-0061', 31, 'Eric Hill',          '61 Elm St, Miami, FL',       'manager'),
('062-00-0062', 31, 'Mason Russell',      '62 Oak Ave, Miami, FL',      'security'),
('063-00-0063', 32, 'Brittany Green',     '63 Elm St, Chicago, IL',     'manager'),
('064-00-0064', 32, 'Scarlett Griffin',   '64 Oak Ave, Chicago, IL',    'receptionist'),
('065-00-0065', 33, 'Patrick Baker',      '65 Elm St, Toronto, ON',     'manager'),
('066-00-0066', 33, 'Lucas Diaz',         '66 Oak Ave, Toronto, ON',    'concierge'),
('067-00-0067', 34, 'Vanessa Nelson',     '67 Elm St, Montreal, QC',    'manager'),
('068-00-0068', 34, 'Madison Hughes',     '68 Oak Ave, Montreal, QC',   'receptionist'),
('069-00-0069', 35, 'Sean Carter',        '69 Elm St, Ottawa, ON',      'manager'),
('070-00-0070', 35, 'Henry Watson',       '70 Oak Ave, Ottawa, ON',     'housekeeping'),
('071-00-0071', 36, 'Danielle Collins',   '71 Elm St, Vancouver, BC',   'manager'),
('072-00-0072', 36, 'Abigail Price',      '72 Oak Ave, Vancouver, BC',  'maintenance'),
('073-00-0073', 37, 'Timothy Ross',       '73 Elm St, Calgary, AB',     'manager'),
('074-00-0074', 37, 'Alexander Barnes',   '74 Oak Ave, Calgary, AB',    'receptionist'),
('075-00-0075', 38, 'Amber Rivera',       '75 Elm St, New York, NY',    'manager'),
('076-00-0076', 38, 'Grace Evans',        '76 Oak Ave, New York, NY',   'security'),
('077-00-0077', 39, 'Mark Stewart',       '77 Elm St, Miami, FL',       'manager'),
('078-00-0078', 39, 'Elijah Torres',      '78 Oak Ave, Miami, FL',      'concierge'),
('079-00-0079', 40, 'Catherine Perez',    '79 Elm St, Chicago, IL',     'manager'),
('080-00-0080', 40, 'Victoria Flores',    '80 Oak Ave, Chicago, IL',    'receptionist'),
-- employees for hotels 41-50
('081-00-0081', 41, 'Peter Walsh',       '81 Elm St, Los Angeles, CA',    'manager'),
('082-00-0082', 41, 'Jake Murphy',       '82 Oak Ave, Los Angeles, CA',   'receptionist'),
('083-00-0083', 42, 'Rachel Chen',       '83 Elm St, Boston, MA',         'manager'),
('084-00-0084', 42, 'Lily Thompson',     '84 Oak Ave, Boston, MA',        'concierge'),
('085-00-0085', 43, 'Steven Park',       '85 Elm St, Seattle, WA',        'manager'),
('086-00-0086', 43, 'Omar Hassan',       '86 Oak Ave, Seattle, WA',       'housekeeping'),
('087-00-0087', 44, 'Diana Lee',         '87 Elm St, Houston, TX',        'manager'),
('088-00-0088', 44, 'Nina Patel',        '88 Oak Ave, Houston, TX',       'receptionist'),
('089-00-0089', 45, 'Paul Rodriguez',    '89 Elm St, Phoenix, AZ',        'manager'),
('090-00-0090', 45, 'Ben Crawford',      '90 Oak Ave, Phoenix, AZ',       'maintenance'),
('091-00-0091', 46, 'Nancy Kim',         '91 Elm St, Denver, CO',         'manager'),
('092-00-0092', 46, 'Sara Chen',         '92 Oak Ave, Denver, CO',        'receptionist'),
('093-00-0093', 47, 'George Thompson',   '93 Elm St, Las Vegas, NV',      'manager'),
('094-00-0094', 47, 'Felix Torres',      '94 Oak Ave, Las Vegas, NV',     'concierge'),
('095-00-0095', 48, 'Dorothy Wilson',    '95 Elm St, Atlanta, GA',        'manager'),
('096-00-0096', 48, 'Iris Johnson',      '96 Oak Ave, Atlanta, GA',       'housekeeping'),
('097-00-0097', 49, 'Richard Martinez',  '97 Elm St, San Francisco, CA',  'manager'),
('098-00-0098', 49, 'Dan Kim',           '98 Oak Ave, San Francisco, CA', 'security'),
('099-00-0099', 50, 'Sandra Garcia',     '99 Elm St, Washington, DC',     'manager'),
('100-00-0100', 50, 'Alice Wong',        '100 Oak Ave, Washington, DC',   'receptionist');

-- employee roles
INSERT INTO employee_roles (e_ssn, role) VALUES
('001-00-0001', 'manager'),   ('002-00-0002', 'receptionist'),
('003-00-0003', 'manager'),   ('004-00-0004', 'concierge'),
('005-00-0005', 'manager'),   ('006-00-0006', 'housekeeping'),
('007-00-0007', 'manager'),   ('008-00-0008', 'maintenance'),
('009-00-0009', 'manager'),   ('010-00-0010', 'receptionist'),
('011-00-0011', 'manager'),   ('012-00-0012', 'security'),
('013-00-0013', 'manager'),   ('014-00-0014', 'concierge'),
('015-00-0015', 'manager'),   ('016-00-0016', 'receptionist'),
('017-00-0017', 'manager'),   ('018-00-0018', 'housekeeping'),
('019-00-0019', 'manager'),   ('020-00-0020', 'receptionist'),
('021-00-0021', 'manager'),   ('022-00-0022', 'maintenance'),
('023-00-0023', 'manager'),   ('024-00-0024', 'concierge'),
('025-00-0025', 'manager'),   ('026-00-0026', 'receptionist'),
('027-00-0027', 'manager'),   ('028-00-0028', 'housekeeping'),
('029-00-0029', 'manager'),   ('030-00-0030', 'security'),
('031-00-0031', 'manager'),   ('032-00-0032', 'receptionist'),
('033-00-0033', 'manager'),   ('034-00-0034', 'concierge'),
('035-00-0035', 'manager'),   ('036-00-0036', 'receptionist'),
('037-00-0037', 'manager'),   ('038-00-0038', 'housekeeping'),
('039-00-0039', 'manager'),   ('040-00-0040', 'maintenance'),
('041-00-0041', 'manager'),   ('042-00-0042', 'receptionist'),
('043-00-0043', 'manager'),   ('044-00-0044', 'concierge'),
('045-00-0045', 'manager'),   ('046-00-0046', 'security'),
('047-00-0047', 'manager'),   ('048-00-0048', 'receptionist'),
('049-00-0049', 'manager'),   ('050-00-0050', 'housekeeping'),
('051-00-0051', 'manager'),   ('052-00-0052', 'receptionist'),
('053-00-0053', 'manager'),   ('054-00-0054', 'maintenance'),
('055-00-0055', 'manager'),   ('056-00-0056', 'concierge'),
('057-00-0057', 'manager'),   ('058-00-0058', 'receptionist'),
('059-00-0059', 'manager'),   ('060-00-0060', 'housekeeping'),
('061-00-0061', 'manager'),   ('062-00-0062', 'security'),
('063-00-0063', 'manager'),   ('064-00-0064', 'receptionist'),
('065-00-0065', 'manager'),   ('066-00-0066', 'concierge'),
('067-00-0067', 'manager'),   ('068-00-0068', 'receptionist'),
('069-00-0069', 'manager'),   ('070-00-0070', 'housekeeping'),
('071-00-0071', 'manager'),   ('072-00-0072', 'maintenance'),
('073-00-0073', 'manager'),   ('074-00-0074', 'receptionist'),
('075-00-0075', 'manager'),   ('076-00-0076', 'security'),
('077-00-0077', 'manager'),   ('078-00-0078', 'concierge'),
('079-00-0079', 'manager'),   ('080-00-0080', 'receptionist'),
('081-00-0081', 'manager'),  ('082-00-0082', 'receptionist'),
('083-00-0083', 'manager'),  ('084-00-0084', 'concierge'),
('085-00-0085', 'manager'),  ('086-00-0086', 'housekeeping'),
('087-00-0087', 'manager'),  ('088-00-0088', 'receptionist'),
('089-00-0089', 'manager'),  ('090-00-0090', 'maintenance'),
('091-00-0091', 'manager'),  ('092-00-0092', 'receptionist'),
('093-00-0093', 'manager'),  ('094-00-0094', 'concierge'),
('095-00-0095', 'manager'),  ('096-00-0096', 'housekeeping'),
('097-00-0097', 'manager'),  ('098-00-0098', 'security'),
('099-00-0099', 'manager'),  ('100-00-0100', 'receptionist');

-- managers
INSERT INTO manager (hotel_id, e_ssn) VALUES
(1,  '001-00-0001'), (2,  '003-00-0003'), (3,  '005-00-0005'), (4,  '007-00-0007'),
(5,  '009-00-0009'), (6,  '011-00-0011'), (7,  '013-00-0013'), (8,  '015-00-0015'),
(9,  '017-00-0017'), (10, '019-00-0019'), (11, '021-00-0021'), (12, '023-00-0023'),
(13, '025-00-0025'), (14, '027-00-0027'), (15, '029-00-0029'), (16, '031-00-0031'),
(17, '033-00-0033'), (18, '035-00-0035'), (19, '037-00-0037'), (20, '039-00-0039'),
(21, '041-00-0041'), (22, '043-00-0043'), (23, '045-00-0045'), (24, '047-00-0047'),
(25, '049-00-0049'), (26, '051-00-0051'), (27, '053-00-0053'), (28, '055-00-0055'),
(29, '057-00-0057'), (30, '059-00-0059'), (31, '061-00-0061'), (32, '063-00-0063'),
(33, '065-00-0065'), (34, '067-00-0067'), (35, '069-00-0069'), (36, '071-00-0071'),
(37, '073-00-0073'), (38, '075-00-0075'), (39, '077-00-0077'), (40, '079-00-0079'),
(41, '081-00-0081'), (42, '083-00-0083'), (43, '085-00-0085'), (44, '087-00-0087'),
(45, '089-00-0089'), (46, '091-00-0091'), (47, '093-00-0093'), (48, '095-00-0095'),
(49, '097-00-0097'), (50, '099-00-0099');

-- customers (must come before bookings and rentings)
INSERT INTO customer (ssn, name, address, registration_date) VALUES
('111-22-3333', 'Alice Johnson',  '123 Main St, Toronto, ON',    '2025-01-15'),
('222-33-4444', 'Bob Smith',      '456 Oak Ave, Montreal, QC',   '2025-02-20'),
('333-44-5555', 'Carol Williams', '789 Pine Rd, Ottawa, ON',     '2025-03-10'),
('444-55-6666', 'David Brown',    '321 Elm St, Vancouver, BC',   '2025-04-05'),
('555-66-7777', 'Eve Davis',      '654 Maple Dr, Calgary, AB',   '2025-05-12'),
('666-77-8888', 'Frank Miller',   '987 Cedar Ln, New York, NY',  '2025-06-18'),
('777-88-9999', 'Grace Wilson',   '147 Birch Blvd, Miami, FL',   '2025-07-22'),
('888-99-0000', 'Henry Taylor',   '258 Spruce Ct, Chicago, IL',  '2025-08-30');

-- bookings
INSERT INTO booking (customer_ssn, hotel_id, room_number, start_date, end_date) VALUES
('111-22-3333', 1,  101, '2026-04-10', '2026-04-15'),
('222-33-4444', 1,  201, '2026-04-12', '2026-04-14'),
('333-44-5555', 2,  102, '2026-04-20', '2026-04-25'),
('444-55-6666', 5,  301, '2026-05-01', '2026-05-05'),
('555-66-7777', 10, 101, '2026-04-15', '2026-04-18'),
('666-77-8888', 15, 202, '2026-05-10', '2026-05-14'),
('777-88-9999', 20, 101, '2026-04-08', '2026-04-12'),
('888-99-0000', 25, 301, '2026-06-01', '2026-06-07');

-- rentings
INSERT INTO renting (customer_ssn, hotel_id, room_number, e_ssn, start_date, end_date) VALUES
('333-44-5555', 1,  102, '002-00-0002', '2026-04-01', '2026-04-05'),
('555-66-7777', 3,  201, '006-00-0006', '2026-04-02', '2026-04-06'),
('777-88-9999', 10, 202, '020-00-0020', '2026-04-05', '2026-04-09');

-- payments
INSERT INTO payment (renting_id, amount, payment_date) VALUES
(1, 1060.00, '2026-04-05'),
(2, 1100.00, '2026-04-06'),
(3, 1860.00, '2026-04-09');

