"use client"
import { createContext, useContext, useState } from "react"

const RoleContext = createContext(null)

export function RoleProvider({ children }) {
  const [isEmployee, setIsEmployee] = useState(false)
  const [person, setPerson] = useState(null)

  function toggleRole() {
    setIsEmployee(prev => !prev)
    setPerson(null)
  }

  return (
    <RoleContext.Provider value={{ isEmployee, toggleRole, person, setPerson }}>
      {children}
    </RoleContext.Provider>
  )
}

export function useRole() {
  return useContext(RoleContext)
}
