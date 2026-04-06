"use client"
import { useState } from "react"

const tabs = ["Bookings", "Rentings", "Payments", "Views"]

export default function Bookings() {
  const [activeTab, setActiveTab] = useState("Bookings")

  return (
    <div className="flex-1 px-16 md:px-30 py-8">
      <h1 className="text-3xl font-bold mb-6">Employee Dashboard</h1>
      <div className="flex gap-2 mb-8">
        {tabs.map(tab => (
          <button key={tab} onClick={() => setActiveTab(tab)}
            className={`px-5 py-2 rounded-xl text-sm font-medium cursor-pointer ${
              activeTab === tab ? "bg-blue-300 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"
            }`}>
            {tab}
          </button>
        ))}
      </div>
      <div className="text-gray-500">
        {activeTab} section coming soon
      </div>
    </div>
  )
}
