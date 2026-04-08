import { getAvailableRoomsPerArea, getHotelCapacity } from "../../lib/actions"

const headerCls = "pb-3 font-medium text-gray-400 text-left"
const cellCls = "py-3"

export default async function Views() {
  const [roomsByArea, hotelCapacity] = await Promise.all([
    getAvailableRoomsPerArea(),
    getHotelCapacity(),
  ])

  return (
    <div className="flex-1 px-16 md:px-30 py-8">
      <h1 className="text-3xl font-bold mb-8">Views</h1>
      <div className="grid grid-cols-2 gap-8">
        <div className="border border-gray-200 rounded-2xl p-6">
          <h2 className="text-lg font-semibold mb-5">Available Rooms per Area</h2>
          <table className="w-full text-sm border-collapse">
            <thead>
              <tr className="border-b border-gray-100">
                <th className={headerCls}>Area</th>
                <th className={headerCls}>Available Rooms</th>
              </tr>
            </thead>
            <tbody>
              {roomsByArea.map(r => (
                <tr key={r.area} className="border-b border-gray-50 hover:bg-gray-50 transition-colors">
                  <td className={cellCls}>{r.area}</td>
                  <td className={`${cellCls} font-semibold text-blue-500`}>{r.available_rooms}</td>
                </tr>
              ))}
              {!roomsByArea.length && (
                <tr><td colSpan={2} className="py-8 text-center text-gray-400">No data.</td></tr>
              )}
            </tbody>
          </table>
        </div>

        <div className="border border-gray-200 rounded-2xl p-6">
          <h2 className="text-lg font-semibold mb-5">Hotel Aggregated Capacity</h2>
          <div className="overflow-y-auto max-h-80">
            <table className="w-full text-sm border-collapse">
              <thead className="sticky top-0 bg-white">
                <tr className="border-b border-gray-100">
                  <th className={headerCls}>Chain</th>
                  <th className={headerCls}>Hotel</th>
                  <th className={headerCls}>Total Capacity</th>
                </tr>
              </thead>
              <tbody>
                {hotelCapacity.map(r => (
                  <tr key={r.hotel_id} className="border-b border-gray-50 hover:bg-gray-50 transition-colors">
                    <td className={cellCls}>{r.hotel_chain_name}</td>
                    <td className={cellCls}>{r.address}</td>
                    <td className={`${cellCls} font-semibold text-blue-500`}>{r.total_capacity}</td>
                  </tr>
                ))}
                {!hotelCapacity.length && (
                  <tr><td colSpan={3} className="py-8 text-center text-gray-400">No data.</td></tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  )
}
