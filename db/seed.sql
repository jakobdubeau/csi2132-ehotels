-- seed data
--5 hotel chains (Luxury, Business, Resort, Boutique, Budget)
-- 8+ hotels per chain across 3+ categories, some sharing areas
-- 5+ rooms per hotel with different capacities
-- Sample customers and employees

INSERT INTO hotel_chain (name, office_address, hotels_num, contact_emails, contact_phone_numbers) VALUES 
('Luxury', '111 Luxury St, Ottawa', 8, 'luxury@hotel.com', '1-800-LUXURY'),
('Business', '222 Business Ave, Montreal', 9, 'business@hotel.com', '1-800-BUSINESS'),
('Resort', '333 Resort Blvd, Toronto', 10, 'resort@hotel.com', '1-800-RESORT'),
('Boutique', '444 Boutique Ln, Montreal', 9, 'boutique@hotel.com', '1-800-OUTIQUE'),
('Budget', '555 Budget Dr, Ottawa', 8, 'budget@hotel.com', '1-800-BUDGET');


--MIGHT REMOVE--------------------------------
INSERT INTO hotel_chain_email (name, office_address, contact_emails) VALUES 
('Luxury', '111 Luxury St, Ottawa', 'luxury@hotel.com'),
('Business', '222 Business Ave, Montreal', 'business@hotel.com'),
('Resort', '333 Resort Blvd, Toronto', 'resort@hotel.com'),
('Boutique', '444 Boutique Ln, Montreal', 'boutique@hotel.com'),
('Budget', '555 Budget Dr, Ottawa', 'budget@hotel.com');

INSERT INTO hotel_chain_phone (name, office_address, contact_phone_numbers) VALUES 
('Luxury', '111 Luxury St, Ottawa', '1-800-LUXURY');
('Business', '222 Business Ave, Montreal', '1-800-BUSINESS'),
('Resort', '333 Resort Blvd, Toronto', '1-800-RESORT'),
('Boutique', '444 Boutique Ln, Montreal', '1-800-OUTIQUE'),
('Budget', '555 Budget Dr, Ottawa', '1-800-BUDGET');
----------------------------------------------

INSERT INTO hotel (hotel_id, hotel_chain_name, address, email, rooms_num, rating, phone_number) VALUES
(1, 'Luxury', '100 Luxury St, Ottawa', 'luxury100@hotel.com', 5, 4.5, '1-800-LUX-100'),
(2, 'Luxury', '101 Luxury St, Ottawa', 'luxury101@hotel.com', 5, 4.7, '1-800-LUX-101'),
(3, 'Luxury', '102 Luxury St, Ottawa', 'luxury102@hotel.com', 5, 4.3, '1-800-LUX-102'),
(4, 'Luxury', '103 Luxury St, Ottawa', 'luxury103@hotel.com', 5, 4.8, '1-800-LUX-200'),
(5, 'Luxury', '104 Luxury St, Ottawa', 'luxury104@hotel.com', 5, 4.6, '1-800-LUX-201'),
(6, 'Luxury', '105 Luxury St, Ottawa', 'luxury105@hotel.com', 5, 4.4, '1-800-LUX-010'),
(7, 'Luxury', '106 Luxury St, Ottawa', 'luxury106@hotel.com', 5, 4.9, '1-800-LUX-011'),
(8, 'Luxury', '107 Luxury St, Ottawa', 'luxury107@hotel.com', 5, 4.2, '1-800-LUX-012');

(9, 'Business', '200 Business Ave, Montreal', 'business200@hotel.com', 5, 4.1, '1-800-BUS-200'),
(10, 'Business', '201 Business Ave, Montreal', 'business201@hotel.com', 5, 4.3, '1-800-BUS-201'),
(11, 'Business', '202 Business Ave, Montreal', 'business202@hotel.com', 5, 4.2, '1-800-BUS-202'),
(12, 'Business', '203 Business Ave, Montreal', 'business203@hotel.com', 5, 4.4, '1-800-BUS-203'),
(13, 'Business', '204 Business Ave, Montreal', 'business204@hotel.com', 5, 4.1, '1-800-BUS-204'),
(14, 'Business', '205 Business Ave, Montreal', 'business205@hotel.com', 5, 4.2, '1-800-BUS-205'),
(15, 'Business', '206 Business Ave, Montreal', 'business206@hotel.com', 5, 4.3, '1-800-BUS-206'),
(16, 'Business', '207 Business Ave, Montreal', 'business207@hotel.com', 5, 4.1, '1-800-BUS-207');

(17, 'Resort', '300 Resort Blvd, Toronto', 'resort300@hotel.com', 5, 4.6, '1-800-RES-300'),
(18, 'Resort', '301 Resort Blvd, Toronto', 'resort301@hotel.com', 5, 4.4, '1-800-RES-301'),
(19, 'Resort', '302 Resort Blvd, Toronto', 'resort302@hotel.com', 5, 4.7, '1-800-RES-302'),
(20, 'Resort', '303 Resort Blvd, Toronto', 'resort303@hotel.com', 5, 4.5, '1-800-RES-303'),
(21, 'Resort', '304 Resort Blvd, Toronto', 'resort304@hotel.com', 5, 4.8, '1-800-RES-304'),
(22, 'Resort', '305 Resort Blvd, Toronto', 'resort305@hotel.com', 5, 4.3, '1-800-RES-305'),
(23, 'Resort', '306 Resort Blvd, Toronto', 'resort306@hotel.com', 5, 4.6, '1-800-RES-306'),
(24, 'Resort', '307 Resort Blvd, Toronto', 'resort307@hotel.com', 5, 4.4, '1-800-RES-307'),

(25, 'Boutique', '400 Boutique Ln, Montreal', 'boutique400@hotel.com', 5, 4.5, '1-800-BOU-400'),
(26, 'Boutique', '401 Boutique Ln, Montreal', 'boutique401@hotel.com', 5, 4.6, '1-800-BOU-401'),
(27, 'Boutique', '402 Boutique Ln, Montreal', 'boutique402@hotel.com', 5, 4.4, '1-800-BOU-402'),
(28, 'Boutique', '403 Boutique Ln, Montreal', 'boutique403@hotel.com', 5, 4.7, '1-800-BOU-403'),
(29, 'Boutique', '404 Boutique Ln, Montreal', 'boutique404@hotel.com', 5, 4.3, '1-800-BOU-404'),
(30, 'Boutique', '405 Boutique Ln, Montreal', 'boutique405@hotel.com', 5, 4.8, '1-800-BOU-405'),
(31, 'Boutique', '406 Boutique Ln, Montreal', 'boutique406@hotel.com', 5, 4.6, '1-800-BOU-406'),
(32, 'Boutique', '407 Boutique Ln, Montreal', 'boutique407@hotel.com', 5, 4.4, '1-800-BOU-407'),

(33, 'Budget', '500 Budget Dr, Ottawa', 'budget500@hotel.com', 5, 3.8, '1-800-BUD-500'),
(34, 'Budget', '501 Budget Dr, Ottawa', 'budget501@hotel.com', 5, 3.9, '1-800-BUD-501'),
(35, 'Budget', '502 Budget Dr, Ottawa', 'budget502@hotel.com', 5, 3.7, '1-800-BUD-502'),
(36, 'Budget', '503 Budget Dr, Ottawa', 'budget503@hotel.com', 5, 4.0, '1-800-BUD-503'),
(37, 'Budget', '504 Budget Dr, Ottawa', 'budget504@hotel.com', 5, 3.6, '1-800-BUD-504'),
(38, 'Budget', '505 Budget Dr, Ottawa', 'budget505@hotel.com', 5, 3.9, '1-800-BUD-505'),
(39, 'Budget', '506 Budget Dr, Ottawa', 'budget506@hotel.com', 5, 3.8, '1-800-BUD-506'),
(40, 'Budget', '507 Budget Dr, Ottawa', 'budget507@hotel.com', 5, 3.7, '1-800-BUD-507');