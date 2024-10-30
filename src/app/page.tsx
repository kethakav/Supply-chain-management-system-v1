import Image from "next/image";
import Link from "next/link";

export default function Home() {
  return (
    <div className="bg-[url('/images/bg.png')] bg-cover bg-center h-screen relative">
      {/* Top Navigation Bar */}
      <nav className="bg-black text-white p-4 fixed w-full shadow-md">
  <div className="flex justify-center items-center max-w-6xl mx-auto">
    <div className="text-lg font-bold mr-auto">PrimeScreen</div>
    <div className="flex space-x-8">
      <Link href="/" passHref>
        <button className="relative text-white group py-2 px-4">
          <span className="absolute inset-0 bg-transparent transition-all duration-300 transform skew-y-2 group-hover:bg-gray-700 rounded-lg" />
          <span className="relative z-10 transition duration-300 ease-in-out">Home</span>
        </button>
      </Link>
      <Link href="/auth/customer/signup" passHref>
        <button className="relative text-white-400 group py-2 px-4">
          <span className="absolute inset-0 bg-transparent transition-all duration-300 transform skew-y-2 group-hover:bg-blue-600 rounded-lg" />
          <span className="relative z-10 transition duration-300 ease-in-out">Sign up</span>
        </button>
      </Link>
      <Link href="/auth/signin" passHref>
        <button className="relative text-white-400 group py-2 px-4">
          <span className="absolute inset-0 bg-transparent transition-all duration-300 transform skew-y-2 group-hover:bg-blue-600 rounded-lg" />
          <span className="relative z-10 transition duration-300 ease-in-out">Login</span>
        </button>
      </Link>
    </div>
  </div>
</nav>






      {/* Main Content */}
      <div className="pt-[70px] flex items-start justify-center">
        <div className="bg-white bg-opacity-80 p-4 rounded-md flex items-center space-x-4  m-10">
          <img
            src="/images/logo/PrimeScreen%20Logo.svg"
            alt="PrimeScreen"
            className="w-16 h-16"
          />
          <h1 className="text-6xl font-bold text-black">
            PrimeScreen
          </h1>
        </div>
      </div>
    </div>
  );
}


