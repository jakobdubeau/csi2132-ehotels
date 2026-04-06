"use client"
import Image from "next/image"
import { useState } from "react"
import SearchBar from "../components/SearchBar"
import { searchRooms } from "../lib/actions"

export default function Home() {
  const [rooms, setRooms] = useState(null)

  async function handleSearch(filters) {
    const results = await searchRooms(filters)
    setRooms(results)
  }

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
            <SearchBar onSearch={handleSearch} />
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
                <div key={`${room.hotel_id}-${room.number}`} className="border border-gray-200 rounded-2xl p-5">
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
                  <div className="pt-3 border-t border-gray-100">
                    <p className="text-xl font-bold">${room.price}<span className="text-sm font-normal text-gray-400">/night</span></p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
    </div>
  )
}
