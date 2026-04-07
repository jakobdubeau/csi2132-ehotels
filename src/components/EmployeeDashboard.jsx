"use client"
import { useEffect, useState } from "react"
import { useRole } from "../context/RoleContext"
import {
  getBookings, getRentings, getCustomers, getHotels, getRooms,
  createRenting, deleteBooking, recordPayment
} from "../lib/actions"

const TABS = ["Bookings", "Rentings", "Payments"]
const fmt = d => d ? new Date(d).toISOString().slice(0, 10) : ""

export default function EmployeeDashboard() {
  const { person } = useRole()
  const [tab, setTab] = useState("Bookings")
  const [bookings, setBookings] = useState([])
  const [rentings, setRentings] = useState([])
  const [customers, setCustomers] = useState([])
  const [hotels, setHotels] = useState([])
  const [rooms, setRooms] = useState([])
  const [msg, setMsg] = useState("")

  // direct renting form state
  const [form, setForm] = useState({ customer_ssn: "", hotel_id: "", room_number: "", start_date: "", end_date: "" })
  const [showForm, setShowForm] = useState(false)

  // payment form state
  const [payment, setPayment] = useState({ renting_id: "", amount: "" })

  useEffect(() => {
    getBookings().then(setBookings)
    getRentings().then(setRentings)
    getCustomers().then(setCustomers)
    getHotels().then(setHotels)
  }, [])

  useEffect(() => {
    if (form.hotel_id) getRooms(Number(form.hotel_id)).then(setRooms)
    else setRooms([])
  }, [form.hotel_id])

  async function handleCheckIn(booking) {
    if (!person) return setMsg("Select an employee first.")
    try {
      await createRenting({
        customer_ssn: booking.customer_ssn,
        hotel_id: booking.hotel_id,
        room_number: booking.room_number,
        e_ssn: person.ssn,
        start_date: booking.start_date,
        end_date: booking.end_date,
      })
      await deleteBooking(booking.booking_id)
      const [b, r] = await Promise.all([getBookings(), getRentings()])
      setBookings(b)
      setRentings(r)
      setMsg("Checked in successfully.")
    } catch (e) {
      setMsg(e.message ?? "Check in failed.")
    }
  }

  async function handleDirectRenting(e) {
    e.preventDefault()
    if (!person) return setMsg("Select an employee first.")
    try {
      await createRenting({ ...form, e_ssn: person.ssn, hotel_id: Number(form.hotel_id), room_number: Number(form.room_number) })
      setRentings(await getRentings())
      setForm({ customer_ssn: "", hotel_id: "", room_number: "", start_date: "", end_date: "" })
      setShowForm(false)
      setMsg("Renting created.")
    } catch (e) {
      setMsg(e.message ?? "Failed to create renting.")
    }
  }

  async function handlePayment(e) {
    e.preventDefault()
    try {
      await recordPayment({ renting_id: Number(payment.renting_id), amount: Number(payment.amount) })
      setPayment({ renting_id: "", amount: "" })
      setMsg("Payment recorded.")
    } catch {
      setMsg("Failed to record payment.")
    }
  }

  const inputCls = "w-full px-3 py-2 border border-gray-200 rounded-xl text-sm focus:outline-none focus:border-blue-300"
  const labelCls = "block text-xs font-semibold text-gray-500 mb-1"

  return (
    <div className="flex-1 px-16 md:px-30 py-8">
      <h1 className="text-3xl font-bold mb-6">Employee Dashboard</h1>

      <div className="flex gap-2 mb-8">
        {TABS.map(t => (
          <button key={t} onClick={() => { setTab(t); setMsg("") }}
            className={`px-5 py-2 rounded-xl text-sm font-medium cursor-pointer ${
              tab === t ? "bg-blue-300 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"
            }`}>
            {t}
          </button>
        ))}
      </div>

      {msg && <p className="mb-4 text-sm text-blue-500">{msg}</p>}

      {tab === "Bookings" && (
        <div>
          <table className="w-full text-sm border-collapse">
            <thead>
              <tr className="text-left text-gray-400 border-b border-gray-100">
                <th className="pb-3 font-medium">ID</th>
                <th className="pb-3 font-medium">Customer</th>
                <th className="pb-3 font-medium">Hotel</th>
                <th className="pb-3 font-medium">Room</th>
                <th className="pb-3 font-medium">Dates</th>
                <th className="pb-3 font-medium"></th>
              </tr>
            </thead>
            <tbody>
              {bookings.map(b => (
                <tr key={b.booking_id} className="border-b border-gray-50">
                  <td className="py-3 text-gray-400">#{b.booking_id}</td>
                  <td className="py-3">{b.customer_name}</td>
                  <td className="py-3 text-gray-500">{b.hotel_address}</td>
                  <td className="py-3 text-gray-500">Room {b.room_number}</td>
                  <td className="py-3 text-gray-500">{fmt(b.start_date)} - {fmt(b.end_date)}</td>
                  <td className="py-3">
                    <button
                      onClick={() => handleCheckIn(b)}
                      className="px-3 py-1 bg-blue-400 text-white rounded-lg text-xs hover:bg-blue-300 cursor-pointer"
                    >
                      Check In
                    </button>
                  </td>
                </tr>
              ))}
              {bookings.length === 0 && <tr><td colSpan={6} className="py-8 text-center text-gray-400">No bookings.</td></tr>}
            </tbody>
          </table>
        </div>
      )}

      {tab === "Rentings" && (
        <div>
          <table className="w-full text-sm border-collapse mb-6">
            <thead>
              <tr className="text-left text-gray-400 border-b border-gray-100">
                <th className="pb-3 font-medium">ID</th>
                <th className="pb-3 font-medium">Customer</th>
                <th className="pb-3 font-medium">Employee</th>
                <th className="pb-3 font-medium">Hotel</th>
                <th className="pb-3 font-medium">Room</th>
                <th className="pb-3 font-medium">Dates</th>
              </tr>
            </thead>
            <tbody>
              {rentings.map(r => (
                <tr key={r.renting_id} className="border-b border-gray-50">
                  <td className="py-3 text-gray-400">#{r.renting_id}</td>
                  <td className="py-3">{r.customer_name}</td>
                  <td className="py-3 text-gray-500">{r.employee_name}</td>
                  <td className="py-3 text-gray-500">{r.hotel_address}</td>
                  <td className="py-3 text-gray-500">Room {r.room_number}</td>
                  <td className="py-3 text-gray-500">{fmt(r.start_date)} - {fmt(r.end_date)}</td>
                </tr>
              ))}
              {rentings.length === 0 && <tr><td colSpan={6} className="py-8 text-center text-gray-400">No rentings.</td></tr>}
            </tbody>
          </table>

          <div className="relative inline-block">
            <button
              onClick={() => setShowForm(f => !f)}
              className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer"
            >
              {showForm ? "Cancel" : "Direct Renting"}
            </button>

            {showForm && (
            <form onSubmit={handleDirectRenting} className="absolute bottom-full left-0 mb-2 z-50 grid grid-cols-2 gap-4 w-96 bg-white rounded-2xl shadow-xl border border-gray-100 p-5">
              <div>
                <label className={labelCls}>Customer</label>
                <select required value={form.customer_ssn} onChange={e => setForm(p => ({ ...p, customer_ssn: e.target.value }))} className={inputCls}>
                  <option value="">Select...</option>
                  {customers.map(c => <option key={c.ssn} value={c.ssn}>{c.name}</option>)}
                </select>
              </div>
              <div>
                <label className={labelCls}>Hotel</label>
                <select required value={form.hotel_id} onChange={e => setForm(p => ({ ...p, hotel_id: e.target.value, room_number: "" }))} className={inputCls}>
                  <option value="">Select...</option>
                  {hotels.map(h => <option key={h.hotel_id} value={h.hotel_id}>{h.address}</option>)}
                </select>
              </div>
              <div>
                <label className={labelCls}>Room</label>
                <select required value={form.room_number} onChange={e => setForm(p => ({ ...p, room_number: e.target.value }))} className={inputCls}>
                  <option value="">Select...</option>
                  {rooms.map(r => <option key={r.number} value={r.number}>Room {r.number} — ${r.price}/night</option>)}
                </select>
              </div>
              <div />
              <div>
                <label className={labelCls}>Start Date</label>
                <input required type="date" value={form.start_date} onChange={e => setForm(p => ({ ...p, start_date: e.target.value }))} className={inputCls} />
              </div>
              <div>
                <label className={labelCls}>End Date</label>
                <input required type="date" value={form.end_date} onChange={e => setForm(p => ({ ...p, end_date: e.target.value }))} className={inputCls} />
              </div>
              <div className="col-span-2">
                <button type="submit" className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">
                  Create Renting
                </button>
              </div>
            </form>
            )}
          </div>
        </div>
      )}

      {tab === "Payments" && (
        <form onSubmit={handlePayment} className="flex flex-col gap-4 max-w-sm">
          <div>
            <label className={labelCls}>Renting</label>
            <select required value={payment.renting_id} onChange={e => setPayment(p => ({ ...p, renting_id: e.target.value }))} className={inputCls}>
              <option value="">Select renting...</option>
              {rentings.map(r => (
                <option key={r.renting_id} value={r.renting_id}>
                  #{r.renting_id} — {r.customer_name} ({fmt(r.start_date)} → {fmt(r.end_date)})
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className={labelCls}>Amount ($)</label>
            <input required type="number" min="0.01" step="0.01" placeholder="0.00"
              value={payment.amount} onChange={e => setPayment(p => ({ ...p, amount: e.target.value }))} className={inputCls} />
          </div>
          <button type="submit" className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer w-fit">
            Record Payment
          </button>
        </form>
      )}
    </div>
  )
}
