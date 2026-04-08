-- trigger to allow only one manager to be inserted per hotel
CREATE OR REPLACE FUNCTION single_manager()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM manager
        WHERE hotel_id = NEW.hotel_id
    ) THEN
        RAISE EXCEPTION 'Hotel % already has manager', NEW.hotel_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_single_manager
BEFORE INSERT ON manager
FOR EACH ROW
EXECUTE FUNCTION single_manager();

--Trigger to limit bookings to 3
CREATE OR REPLACE FUNCTION limit_customer_bookings()
RETURNS TRIGGER AS $$
DECLARE
    counter INT;
BEGIN
    SELECT COUNT(*)
    INTO counter
    FROM booking
    WHERE customer_ssn = NEW.customer_ssn;

    IF counter >= 3 THEN
        RAISE EXCEPTION 'Customer % already has 3 active bookings.',
            NEW.customer_ssn;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_limit_bookings
BEFORE INSERT ON booking
FOR EACH ROW
EXECUTE FUNCTION limit_customer_bookings();
