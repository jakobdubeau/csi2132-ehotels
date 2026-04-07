-- queries

--find all bookings for a given user
SELECT 
    b.booking_id,
    c.name
    h.hotel_id,
    h.address
    b.room_number,
    b.start_date,
    b.end_date
FROM booking b
JOIN customer c ON b.customer_ssn = c.ssn
JOIN hotel h ON b.hotel_id = h.hotel_id
ORDER BY b.start_date;