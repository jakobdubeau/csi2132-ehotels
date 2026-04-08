"use client"
import { useState, useEffect, Fragment } from "react"
import { Pencil, Trash2 } from "lucide-react"
import {
  getCustomers, createCustomer, updateCustomer, deleteCustomer,
  getEmployees, createEmployee, updateEmployee, deleteEmployee,
  getHotels, createHotel, updateHotel, deleteHotel, getHotelChains,
  getRooms, createRoom, updateRoom, deleteRoom,
} from "../../lib/actions"

const AREAS = ["Downtown", "Suburbs", "Beachfront", "Airport", "Mountain", "Countryside"]
const VIEW_TYPES = ["sea_view", "mountain_view"]
const TABS = ["Customers", "Employees", "Hotels", "Rooms"]
const inputCls = "w-full px-3 py-2 border border-gray-200 rounded-xl text-sm focus:outline-none focus:border-blue-300 disabled:bg-gray-100 disabled:text-gray-400"
const labelCls = "block text-xs font-semibold text-gray-500 mb-1"
const headerCls = "pb-3 font-medium text-gray-400 text-left"
const cellCls = "py-3"

function RowActions({ onEdit, onDelete }) {
  return (
    <td className={cellCls}>
      <div className="flex gap-1 justify-end">
        <button onClick={onEdit} className="p-1.5 text-gray-400 hover:text-blue-400 cursor-pointer transition-colors"><Pencil size={17} /></button>
        <button onClick={onDelete} className="p-1.5 text-gray-400 hover:text-red-400 cursor-pointer transition-colors"><Trash2 size={17} /></button>
      </div>
    </td>
  )
}

function FormButtons({ editing, onCancel }) {
  return (
    <div className="col-span-full flex gap-2 pt-1">
      <button type="submit" className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">
        {editing ? "Save" : "Add"}
      </button>
      <button type="button" onClick={onCancel} className="px-4 py-2 bg-gray-100 text-gray-600 rounded-xl text-sm hover:bg-gray-200 cursor-pointer">
        Cancel
      </button>
    </div>
  )
}

function CustomersTab() {
  const blank = { ssn: "", name: "", address: "" }
  const [rows, setRows] = useState([])
  const [form, setForm] = useState(blank)
  const [editing, setEditing] = useState(null)
  const [show, setShow] = useState(false)
  const s = (k, v) => setForm(p => ({ ...p, [k]: v }))
  const load = () => getCustomers().then(setRows)
  useEffect(() => { load() }, [])

  function startEdit(r) { setForm({ ssn: r.ssn, name: r.name, address: r.address }); setEditing(r.ssn) }
  function cancel() { setShow(false); setEditing(null); setForm(blank) }

  async function submit(e) {
    e.preventDefault()
    if (editing) await updateCustomer(form); else await createCustomer(form)
    load(); cancel()
  }

  async function del(ssn) {
    if (!confirm("Delete this customer?")) return
    await deleteCustomer(ssn); load()
  }

  return (
    <div>
      <table className="w-full text-sm border-collapse mb-6">
        <thead><tr className="border-b border-gray-100">
          <th className={headerCls}>SSN</th><th className={headerCls}>Name</th><th className={headerCls}>Address</th><th className={headerCls}>Registered</th><th />
        </tr></thead>
        <tbody>
          {rows.map(r => (
            <Fragment key={r.ssn}>
              <tr className="border-b border-gray-50">
                <td className={`${cellCls} text-gray-400`}>{r.ssn}</td>
                <td className={cellCls}>{r.name}</td>
                <td className={`${cellCls} text-gray-500`}>{r.address}</td>
                <td className={`${cellCls} text-gray-500`}>{r.registration_date ? new Date(r.registration_date).toISOString().slice(0,10) : "—"}</td>
                <RowActions onEdit={() => startEdit(r)} onDelete={() => del(r.ssn)} />
              </tr>
              {editing === r.ssn && (
                <tr className="bg-gray-50/50"><td colSpan={5} className="px-2 py-3">
                  <form onSubmit={submit} className="grid grid-cols-3 gap-3">
                    <div><label className={labelCls}>SSN</label><input required value={form.ssn} disabled className={inputCls} /></div>
                    <div><label className={labelCls}>Name</label><input required value={form.name} onChange={e => s("name", e.target.value)} className={inputCls} /></div>
                    <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
                    <FormButtons editing={editing} onCancel={cancel} />
                  </form>
                </td></tr>
              )}
            </Fragment>
          ))}
          {!rows.length && <tr><td colSpan={5} className="py-8 text-center text-gray-400">No customers.</td></tr>}
        </tbody>
      </table>
      {!show
        ? <button onClick={() => { setForm(blank); setEditing(null); setShow(true) }} className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">Add Customer</button>
        : <form onSubmit={submit} className="grid grid-cols-3 gap-4 max-w-2xl">
            <div><label className={labelCls}>SSN</label><input required value={form.ssn} onChange={e => s("ssn", e.target.value)} disabled={!!editing} className={inputCls} placeholder="123-45-6789" /></div>
            <div><label className={labelCls}>Name</label><input required value={form.name} onChange={e => s("name", e.target.value)} className={inputCls} /></div>
            <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
            <FormButtons editing={editing} onCancel={cancel} />
          </form>
      }
    </div>
  )
}

function EmployeesTab() {
  const blank = { ssn: "", name: "", address: "", hotel_id: "", roles: "" }
  const [rows, setRows] = useState([])
  const [hotels, setHotels] = useState([])
  const [form, setForm] = useState(blank)
  const [editing, setEditing] = useState(null)
  const [show, setShow] = useState(false)
  const s = (k, v) => setForm(p => ({ ...p, [k]: v }))
  const load = () => getEmployees().then(setRows)
  useEffect(() => { load(); getHotels().then(setHotels) }, [])

  function startEdit(r) {
    setForm({ ssn: r.ssn, name: r.name, address: r.address, hotel_id: String(r.hotel_id), roles: Array.isArray(r.roles) ? r.roles.join(", ") : String(r.roles || "").replace(/^\{|\}$/g, "") })
    setEditing(r.ssn)
  }
  function cancel() { setShow(false); setEditing(null); setForm(blank) }

  async function submit(e) {
    e.preventDefault()
    const data = { ...form, hotel_id: Number(form.hotel_id), roles: form.roles.split(",").map(r => r.trim()).filter(Boolean) }
    if (editing) await updateEmployee(data); else await createEmployee(data)
    load(); cancel()
  }

  async function del(ssn) {
    if (!confirm("Delete this employee?")) return
    await deleteEmployee(ssn); load()
  }

  return (
    <div>
      <table className="w-full text-sm border-collapse mb-6">
        <thead><tr className="border-b border-gray-100">
          <th className={headerCls}>SSN</th><th className={headerCls}>Name</th><th className={headerCls}>Address</th><th className={headerCls}>Hotel ID</th><th className={headerCls}>Roles</th><th />
        </tr></thead>
        <tbody>
          {rows.map(r => (
            <Fragment key={r.ssn}>
              <tr className="border-b border-gray-50">
                <td className={`${cellCls} text-gray-400`}>{r.ssn}</td>
                <td className={cellCls}>{r.name}</td>
                <td className={`${cellCls} text-gray-500`}>{r.address}</td>
                <td className={`${cellCls} text-gray-500`}>{r.hotel_id}</td>
                <td className={`${cellCls} text-gray-500`}>{Array.isArray(r.roles) ? r.roles.join(", ") : String(r.roles || "").replace(/^\{|\}$/g, "")}</td>
                <RowActions onEdit={() => startEdit(r)} onDelete={() => del(r.ssn)} />
              </tr>
              {editing === r.ssn && (
                <tr className="bg-gray-50/50"><td colSpan={6} className="px-2 py-3">
                  <form onSubmit={submit} className="grid grid-cols-3 gap-3">
                    <div><label className={labelCls}>SSN</label><input required value={form.ssn} disabled className={inputCls} /></div>
                    <div><label className={labelCls}>Name</label><input required value={form.name} onChange={e => s("name", e.target.value)} className={inputCls} /></div>
                    <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
                    <div>
                      <label className={labelCls}>Hotel</label>
                      <select required value={form.hotel_id} onChange={e => s("hotel_id", e.target.value)} className={inputCls}>
                        <option value="">Select hotel...</option>
                        {hotels.map(h => <option key={h.hotel_id} value={h.hotel_id}>{h.address}</option>)}
                      </select>
                    </div>
                    <div><label className={labelCls}>Roles (comma-separated)</label><input value={form.roles} onChange={e => s("roles", e.target.value)} className={inputCls} placeholder="Manager, Receptionist" /></div>
                    <FormButtons editing={editing} onCancel={cancel} />
                  </form>
                </td></tr>
              )}
            </Fragment>
          ))}
          {!rows.length && <tr><td colSpan={6} className="py-8 text-center text-gray-400">No employees.</td></tr>}
        </tbody>
      </table>
      {!show
        ? <button onClick={() => { setForm(blank); setEditing(null); setShow(true) }} className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">Add Employee</button>
        : <form onSubmit={submit} className="grid grid-cols-3 gap-4 max-w-3xl">
            <div><label className={labelCls}>SSN</label><input required value={form.ssn} onChange={e => s("ssn", e.target.value)} disabled={!!editing} className={inputCls} /></div>
            <div><label className={labelCls}>Name</label><input required value={form.name} onChange={e => s("name", e.target.value)} className={inputCls} /></div>
            <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
            <div>
              <label className={labelCls}>Hotel</label>
              <select required value={form.hotel_id} onChange={e => s("hotel_id", e.target.value)} className={inputCls}>
                <option value="">Select hotel...</option>
                {hotels.map(h => <option key={h.hotel_id} value={h.hotel_id}>{h.address}</option>)}
              </select>
            </div>
            <div><label className={labelCls}>Roles (comma-separated)</label><input value={form.roles} onChange={e => s("roles", e.target.value)} className={inputCls} placeholder="Manager, Receptionist" /></div>
            <FormButtons editing={editing} onCancel={cancel} />
          </form>
      }
    </div>
  )
}

function HotelsTab() {
  const blank = { hotel_chain_name: "", address: "", area: "", email: "", rooms_num: "", rating: "", phone_number: "" }
  const [rows, setRows] = useState([])
  const [chains, setChains] = useState([])
  const [form, setForm] = useState(blank)
  const [editing, setEditing] = useState(null)
  const [show, setShow] = useState(false)
  const s = (k, v) => setForm(p => ({ ...p, [k]: v }))
  const load = () => getHotels().then(setRows)
  useEffect(() => { load(); getHotelChains().then(setChains) }, [])

  function startEdit(r) {
    setForm({ hotel_chain_name: r.hotel_chain_name, address: r.address, area: r.area, email: r.email || "", rooms_num: String(r.rooms_num), rating: String(r.rating), phone_number: r.phone_number || "" })
    setEditing(r.hotel_id)
  }
  function cancel() { setShow(false); setEditing(null); setForm(blank) }

  async function submit(e) {
    e.preventDefault()
    const data = { ...form, rooms_num: Number(form.rooms_num), rating: Number(form.rating) }
    if (editing) await updateHotel({ ...data, hotel_id: editing }); else await createHotel(data)
    load(); cancel()
  }

  async function del(id) {
    if (!confirm("Delete this hotel?")) return
    await deleteHotel(id); load()
  }

  return (
    <div>
      <table className="w-full text-sm border-collapse mb-6">
        <thead><tr className="border-b border-gray-100">
          <th className={headerCls}>ID</th><th className={headerCls}>Chain</th><th className={headerCls}>Address</th><th className={headerCls}>Area</th><th className={headerCls}>Rating</th><th className={headerCls}>Rooms</th><th className={headerCls}>Email</th><th className={headerCls}>Phone</th><th />
        </tr></thead>
        <tbody>
          {rows.map(r => (
            <Fragment key={r.hotel_id}>
              <tr className="border-b border-gray-50">
                <td className={`${cellCls} text-gray-400`}>{r.hotel_id}</td>
                <td className={`${cellCls} text-gray-500`}>{r.hotel_chain_name}</td>
                <td className={cellCls}>{r.address}</td>
                <td className={`${cellCls} text-gray-500`}>{r.area}</td>
                <td className={`${cellCls} text-gray-500`}>{r.rating}★</td>
                <td className={`${cellCls} text-gray-500`}>{r.rooms_num}</td>
                <td className={`${cellCls} text-gray-500`}>{r.email || "—"}</td>
                <td className={`${cellCls} text-gray-500`}>{r.phone_number || "—"}</td>
                <RowActions onEdit={() => startEdit(r)} onDelete={() => del(r.hotel_id)} />
              </tr>
              {editing === r.hotel_id && (
                <tr className="bg-gray-50/50"><td colSpan={9} className="px-2 py-3">
                  <form onSubmit={submit} className="grid grid-cols-3 gap-3">
                    <div>
                      <label className={labelCls}>Chain</label>
                      <select required value={form.hotel_chain_name} onChange={e => s("hotel_chain_name", e.target.value)} className={inputCls}>
                        <option value="">Select chain...</option>
                        {chains.map(c => <option key={c.name} value={c.name}>{c.name}</option>)}
                      </select>
                    </div>
                    <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
                    <div>
                      <label className={labelCls}>Area</label>
                      <select required value={form.area} onChange={e => s("area", e.target.value)} className={inputCls}>
                        <option value="">Select area...</option>
                        {AREAS.map(a => <option key={a} value={a}>{a}</option>)}
                      </select>
                    </div>
                    <div><label className={labelCls}>Email</label><input type="email" value={form.email} onChange={e => s("email", e.target.value)} className={inputCls} /></div>
                    <div><label className={labelCls}>Phone</label><input value={form.phone_number} onChange={e => s("phone_number", e.target.value)} className={inputCls} /></div>
                    <div><label className={labelCls}>Rooms</label><input required type="number" min="1" value={form.rooms_num} onChange={e => s("rooms_num", e.target.value)} className={inputCls} /></div>
                    <div>
                      <label className={labelCls}>Rating</label>
                      <select required value={form.rating} onChange={e => s("rating", e.target.value)} className={inputCls}>
                        <option value="">Select...</option>
                        {[1,2,3,4,5].map(n => <option key={n} value={n}>{n}★</option>)}
                      </select>
                    </div>
                    <FormButtons editing={editing} onCancel={cancel} />
                  </form>
                </td></tr>
              )}
            </Fragment>
          ))}
          {!rows.length && <tr><td colSpan={9} className="py-8 text-center text-gray-400">No hotels.</td></tr>}
        </tbody>
      </table>
      {!show
        ? <button onClick={() => { setForm(blank); setEditing(null); setShow(true) }} className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">Add Hotel</button>
        : <form onSubmit={submit} className="grid grid-cols-3 gap-4 max-w-3xl">
            <div>
              <label className={labelCls}>Chain</label>
              <select required value={form.hotel_chain_name} onChange={e => s("hotel_chain_name", e.target.value)} className={inputCls}>
                <option value="">Select chain...</option>
                {chains.map(c => <option key={c.name} value={c.name}>{c.name}</option>)}
              </select>
            </div>
            <div><label className={labelCls}>Address</label><input required value={form.address} onChange={e => s("address", e.target.value)} className={inputCls} /></div>
            <div>
              <label className={labelCls}>Area</label>
              <select required value={form.area} onChange={e => s("area", e.target.value)} className={inputCls}>
                <option value="">Select area...</option>
                {AREAS.map(a => <option key={a} value={a}>{a}</option>)}
              </select>
            </div>
            <div><label className={labelCls}>Email</label><input type="email" value={form.email} onChange={e => s("email", e.target.value)} className={inputCls} /></div>
            <div><label className={labelCls}>Phone</label><input value={form.phone_number} onChange={e => s("phone_number", e.target.value)} className={inputCls} /></div>
            <div><label className={labelCls}>Rooms</label><input required type="number" min="1" value={form.rooms_num} onChange={e => s("rooms_num", e.target.value)} className={inputCls} /></div>
            <div>
              <label className={labelCls}>Rating</label>
              <select required value={form.rating} onChange={e => s("rating", e.target.value)} className={inputCls}>
                <option value="">Select...</option>
                {[1,2,3,4,5].map(n => <option key={n} value={n}>{n}★</option>)}
              </select>
            </div>
            <FormButtons editing={editing} onCancel={cancel} />
          </form>
      }
    </div>
  )
}

function RoomsTab() {
  const blank = { hotel_id: "", number: "", price: "", capacity: "", can_be_extend: "false", view_type: "", amenities: "", damages: "" }
  const [rows, setRows] = useState([])
  const [hotels, setHotels] = useState([])
  const [form, setForm] = useState(blank)
  const [editing, setEditing] = useState(null)
  const [show, setShow] = useState(false)
  const s = (k, v) => setForm(p => ({ ...p, [k]: v }))
  const load = () => getRooms().then(setRows)
  useEffect(() => { load(); getHotels().then(setHotels) }, [])

  function startEdit(r) {
    setForm({
      hotel_id: String(r.hotel_id), number: String(r.number), price: String(r.price),
      capacity: String(r.capacity), can_be_extend: String(r.can_be_extend),
      view_type: r.view_type || "", amenities: Array.isArray(r.amenities) ? r.amenities.join(", ") : String(r.amenities || "").replace(/^\{|\}$/g, ""), damages: r.damages || "",
    })
    setEditing(`${r.hotel_id}-${r.number}`)
  }
  function cancel() { setShow(false); setEditing(null); setForm(blank) }

  async function submit(e) {
    e.preventDefault()
    const data = {
      ...form,
      hotel_id: Number(form.hotel_id), number: Number(form.number),
      price: Number(form.price), capacity: Number(form.capacity),
      can_be_extend: form.can_be_extend === "true",
      amenities: form.amenities.split(",").map(a => a.trim()).filter(Boolean),
    }
    if (editing) await updateRoom(data); else await createRoom(data)
    load(); cancel()
  }

  async function del(hotel_id, number) {
    if (!confirm("Delete this room?")) return
    await deleteRoom(hotel_id, number); load()
  }

  return (
    <div>
      <table className="w-full text-sm border-collapse mb-6">
        <thead><tr className="border-b border-gray-100">
          <th className={headerCls}>Hotel ID</th><th className={headerCls}>Hotel</th><th className={headerCls}>Room</th><th className={headerCls}>Price</th><th className={headerCls}>Capacity</th><th className={headerCls}>View</th><th className={headerCls}>Extendable</th><th className={headerCls}>Amenities</th><th className={headerCls}>Damages</th><th />
        </tr></thead>
        <tbody>
          {rows.map(r => (
            <Fragment key={`${r.hotel_id}-${r.number}`}>
              <tr className="border-b border-gray-50">
                <td className={`${cellCls} text-gray-400`}>{r.hotel_id}</td>
                <td className={`${cellCls} text-gray-500`}>{r.hotel_address}</td>
                <td className={cellCls}>{r.number}</td>
                <td className={`${cellCls} text-gray-500`}>${r.price}</td>
                <td className={`${cellCls} text-gray-500`}>{r.capacity}</td>
                <td className={`${cellCls} text-gray-500`}>{r.view_type ? r.view_type.replace("_", " ") : "—"}</td>
                <td className={`${cellCls} text-gray-500`}>{r.can_be_extend ? "Yes" : "No"}</td>
                <td className={`${cellCls} text-gray-500`}>{(Array.isArray(r.amenities) ? r.amenities.join(", ") : String(r.amenities || "").replace(/^\{|\}$/g, "")) || "—"}</td>
                <td className={`${cellCls} text-gray-500`}>{r.damages || "—"}</td>
                <RowActions onEdit={() => startEdit(r)} onDelete={() => del(r.hotel_id, r.number)} />
              </tr>
              {editing === `${r.hotel_id}-${r.number}` && (
                <tr className="bg-gray-50/50"><td colSpan={10} className="px-2 py-3">
                  <form onSubmit={submit} className="grid grid-cols-3 gap-3">
                    <div>
                      <label className={labelCls}>Hotel</label>
                      <select required value={form.hotel_id} disabled className={inputCls}>
                        <option value="">Select hotel...</option>
                        {hotels.map(h => <option key={h.hotel_id} value={h.hotel_id}>{h.address}</option>)}
                      </select>
                    </div>
                    <div><label className={labelCls}>Room Number</label><input required type="number" value={form.number} disabled className={inputCls} /></div>
                    <div><label className={labelCls}>Price ($/night)</label><input required type="number" min="0" step="0.01" value={form.price} onChange={e => s("price", e.target.value)} className={inputCls} /></div>
                    <div><label className={labelCls}>Capacity</label><input required type="number" min="1" value={form.capacity} onChange={e => s("capacity", e.target.value)} className={inputCls} /></div>
                    <div>
                      <label className={labelCls}>Extendable</label>
                      <select value={form.can_be_extend} onChange={e => s("can_be_extend", e.target.value)} className={inputCls}>
                        <option value="true">Yes</option>
                        <option value="false">No</option>
                      </select>
                    </div>
                    <div>
                      <label className={labelCls}>View Type</label>
                      <select value={form.view_type} onChange={e => s("view_type", e.target.value)} className={inputCls}>
                        <option value="">None</option>
                        {VIEW_TYPES.map(v => <option key={v} value={v}>{v.replace("_", " ")}</option>)}
                      </select>
                    </div>
                    <div><label className={labelCls}>Amenities (comma-separated)</label><input value={form.amenities} onChange={e => s("amenities", e.target.value)} className={inputCls} placeholder="WiFi, TV, Minibar" /></div>
                    <div><label className={labelCls}>Damages</label><input value={form.damages} onChange={e => s("damages", e.target.value)} className={inputCls} /></div>
                    <FormButtons editing={editing} onCancel={cancel} />
                  </form>
                </td></tr>
              )}
            </Fragment>
          ))}
          {!rows.length && <tr><td colSpan={10} className="py-8 text-center text-gray-400">No rooms.</td></tr>}
        </tbody>
      </table>
      {!show
        ? <button onClick={() => { setForm(blank); setEditing(null); setShow(true) }} className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm hover:bg-blue-300 cursor-pointer">Add Room</button>
        : <form onSubmit={submit} className="grid grid-cols-3 gap-4 max-w-3xl">
            <div>
              <label className={labelCls}>Hotel</label>
              <select required value={form.hotel_id} onChange={e => s("hotel_id", e.target.value)} disabled={!!editing} className={inputCls}>
                <option value="">Select hotel...</option>
                {hotels.map(h => <option key={h.hotel_id} value={h.hotel_id}>{h.address}</option>)}
              </select>
            </div>
            <div><label className={labelCls}>Room Number</label><input required type="number" value={form.number} onChange={e => s("number", e.target.value)} disabled={!!editing} className={inputCls} /></div>
            <div><label className={labelCls}>Price ($/night)</label><input required type="number" min="0" step="0.01" value={form.price} onChange={e => s("price", e.target.value)} className={inputCls} /></div>
            <div><label className={labelCls}>Capacity</label><input required type="number" min="1" value={form.capacity} onChange={e => s("capacity", e.target.value)} className={inputCls} /></div>
            <div>
              <label className={labelCls}>Extendable</label>
              <select value={form.can_be_extend} onChange={e => s("can_be_extend", e.target.value)} className={inputCls}>
                <option value="true">Yes</option>
                <option value="false">No</option>
              </select>
            </div>
            <div>
              <label className={labelCls}>View Type</label>
              <select value={form.view_type} onChange={e => s("view_type", e.target.value)} className={inputCls}>
                <option value="">None</option>
                {VIEW_TYPES.map(v => <option key={v} value={v}>{v.replace("_", " ")}</option>)}
              </select>
            </div>
            <div><label className={labelCls}>Amenities (comma-separated)</label><input value={form.amenities} onChange={e => s("amenities", e.target.value)} className={inputCls} placeholder="WiFi, TV, Minibar" /></div>
            <div><label className={labelCls}>Damages</label><input value={form.damages} onChange={e => s("damages", e.target.value)} className={inputCls} /></div>
            <FormButtons editing={editing} onCancel={cancel} />
          </form>
      }
    </div>
  )
}

export default function Insert() {
  const [tab, setTab] = useState("Customers")
  return (
    <div className="flex-1 px-16 md:px-30 py-8">
      <h1 className="text-3xl font-bold mb-6">Manage Data</h1>
      <div className="flex gap-2 mb-8">
        {TABS.map(t => (
          <button key={t} onClick={() => setTab(t)}
            className={`px-5 py-2 rounded-xl text-sm font-medium cursor-pointer ${
              tab === t ? "bg-blue-300 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"
            }`}>
            {t}
          </button>
        ))}
      </div>
      {tab === "Customers" && <CustomersTab />}
      {tab === "Employees" && <EmployeesTab />}
      {tab === "Hotels" && <HotelsTab />}
      {tab === "Rooms" && <RoomsTab />}
    </div>
  )
}
