"use client"
import { useState, useEffect, useRef } from "react"
import { SlidersHorizontal } from "lucide-react"

const AREAS = ["Downtown", "Suburbs", "Beachfront", "Airport", "Mountain", "Countryside"]
const HOTEL_CHAINS = ["Marriott", "Hilton", "Days Inn", "Wyndham", "Continental"]
const CATEGORIES = [1, 2, 3, 4, 5]

const defaultFilters = {
  checkIn: "", checkOut: "", area: "", capacity: "",
  hotelChain: "", category: "", totalRooms: "", minPrice: "", maxPrice: "",
}

export default function SearchBar() {
  const [filters, setFilters] = useState(defaultFilters)
  const [showFilters, setShowFilters] = useState(false)
  const filterRef = useRef(null)

  const set = (key, value) => setFilters((prev) => ({ ...prev, [key]: value }))

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (filterRef.current && !filterRef.current.contains(e.target)) setShowFilters(false);
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [])

  const activeFilterCount = [filters.hotelChain, filters.category, filters.totalRooms, filters.minPrice, filters.maxPrice].filter(Boolean).length;

  return (
    <div className="w-full max-w-6xl mx-auto relative z-10 px-4">
      <div className="bg-white/90 backdrop-blur-sm rounded-2xl shadow-xl p-5 flex flex-wrap items-end gap-4">
        <div className="flex-1 min-w-36">
          <label className="block text-sm font-semibold text-gray-500 mb-1.5 ml-1">Check In</label>
          <input
            type="date"
            value={filters.checkIn}
            onChange={(e) => set("checkIn", e.target.value)}
            className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all"
          />
        </div>
        <div className="flex-1 min-w-36">
          <label className="block text-sm font-semibold text-gray-500 mb-1.5 ml-1">Check Out</label>
          <input
            type="date"
            value={filters.checkOut}
            onChange={(e) => set("checkOut", e.target.value)}
            className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all"
          />
        </div>
        <div className="flex-1 min-w-36">
          <label className="block text-sm font-semibold text-gray-500 mb-1.5 ml-1">Area</label>
          <select
            value={filters.area}
            onChange={(e) => set("area", e.target.value)}
            className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all appearance-none cursor-pointer"
          >
            <option value="">Any area</option>
            {AREAS.map((a) => <option key={a} value={a}>{a}</option>)}
          </select>
        </div>
        <div className="flex-1 min-w-32">
          <label className="block text-sm font-semibold text-gray-500 mb-1.5 ml-1">Guests</label>
          <select
            value={filters.capacity}
            onChange={(e) => set("capacity", e.target.value)}
            className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all appearance-none cursor-pointer"
          >
            <option value="">Any</option>
            {[1, 2, 3, 4, 5, 6].map((n) => (
              <option key={n} value={n}>{n} {n === 1 ? "guest" : "guests"}</option>
            ))}
          </select>
        </div>
        <div className="relative" ref={filterRef}>
          <button
            onClick={() => setShowFilters(!showFilters)}
            className={`px-5 py-3.5 rounded-xl text-base font-medium border transition-all cursor-pointer flex items-center gap-2 ${
              showFilters || activeFilterCount > 0
                ? "bg-blue-50 border-blue-300 text-blue-600"
                : "bg-gray-50 border-gray-200 text-gray-600 hover:bg-gray-100"
            }`}
          >
            <SlidersHorizontal size={18} />
            Filters
            {activeFilterCount > 0 && (
              <span className="bg-blue-300 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                {activeFilterCount}
              </span>
            )}
          </button>

          {showFilters && (
            <div className="absolute right-0 top-full mt-2 w-96 bg-white rounded-2xl shadow-2xl border border-gray-100 p-5 z-50">
              <div className="flex justify-between items-center mb-4">
                <h3 className="font-semibold text-gray-800">More Filters</h3>
                <button
                  onClick={() => setFilters((prev) => ({ ...prev, hotelChain: "", category: "", totalRooms: "", minPrice: "", maxPrice: "" }))}
                  className="text-xs text-blue-400 hover:text-blue-600 cursor-pointer"
                >
                  Clear all
                </button>
              </div>

              <div className="space-y-4">
                <div>
                  <label className="block text-xs font-semibold text-gray-500 mb-1">Hotel Chain</label>
                  <select
                    value={filters.hotelChain}
                    onChange={(e) => set("hotelChain", e.target.value)}
                    className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all appearance-none cursor-pointer"
                  >
                    <option value="">Any chain</option>
                    {HOTEL_CHAINS.map((c) => <option key={c} value={c}>{c}</option>)}
                  </select>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-gray-500 mb-1">Hotel Category</label>
                  <div className="flex gap-2">
                    {CATEGORIES.map((star) => (
                      <button
                        key={star}
                        onClick={() => set("category", filters.category === String(star) ? "" : String(star))}
                        className={`flex-1 py-2 rounded-xl text-sm font-medium border transition-all cursor-pointer ${
                          filters.category === String(star)
                            ? "bg-blue-300 text-white border-blue-300"
                            : "bg-gray-50 border-gray-200 text-gray-600 hover:bg-gray-100"
                        }`}
                      >
                        {star}&#9733;
                      </button>
                    ))}
                  </div>
                </div>
                <div>
                  <label className="block text-xs font-semibold text-gray-500 mb-1">Min. Rooms in Hotel</label>
                  <input
                    type="number"
                    min="1"
                    placeholder="e.g. 100"
                    value={filters.totalRooms}
                    onChange={(e) => set("totalRooms", e.target.value)}
                    className="w-full px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-xs font-semibold text-gray-500 mb-1">Price Range (per night)</label>
                  <div className="flex gap-2">
                    <input
                      type="number"
                      min="0"
                      placeholder="Min $"
                      value={filters.minPrice}
                      onChange={(e) => set("minPrice", e.target.value)}
                      className="flex-1 px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all"
                    />
                    <span className="flex items-center text-gray-400">-</span>
                    <input
                      type="number"
                      min="0"
                      placeholder="Max $"
                      value={filters.maxPrice}
                      onChange={(e) => set("maxPrice", e.target.value)}
                      className="flex-1 px-4 py-3.5 bg-gray-50 rounded-xl text-base border border-gray-200 focus:outline-none focus:border-blue-300 focus:ring-1 focus:ring-blue-300 transition-all"
                    />
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
        <button className="px-8 py-3.5 bg-blue-300 hover:bg-blue-400 text-white rounded-xl text-base font-semibold transition-all cursor-pointer">
          Search
        </button>
      </div>
    </div>
  );
}
