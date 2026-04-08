-- indexes

--important for looking up bookings from a customer
--finding all bookings for a given user
--important for checking if a customer has 3 bookings already
CREATE INDEX idx_booking_customer
ON booking(customer_ssn);

--important for looking up bookings for a given room
--checking if there is overlapping dates for a room
--listing all the bookings for a room
CREATE INDEX idx_booking_room
ON booking(room_number);

--important for checking overlapping dates for a room
--checking if there is availability for a room in a given date range
--searching for bookings in a date range
CREATE INDEX idx_booking_dates
ON booking(start_date, end_date);