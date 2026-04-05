import Image from "next/image";
import SearchBar from "../components/SearchBar";

export default function Home() {
  return (
    <div className="flex flex-col flex-1 items-center bg-white">
      <main className="">
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
        </div>
        <SearchBar />
        <div className="text-center pt-20 text-2xl font-bold pb-52">
          Popular Hotels
        </div>
      </main>
    </div>
  );
}
