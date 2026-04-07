-- queries

--find all bookings for a given user
SELECT 
    c.name AS customer_name,
    b.booking_id,
    h.hotel_id,
    h.address AS hotel_address,
    b.room_number,
    b.start_date,
    b.end_date
FROM booking b
JOIN customer c ON b.customer_ssn = c.ssn
JOIN hotel h ON b.hotel_id = h.hotel_id
WHERE c.ssn = '111-22-3333'
ORDER BY b.start_date;

--find employees working in a hotel
SELECT 
    e.ssn,
    e.full_name,
    e.address,
    e.roles
FROM employee e
WHERE e.hotel_id = 1; 

--aggregation
--counts rooms for a given hotel
SELECT 
    h.hotel_id,
    h.address AS hotel_address,
    COUNT(r.number) AS total_rooms
FROM hotel h
LEFT JOIN room r ON h.hotel_id = r.hotel_id
WHERE h.hotel_id = 1
GROUP BY h.hotel_id, h.address
ORDER BY total_rooms;

--nested
--checks if a room in a hotel has a sea view
SELECT 
    h.hotel_id,
    h.address
FROM hotel h
WHERE h.hotel_id IN (
    SELECT hotel_id
    FROM room
    WHERE view_type = 'sea_view'
);





