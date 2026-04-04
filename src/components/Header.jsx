"use client"
import Link from "next/link"
import { useState } from "react";

export default function Header() {

    const links = [
    {
      name: "Home",
      href: "/",
    },
    {
      name: "Insert",
      href: "/insert",
    },
  ]

  const [role, setRole] = useState(false)

  return (
    <div className="flex justify-between items-baseline px-16 md:px-30 pt-8">
        <h1 className="flex-1 text-black text-4xl font-bold">
            eHotels
        </h1>
        <div className="flex items-center gap-28 text-2xl md:gap-32">
            {links.map((link) => (
                <Link
                    key={link.name}
                    href={link.href}
                    className="text-black hover:text-blue-300 duration-200 transition-all"
                >
                    {link.name}
                </Link>
            ))}
        </div>
        <div className="flex-1 flex items-center justify-end">
            <button
                className="w-40 py-2 bg-blue-300 text-white rounded-full text-2xl cursor-pointer hover:bg-blue-400 duration-200 transition-all"
                onClick={() => setRole(!role)}
            >
                {role ? "Employee" : "Customer"}
            </button>
        </div>
    </div>
  )
}