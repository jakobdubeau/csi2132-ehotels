import { DM_Sans, DM_Serif_Display } from "next/font/google"
import "./globals.css"
import Header from "../components/Header"
import Providers from "../components/Providers"

const dmSans = DM_Sans({
  variable: "--font-body",
  subsets: ["latin"],
})

const dmSerif = DM_Serif_Display({
  variable: "--font-heading",
  weight: "400",
  subsets: ["latin"],
})

export const metadata = {
  title: "eHotels",
  description: "CSI2132 Project",
}

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={`${dmSans.variable} ${dmSerif.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col">
        <Providers>
          <Header />
          {children}
        </Providers>
      </body>
    </html>
  )
}
