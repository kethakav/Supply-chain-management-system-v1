import Header from "@/components/Header";
import Image from "next/image";
import Link from "next/link";

export default function Home() {
  return (
    <div className="bg-[url('/images/bg.png')] bg-cover bg-center h-screen relative text-dark-5 dark:text-dark-6">
      <Header sidebarOpen={false} setSidebarOpen={true} />

      {/* Main Content */}
      <div className="pt-[80px] flex flex-col items-center justify-center h-full">
        {/* <div className="bg-white dark:bg-dark-2 bg-opacity-80 p-6 rounded-md flex items-center space-x-4 m-10 shadow-md">
          <Image
            src="/images/logo/PrimeScreen%20Logo.svg"
            alt="PrimeScreen"
            width={64}
            height={64}
            className="w-16 h-16"
          />
          <h1 className="text-6xl font-bold text-dark dark:text-dark-6">
            PrimeScreen
          </h1>
        </div> */}
        <Link href="/dashboard" passHref>
          <button className="mt-6 px-6 py-3 bg-blue-600 text-white rounded-lg shadow-md hover:bg-blue-700 transition duration-300 ease-in-out">
            Go to Dashboard
          </button>
        </Link>
      </div>
    </div>
  );
}
