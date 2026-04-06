"use client"
import Link from "next/link"
import { usePathname } from "next/navigation"
import { useState } from "react"

export default function Header() {
  const pathname = usePathname()
  const [role, setRole] = useState(false)

  const links = [
    { name: "Home", href: "/" },
    { name: "Manage", href: "/insert" },
    { name: "Bookings", href: "/bookings" },
  ]

  return (
    <nav className="flex justify-between items-center px-16 md:px-30 py-6">
      <Link href="/" className="text-black text-3xl font-bold tracking-tight">
        eHotels
      </Link>
      <div className="flex items-center gap-10 text-lg">
        {links.map(link => (
          <Link key={link.name} href={link.href}
            className={`transition-colors duration-200 ${
              pathname === link.href
                ? "text-blue-400 font-medium"
                : "text-gray-600 hover:text-black"
            }`}>
            {link.name}
          </Link>
        ))}
      </div>
      <button
        className="px-5 py-2 bg-blue-300 text-white rounded-full text-base cursor-pointer hover:bg-blue-400 duration-200"
        onClick={() => setRole(!role)}
      >
        {role ? "Employee" : "Customer"}
      </button>
    </nav>
  )
}
