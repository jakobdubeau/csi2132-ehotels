-- number of available rooms per area (not currently booked or rented today)
CREATE VIEW available_rooms_per_area AS
SELECT h.area, COUNT(*) AS available_rooms
FROM room r
JOIN hotel h ON r.hotel_id = h.hotel_id
WHERE NOT EXISTS (
    SELECT * FROM booking b
    WHERE b.hotel_id = r.hotel_id AND b.room_number = r.number
      AND b.start_date <= CURRENT_DATE AND b.end_date >= CURRENT_DATE
)
AND NOT EXISTS (
    SELECT * FROM renting rt
    WHERE rt.hotel_id = r.hotel_id AND rt.room_number = r.number
      AND rt.start_date <= CURRENT_DATE AND rt.end_date >= CURRENT_DATE
)
GROUP BY h.area
ORDER BY h.area;

-- aggregated room capacity per hotel
CREATE VIEW hotel_aggregated_capacity AS
SELECT h.hotel_id, h.address, h.hotel_chain_name, SUM(r.capacity) AS total_capacity
FROM hotel h
JOIN room r ON r.hotel_id = h.hotel_id
GROUP BY h.hotel_id, h.address, h.hotel_chain_name
ORDER BY h.hotel_chain_name, h.address;
