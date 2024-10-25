"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import Image from "next/image";

interface CartProduct {
  customer_id: number;
  product_id: number;
  product_name: string;
  product_price: number;
  product_image_url: string;
  quantity: number;
}

interface User {
  id: number;
  type: string;
}

const Home: React.FC = () => {
  const [cartData, setCartData] = useState<CartProduct[]>([]);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [user, setUser] = useState<User | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [formData, setFormData] = useState({
    name: "",
    phone: "",
    address: "",
    store: "",
    route: "",
    description: "",
    paymentDocument: "",
  });

  // Fetch cart data from backend
  const fetchCart = async (userId: number) => {
    setIsLoading(true);
    setError(null); // Reset error state before fetching

    try {
      const res = await fetch("/api/cart/get", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ customer_ID: userId }),
      });

      if (!res.ok) {
        throw new Error(`Error: ${res.status} ${res.statusText}`);
      }

      const data = await res.json();
      console.log("Fetched cart data:", data); // Log the fetched data
      const products = data[0]; // Get the first element which contains the cart products
      console.log("Extracted products:", products); // Log extracted products
      setCartData(products); // Set the extracted products to state
    } catch (error: any) {
      console.error("Failed to load cart:", error);
      setError("Failed to load cart data. Please try again later.");
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser: User = JSON.parse(storedUser);
      setUser(parsedUser);
      fetchCart(parsedUser.id);
    }
  }, []);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({ ...prevData, [name]: value }));
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    console.log("Form submitted:", formData);
    // Handle form submission logic here
  };

  if (isLoading) return <div>Loading your cart...</div>;
  if (!user) return <div>Loading user data...</div>;
  if (error) return <div>{error}</div>; // Display error message if any

  const totalPrice = cartData.reduce(
    (total, product) => total + product.product_price * product.quantity,
    0
  );

  return (
    <DashboardLayout>
      <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
        <div className="px-4 py-6 md:px-6 xl:px-9">
          <h4 className="text-body-2xlg font-bold text-dark dark:text-white">Your Cart</h4>
        </div>

        <div className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5">
          <div className="col-span-3 flex items-center">
            <p className="font-medium">Product Name</p>
          </div>
          <div className="col-span-2 hidden items-center sm:flex">
            <p className="font-medium">Quantity</p>
          </div>
          <div className="col-span-1 flex items-center">
            <p className="font-medium">Price</p>
          </div>
          <div className="col-span-1 flex items-center">
            <p className="font-medium">Total</p>
          </div>
        </div>

        {cartData.length > 0 ? (
          cartData.map((product, key) => {
            const totalProductPrice = product.product_price * product.quantity; // Calculate total price
            return (
              <div
                className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5"
                key={key}
              >
                <div className="col-span-3 flex items-center">
                  <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
                    <div className="h-12.5 w-15 rounded-md">
                      <Image
                        src={product.product_image_url}
                        width={60}
                        height={50}
                        alt={product.product_name}
                      />
                    </div>
                    <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                      {product.product_name}
                    </p>
                  </div>
                </div>
                <div className="col-span-2 hidden items-center sm:flex">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    {product.quantity}
                  </p>
                </div>
                <div className="col-span-1 flex items-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    ${product.product_price}
                  </p>
                </div>
                <div className="col-span-1 flex items-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    ${totalProductPrice.toFixed(2)} {/* Display the total price */}
                  </p>
                </div>
              </div>
            );
          })
        ) : (
          <div className="px-4 py-4 text-body-sm text-dark dark:text-dark-6">Your cart is empty.</div>
        )}

        <div className="px-4 py-4 text-body-lg font-bold text-dark dark:text-white">
          Total: ${totalPrice.toFixed(2)}
        </div>
      </div>

      {/* Order Details Form */}
      <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card mt-8">
        <div className="px-4 py-6 md:px-6 xl:px-9">
          <h4 className="text-body-2xlg font-bold text-dark dark:text-white">Order Details</h4>
        </div>
        <form onSubmit={handleSubmit} className="flex flex-col gap-5.5 p-6.5">
          <div className="grid grid-cols-1 gap-9 sm:grid-cols-2">
            {/* Name */}
            <InputField
              label="Name"
              name="name"
              value={formData.name}
              onChange={handleChange}
              placeholder="Enter your name"
              required
            />
            {/* Phone Number */}
            <InputField
              label="Phone Number"
              name="phone"
              type="tel"
              value={formData.phone}
              onChange={handleChange}
              placeholder="Enter your phone number"
              required
            />
            {/* Address */}
            <InputField
              label="Address"
              name="address"
              value={formData.address}
              onChange={handleChange}
              placeholder="Enter your address"
              required
            />
            {/* Store */}
            <InputField
              label="Store"
              name="store"
              value={formData.store}
              onChange={handleChange}
              placeholder="Enter the store name"
              required
            />
            {/* Route */}
            <InputField
              label="Route"
              name="route"
              value={formData.route}
              onChange={handleChange}
              placeholder="Enter your route"
              required
            />
            {/* Description */}
            <TextAreaField
              label="Description"
              name="description"
              value={formData.description}
              onChange={handleChange}
              placeholder="Enter any additional information"
              required
            />
            {/* Payment Document */}
            <InputField
              label="Payment Document"
              name="paymentDocument"
              value={formData.paymentDocument}
              onChange={handleChange}
              placeholder="Enter document URL"
              required
            />
          </div>
          <button
            type="submit"
            className="mt-5 rounded-md bg-primary py-3.5 text-center text-base font-semibold text-white transition hover:bg-opacity-80"
          >
            Place Order
          </button>
        </form>
      </div>
    </DashboardLayout>
  );
};

// InputField Component for cleaner code
const InputField: React.FC<{
  label: string;
  name: string;
  type?: string;
  value: string;
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  placeholder: string;
  required?: boolean;
}> = ({ label, name, type = "text", value, onChange, placeholder, required }) => (
  <div>
    <label className="mb-2 block text-body-sm font-medium text-dark dark:text-dark-6">
      {label}
    </label>
    <input
      type={type}
      name={name}
      value={value}
      onChange={onChange}
      placeholder={placeholder}
      required={required}
      className="w-full rounded-md border border-stroke py-2.5 px-4 text-body-sm text-dark outline-none transition focus:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-dark-6"
    />
  </div>
);

// TextAreaField Component for cleaner code
const TextAreaField: React.FC<{
  label: string;
  name: string;
  value: string;
  onChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void;
  placeholder: string;
  required?: boolean;
}> = ({ label, name, value, onChange, placeholder, required }) => (
  <div>
    <label className="mb-2 block text-body-sm font-medium text-dark dark:text-dark-6">
      {label}
    </label>
    <textarea
      name={name}
      value={value}
      onChange={onChange}
      placeholder={placeholder}
      required={required}
      className="w-full rounded-md border border-stroke py-2.5 px-4 text-body-sm text-dark outline-none transition focus:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-dark-6"
    />
  </div>
);

export default Home;
