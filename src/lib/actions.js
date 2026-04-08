"use server"
import pool from "./db"

// room search
export async function searchRooms(filters) {
  let query = `
    SELECT r.hotel_id, r.number, r.price, r.capacity,
           r.can_be_extend as extendable, r.view_type, r.amenities,
           h.address as hotel_name, h.area, h.rating as category, h.rooms_num,
           hc.name as chain_name
    FROM room r
    JOIN hotel h ON r.hotel_id = h.hotel_id
    JOIN hotel_chain hc ON h.hotel_chain_name = hc.name
    WHERE 1=1
  `
  const params = []

  if (filters.checkIn && filters.checkOut) {
    params.push(filters.checkIn, filters.checkOut)
    query += ` AND NOT EXISTS (
      SELECT 1 FROM booking b
      WHERE b.hotel_id = r.hotel_id AND b.room_number = r.number
      AND b.start_date < $2 AND b.end_date > $1
    ) AND NOT EXISTS (
      SELECT 1 FROM renting rt
      WHERE rt.hotel_id = r.hotel_id AND rt.room_number = r.number
      AND rt.start_date < $2 AND rt.end_date > $1
    )`
  }
  if (filters.area) {
    params.push(filters.area)
    query += ` AND h.area = $${params.length}`
  }
  if (filters.capacity) {
    params.push(Number(filters.capacity))
    query += ` AND r.capacity >= $${params.length}`
  }
  if (filters.hotelChain) {
    params.push(filters.hotelChain)
    query += ` AND hc.name = $${params.length}`
  }
  if (filters.category) {
    params.push(Number(filters.category))
    query += ` AND h.rating = $${params.length}`
  }
  if (filters.totalRooms) {
    params.push(Number(filters.totalRooms))
    query += ` AND h.rooms_num >= $${params.length}`
  }
  if (filters.minPrice) {
    params.push(Number(filters.minPrice))
    query += ` AND r.price >= $${params.length}`
  }
  if (filters.maxPrice) {
    params.push(Number(filters.maxPrice))
    query += ` AND r.price <= $${params.length}`
  }

  const sortMap = {
    price: "r.price ASC",
    price_desc: "r.price DESC",
    rating: "h.rating DESC",
    capacity: "r.capacity ASC",
  }
  query += ` ORDER BY ${sortMap[filters.sortBy] || "r.price ASC"}`
  const result = await pool.query(query, params)
  return result.rows
}

// customers
export async function getCustomers() {
  const result = await pool.query("SELECT * FROM customer ORDER BY name")
  return result.rows
}

export async function createCustomer(data) {
  const result = await pool.query(
    "INSERT INTO customer (ssn, name, address) VALUES ($1, $2, $3) RETURNING *",
    [data.ssn, data.name, data.address]
  )
  return result.rows[0]
}

export async function updateCustomer(data) {
  const result = await pool.query(
    "UPDATE customer SET name=$1, address=$2 WHERE ssn=$3 RETURNING *",
    [data.name, data.address, data.ssn]
  )
  return result.rows[0]
}

export async function deleteCustomer(ssn) {
  await pool.query("DELETE FROM customer WHERE ssn=$1", [ssn])
}

// employees
export async function getEmployees() {
  const result = await pool.query(
    `SELECT e.*, h.address as hotel_address, h.hotel_chain_name
     FROM employee e JOIN hotel h ON e.hotel_id = h.hotel_id
     ORDER BY e.name`
  )
  return result.rows
}

export async function createEmployee(data) {
  const client = await pool.connect()
  try {
    await client.query("BEGIN")
    const result = await client.query(
      "INSERT INTO employee (ssn, hotel_id, name, address, roles) VALUES ($1, $2, $3, $4, $5) RETURNING *",
      [data.ssn, data.hotel_id, data.name, data.address, data.roles]
    )
    if (data.roles?.toLowerCase().includes("manager")) {
      await client.query(
        "INSERT INTO manager (hotel_id, e_ssn) VALUES ($1, $2)",
        [data.hotel_id, data.ssn]
      )
    }
    await client.query("COMMIT")
    return result.rows[0]
  } catch (e) {
    await client.query("ROLLBACK")
    throw e
  } finally {
    client.release()
  }
}

export async function updateEmployee(data) {
  const client = await pool.connect()
  try {
    await client.query("BEGIN")
    const result = await client.query(
      "UPDATE employee SET hotel_id=$1, name=$2, address=$3, roles=$4 WHERE ssn=$5 RETURNING *",
      [data.hotel_id, data.name, data.address, data.roles, data.ssn]
    )
    await client.query("DELETE FROM manager WHERE e_ssn=$1", [data.ssn])
    if (data.roles?.toLowerCase().includes("manager")) {
      await client.query(
        "INSERT INTO manager (hotel_id, e_ssn) VALUES ($1, $2)",
        [data.hotel_id, data.ssn]
      )
    }
    await client.query("COMMIT")
    return result.rows[0]
  } catch (e) {
    await client.query("ROLLBACK")
    throw e
  } finally {
    client.release()
  }
}

export async function deleteEmployee(ssn) {
  await pool.query("DELETE FROM employee WHERE ssn=$1", [ssn])
}

// hotels
export async function getHotels() {
  const result = await pool.query("SELECT * FROM hotel ORDER BY hotel_chain_name, address")
  return result.rows
}

export async function createHotel(data) {
  const result = await pool.query(
    `INSERT INTO hotel (hotel_chain_name, address, area, email, rooms_num, rating, phone_number)
     VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
    [data.hotel_chain_name, data.address, data.area, data.email, data.rooms_num, data.rating, data.phone_number]
  )
  return result.rows[0]
}

export async function updateHotel(data) {
  const result = await pool.query(
    `UPDATE hotel SET hotel_chain_name=$1, address=$2, area=$3, email=$4,
     rooms_num=$5, rating=$6, phone_number=$7 WHERE hotel_id=$8 RETURNING *`,
    [data.hotel_chain_name, data.address, data.area, data.email, data.rooms_num, data.rating, data.phone_number, data.hotel_id]
  )
  return result.rows[0]
}

export async function deleteHotel(id) {
  await pool.query("DELETE FROM hotel WHERE hotel_id=$1", [id])
}

// rooms
export async function getRooms(hotel_id) {
  const result = await pool.query(
    `SELECT r.*, h.address as hotel_address FROM room r
     JOIN hotel h ON r.hotel_id = h.hotel_id
     WHERE ($1::int IS NULL OR r.hotel_id = $1)
     ORDER BY r.hotel_id, r.number`,
    [hotel_id || null]
  )
  return result.rows
}

export async function createRoom(data) {
  const result = await pool.query(
    `INSERT INTO room (hotel_id, number, price, capacity, can_be_extend, view_type, amenities, damages)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`,
    [data.hotel_id, data.number, data.price, data.capacity, data.can_be_extend, data.view_type, data.amenities, data.damages]
  )
  return result.rows[0]
}

export async function updateRoom(data) {
  const result = await pool.query(
    `UPDATE room SET price=$1, capacity=$2, can_be_extend=$3, view_type=$4, amenities=$5, damages=$6
     WHERE hotel_id=$7 AND number=$8 RETURNING *`,
    [data.price, data.capacity, data.can_be_extend, data.view_type, data.amenities, data.damages, data.hotel_id, data.number]
  )
  return result.rows[0]
}

export async function deleteRoom(hotel_id, number) {
  await pool.query("DELETE FROM room WHERE hotel_id=$1 AND number=$2", [hotel_id, number])
}

// bookings
export async function getBookings() {
  const result = await pool.query(
    `SELECT b.*, c.name as customer_name, h.address as hotel_address
     FROM booking b
     JOIN customer c ON b.customer_ssn = c.ssn
     JOIN hotel h ON b.hotel_id = h.hotel_id
     ORDER BY b.start_date`
  )
  return result.rows
}

export async function deleteBooking(booking_id) {
  await pool.query("DELETE FROM booking WHERE booking_id=$1", [booking_id])
}

export async function createBooking(data) {
  // data: { customer_ssn, hotel_id, room_number, start_date, end_date }
  const result = await pool.query(
    "INSERT INTO booking (customer_ssn, hotel_id, room_number, start_date, end_date) VALUES ($1, $2, $3, $4, $5) RETURNING *",
    [data.customer_ssn, data.hotel_id, data.room_number, data.start_date, data.end_date]
  )
  return result.rows[0]
}

// rentings
export async function getRentings() {
  const result = await pool.query(
    `SELECT rt.*, c.name as customer_name, e.name as employee_name, h.address as hotel_address
     FROM renting rt
     JOIN customer c ON rt.customer_ssn = c.ssn
     LEFT JOIN employee e ON rt.e_ssn = e.ssn
     JOIN hotel h ON rt.hotel_id = h.hotel_id
     ORDER BY rt.start_date`
  )
  return result.rows
}

export async function createRenting(data) {
  // covers both walk-in and converting a booking
  const result = await pool.query(
    "INSERT INTO renting (customer_ssn, hotel_id, room_number, e_ssn, start_date, end_date) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
    [data.customer_ssn, data.hotel_id, data.room_number, data.e_ssn, data.start_date, data.end_date]
  )
  return result.rows[0]
}

// payments
export async function recordPayment(data) {
  const result = await pool.query(
    "INSERT INTO payment (renting_id, amount) VALUES ($1, $2) RETURNING *",
    [data.renting_id, data.amount]
  )
  return result.rows[0]
}

// future views
export async function getAvailableRoomsPerArea() {
  const result = await pool.query("SELECT * FROM available_rooms_per_area")
  return result.rows
}

export async function getHotelCapacity() {
  const result = await pool.query("SELECT * FROM hotel_aggregated_capacity")
  return result.rows
}

// helpers for dropdowns
export async function getHotelChains() {
  const result = await pool.query("SELECT name FROM hotel_chain ORDER BY name")
  return result.rows
}

export async function getEmployeesForDropdown(hotel_id) {
  const result = await pool.query(
    "SELECT ssn, name, roles FROM employee WHERE hotel_id=$1 ORDER BY name",
    [hotel_id]
  )
  return result.rows
}

