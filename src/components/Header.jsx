"use client"
import Link from "next/link"
import { usePathname } from "next/navigation"
import { useEffect, useState } from "react"
import { useRole } from "../context/RoleContext"
import { getCustomers, getEmployees } from "../lib/actions"

export default function Header() {
  const pathname = usePathname()
  const { isEmployee, toggleRole, person, setPerson } = useRole()
  const [people, setPeople] = useState([])

  useEffect(() => {
    const fetch = isEmployee ? getEmployees : getCustomers
    fetch().then(setPeople)
  }, [isEmployee])

  const links = [
    { name: "Home", href: "/" },
    { name: "Manage", href: "/insert" },
    { name: "Views", href: "/views" },
  ]

  return (
    <nav className="flex items-center px-16 md:px-30 py-6">
      <div className="flex-1">
        <Link href="/" className="text-black text-3xl font-bold tracking-tight">
          eHotels
        </Link>
      </div>

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

      <div className="flex-1 flex justify-end items-center gap-3">
        {person && (
          <div className="flex items-center gap-1.5 px-3 py-1.5 bg-gray-100 rounded-full text-sm text-gray-600">
            <span>{person.name}</span>
            <button onClick={() => setPerson(null)} className="text-gray-400 hover:text-gray-600 cursor-pointer leading-none">✕</button>
          </div>
        )}
        <div className="relative group">
          <button
            onClick={toggleRole}
            className="w-28 py-2 bg-blue-300 text-white rounded-full text-base cursor-pointer hover:bg-blue-400 duration-200 text-center"
          >
            {isEmployee ? "Employee" : "Customer"}
          </button>
          <div className="absolute right-0 top-full pt-2 hidden group-hover:block z-50 w-48">
            <div className="bg-white rounded-2xl shadow-xl border border-gray-100 py-2 max-h-64 overflow-y-auto">
              {people.map(p => (
                <button
                  key={p.ssn}
                  onClick={() => setPerson(p)}
                  className={`w-full text-left px-4 py-2 text-sm hover:bg-gray-50 transition-colors cursor-pointer ${
                    person?.ssn === p.ssn ? "text-blue-500 font-medium" : "text-gray-700"
                  }`}
                >
                  {p.name}
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>
    </nav>
  )
}
