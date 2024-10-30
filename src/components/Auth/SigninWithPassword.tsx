"use client";
import React, { useState } from "react";
import Link from "next/link";
import { useRouter } from 'next/navigation';

export default function SigninWithPassword() {
  const [data, setData] = useState({
    username: "",
    password: "",
  });
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const router = useRouter();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setError("");
    setIsLoading(true);

    try {
      const response = await fetch("/api/auth/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (response.ok) {
        const result = await response.json();
        localStorage.setItem("user", JSON.stringify(result));
        router.push('/dashboard');
      } else {
        const errorData = await response.json();
        if (response.status === 401) {
          setError("Invalid username or password. Please try again.");
        } else if (response.status === 404) {
          setError("Account not found. Please check your username or sign up.");
        } else {
          setError(errorData.error || "An error occurred during sign in.");
        }
      }
    } catch (error) {
      console.error("Sign-in error", error);
      setError("Network error. Please check your connection and try again.");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {error && (
        <div className="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
          <div className="flex items-center">
            <svg className="flex-shrink-0 inline w-4 h-4 mr-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
            </svg>
            <span className="sr-only">Error</span>
            <div>{error}</div>
          </div>
        </div>
      )}
      
      <div>
        <label
          htmlFor="username"
          className="mb-2.5 block font-medium text-dark dark:text-white"
        >
          Username
        </label>
        <div className="relative">
          <input
            type="text"
            id="username"
            placeholder="Enter your username"
            name="username"
            value={data.username}
            onChange={(e) => setData({ ...data, username: e.target.value })}
            className={`w-full rounded-lg border ${
              error ? 'border-red-500 focus:border-red-500' : 'border-stroke focus:border-primary'
            } bg-transparent py-4 pl-6 pr-11 font-medium outline-none transition-all focus-visible:shadow-none dark:border-dark-3 dark:bg-dark-2 dark:text-white`}
            disabled={isLoading}
          />
          <span className="absolute right-4 top-1/2 -translate-y-1/2">
            <svg
              className={`fill-current ${error ? 'text-red-500' : 'text-gray-500'}`}
              width="22"
              height="22"
              viewBox="0 0 22 22"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M11 2.5a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zM8 7a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm-.5 6A3.5 3.5 0 0 0 4 16.5v1a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-1A3.5 3.5 0 0 0 14.5 13h-7z"
                fill=""
              />
            </svg>
          </span>
        </div>
      </div>

      <div>
        <label
          htmlFor="password"
          className="mb-2.5 block font-medium text-dark dark:text-white"
        >
          Password
        </label>
        <div className="relative">
          <input
            type="password"
            id="password"
            placeholder="Enter your password"
            name="password"
            value={data.password}
            onChange={(e) => setData({ ...data, password: e.target.value })}
            className={`w-full rounded-lg border ${
              error ? 'border-red-500 focus:border-red-500' : 'border-stroke focus:border-primary'
            } bg-transparent py-4 pl-6 pr-11 font-medium outline-none transition-all focus-visible:shadow-none dark:border-dark-3 dark:bg-dark-2 dark:text-white`}
            disabled={isLoading}
          />
          <span className="absolute right-4 top-1/2 -translate-y-1/2">
            <svg
              className={`fill-current ${error ? 'text-red-500' : 'text-gray-500'}`}
              width="22"
              height="22"
              viewBox="0 0 22 22"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M8.48177 14.6668C8.48177 13.2746 9.61039 12.146 11.0026 12.146C12.3948 12.146 13.5234 13.2746 13.5234 14.6668C13.5234 16.059 12.3948 17.1877 11.0026 17.1877C9.61039 17.1877 8.48177 16.059 8.48177 14.6668ZM11.0026 13.521C10.3698 13.521 9.85677 14.034 9.85677 14.6668C9.85677 15.2997 10.3698 15.8127 11.0026 15.8127C11.6354 15.8127 12.1484 15.2997 12.1484 14.6668C12.1484 14.034 11.6354 13.521 11.0026 13.521Z"
                fill=""
              />
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M6.19011 7.3335C6.19011 4.67563 8.34474 2.521 11.0026 2.521C13.2441 2.521 15.1293 4.05405 15.6635 6.12986C15.7582 6.49757 16.133 6.71894 16.5007 6.6243C16.8684 6.52965 17.0898 6.15484 16.9951 5.78713C16.3083 3.11857 13.8867 1.146 11.0026 1.146C7.58534 1.146 4.81511 3.91623 4.81511 7.3335V8.5277C4.60718 8.54232 4.4112 8.56135 4.22683 8.58614C3.40173 8.69707 2.70702 8.93439 2.15526 9.48615C1.6035 10.0379 1.36618 10.7326 1.25525 11.5577C1.1484 12.3524 1.14842 13.3629 1.14844 14.6165V14.7171C1.14842 15.9708 1.1484 16.9812 1.25525 17.7759C1.36618 18.601 1.6035 19.2958 2.15526 19.8475C2.70702 20.3993 3.40173 20.6366 4.22683 20.7475C5.02155 20.8544 6.03202 20.8543 7.28564 20.8543H14.7196C15.9732 20.8543 16.9837 20.8544 17.7784 20.7475C18.6035 20.6366 19.2982 20.3993 19.85 19.8475C20.4017 19.2958 20.639 18.601 20.75 17.7759C20.8568 16.9812 20.8568 15.9708 20.8568 14.7171V14.6165C20.8568 13.3629 20.8568 12.3524 20.75 11.5577C20.639 10.7326 20.4017 10.0379 19.85 9.48615C19.2982 8.93439 18.6035 8.69707 17.7784 8.58614C16.9837 8.47929 15.9732 8.47931 14.7196 8.47933H7.28564C6.89741 8.47932 6.53251 8.47932 6.19011 8.48249V7.3335ZM4.41005 9.94888C3.73742 10.0393 3.38123 10.2047 3.12753 10.4584C2.87383 10.7121 2.70842 11.0683 2.61799 11.7409C2.5249 12.4333 2.52344 13.351 2.52344 14.6668C2.52344 15.9826 2.5249 16.9003 2.61799 17.5927C2.70842 18.2653 2.87383 18.6215 3.12753 18.8752C3.38123 19.1289 3.73742 19.2943 4.41005 19.3848C5.10245 19.4779 6.02014 19.4793 7.33594 19.4793H14.6693C15.9851 19.4793 16.9028 19.4779 17.5952 19.3848C18.2678 19.2943 18.624 19.1289 18.8777 18.8752C19.1314 18.6215 19.2968 18.2653 19.3872 17.5927C19.4803 16.9003 19.4818 15.9826 19.4818 14.6668C19.4818 13.351 19.4803 12.4333 19.3872 11.7409C19.2968 11.0683 19.1314 10.7121 18.8777 10.4584C18.624 10.2047 18.2678 10.0393 17.5952 9.94888C16.9028 9.85579 15.9851 9.85433 14.6693 9.85433H7.33594C6.02014 9.85433 5.10245 9.85579 4.41005 9.94888Z"
                fill=""
              />
            </svg>
          </span>
        </div>
      </div>

      <button
        type="submit"
        disabled={isLoading}
        className="w-full rounded-lg bg-primary p-4 font-medium text-white transition-all hover:bg-opacity-90 disabled:cursor-not-allowed disabled:bg-opacity-50"
      >
        {isLoading ? "Signing In..." : "Sign In"}
      </button>

      <p className="text-center text-base">
        Don't have an account?{" "}
        <Link
          href="/auth/customer/signup"
          className="text-primary hover:underline"
        >
          Sign Up
        </Link>
      </p>
    </form>
  );
}