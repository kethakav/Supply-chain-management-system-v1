"use client";
import { useState } from "react";
import { useRouter } from 'next/navigation';
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import LoginLayout from "@/components/Layouts/LoginLayout";

const CustomerSignup = () => {
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  
  // State to hold form data
  const [formData, setFormData] = useState({
    username: "",
    customer_email: "",
    password: "",
    customer_first_name: "",
    customer_last_name: "",
    customer_contact: "",
    customer_address: "",
  });

  // Handle input change
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setError(null); // Clear any previous errors
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  // Handle form submission
  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setIsLoading(true);

    try {
      const response = await fetch("/api/auth/customer/end/signup", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.error || 'Registration failed');
      }

      // Store user data in localStorage
      localStorage.setItem('user', JSON.stringify(data.user));
      
      // Redirect to dashboard
      router.push('/dashboard');
      
    } catch (error) {
      setError((error as Error).message || 'An error occurred during registration');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <LoginLayout>
      <Breadcrumb pageName="Customer Signup" />

      <form onSubmit={handleSubmit}>
        <div className="grid grid-cols-1 gap-9 sm:grid-cols-2">
          <div className="flex flex-col gap-9">
            {/* Error Alert */}
            {error && (
              <div className="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                {error}
              </div>
            )}

            <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
              <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
                <h3 className="font-medium text-dark dark:text-white">
                  Customer Information
                </h3>
              </div>
              <div className="flex flex-col gap-5.5 p-6.5">
                {/* Username Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Username
                  </label>
                  <input
                    type="text"
                    name="username"
                    value={formData.username}
                    onChange={handleChange}
                    placeholder="Enter your username"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* Email Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Email
                  </label>
                  <input
                    type="email"
                    name="customer_email"
                    value={formData.customer_email}
                    onChange={handleChange}
                    placeholder="Enter your email"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* Password Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Password
                  </label>
                  <input
                    type="password"
                    name="password"
                    value={formData.password}
                    onChange={handleChange}
                    placeholder="Enter your password"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* First Name Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    First Name
                  </label>
                  <input
                    type="text"
                    name="customer_first_name"
                    value={formData.customer_first_name}
                    onChange={handleChange}
                    placeholder="Enter your first name"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* Last Name Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Last Name
                  </label>
                  <input
                    type="text"
                    name="customer_last_name"
                    value={formData.customer_last_name}
                    onChange={handleChange}
                    placeholder="Enter your last name"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* Contact Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Contact Number
                  </label>
                  <input
                    type="tel"
                    name="customer_contact"
                    value={formData.customer_contact}
                    onChange={handleChange}
                    placeholder="Enter your contact number"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                {/* Address Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Address
                  </label>
                  <input
                    type="text"
                    name="customer_address"
                    value={formData.customer_address}
                    onChange={handleChange}
                    placeholder="Enter your address"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>
              </div>
            </div>

            {/* Submit Button */}
            <div className="flex justify-end mt-6">
              <button
                type="submit"
                disabled={isLoading}
                className="px-6 py-3 text-white bg-primary rounded-md hover:bg-opacity-90 transition duration-150 ease-in-out disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isLoading ? 'Registering...' : 'Register'}
              </button>
            </div>
          </div>
        </div>
      </form>
    </LoginLayout>
  );
};

export default CustomerSignup;