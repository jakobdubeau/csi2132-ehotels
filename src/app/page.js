"use client"
import Image from "next/image"
import { useState } from "react"
import SearchBar from "../components/SearchBar"
import EmployeeDashboard from "../components/EmployeeDashboard"
import { searchRooms, createBooking } from "../lib/actions"
import { useRole } from "../context/RoleContext"

export default function Home() {
  const { isEmployee, person } = useRole()
  const [rooms, setRooms] = useState(null)
  const [filters, setFilters] = useState({})
  const [booked, setBooked] = useState({})

  async function handleSearch(filters) {
    setFilters(filters)
    const results = await searchRooms(filters)
    setRooms(results)
    setBooked({})
  }

  async function handleBook(room) {
    const key = `${room.hotel_id}-${room.number}`
    try {
      await createBooking({
        customer_ssn: person.ssn,
        hotel_id: room.hotel_id,
        room_number: room.number,
        start_date: filters.checkIn,
        end_date: filters.checkOut,
      })
      setBooked(prev => ({ ...prev, [key]: "success" }))
    } catch {
      setBooked(prev => ({ ...prev, [key]: "error" }))
    }
  }

  if (isEmployee) return <EmployeeDashboard />

  return (
    <div className="flex flex-col flex-1 items-center bg-white">
        <div className="relative">
          <Image
            src="/hotel3.png"
            alt="Hotel"
            width={1300}
            height={1}
            className="rounded-3xl"
          />
          <div className="absolute inset-0 flex ml-8 mt-8">
            <h2 className="text-white text-6xl font-bold">
              Enjoy your Dream Vacation
            </h2>
          </div>
          <div className="absolute bottom-12 left-0 right-0">
            <SearchBar onSearch={handleSearch} hasResults={rooms !== null} />
          </div>
        </div>

        {rooms && rooms.length === 0 && (
          <p className="text-center text-gray-400 pt-16">No rooms found.</p>
        )}

        {rooms && rooms.length > 0 && (
          <div className="max-w-6xl mx-auto px-4 pt-16 pb-20">
            <h3 className="text-2xl font-bold mb-6">{rooms.length} room{rooms.length !== 1 && "s"} found</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
              {rooms.map(room => (
                <div key={`${room.hotel_id}-${room.number}`} className="border border-gray-200 rounded-2xl p-5 flex flex-col">
                  <div className="flex justify-between items-start mb-3">
                    <div>
                      <p className="font-bold text-lg">{room.hotel_name}</p>
                      <p className="text-sm text-gray-500">{room.chain_name}</p>
                    </div>
                    <span className="text-sm text-gray-500">{room.category}&#9733;</span>
                  </div>
                  <div className="grid grid-cols-2 gap-2 text-sm text-gray-600 mb-4">
                    <p>Area: {room.area}</p>
                    <p>Capacity: {room.capacity}</p>
                    <p>View: {room.view_type ? room.view_type.replace("_", " ") : "N/A"}</p>
                    <p>Extendable: {room.extendable ? "Yes" : "No"}</p>
                  </div>
                  <div className="pt-3 border-t border-gray-100 flex items-center justify-between mt-auto">
                    <p className="text-xl font-bold">${room.price}<span className="text-sm font-normal text-gray-400">/night</span></p>
                    {booked[`${room.hotel_id}-${room.number}`] === "success" ? (
                      <span className="text-sm text-green-500 font-medium py-2 block">Booked!</span>
                    ) : booked[`${room.hotel_id}-${room.number}`] === "error" ? (
                      <span className="text-sm text-red-400 font-medium py-2 block">Failed</span>
                    ) : (
                      <div className="relative group/book">
                        <button
                          onClick={() => handleBook(room)}
                          disabled={!person || !filters.checkIn || !filters.checkOut}
                          className="px-4 py-2 bg-blue-400 text-white rounded-xl text-sm font-medium hover:bg-blue-300 disabled:opacity-40 disabled:cursor-not-allowed transition-colors cursor-pointer"
                        >
                          Book
                        </button>
                        {(!person || !filters.checkIn || !filters.checkOut) && (
                          <div className="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 hidden group-hover/book:block bg-gray-800 text-white text-xs rounded-lg px-2 py-1 whitespace-nowrap">
                            {!person ? "Select a customer first" : "Enter dates first and search again"}
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
    </div>
  )
}
