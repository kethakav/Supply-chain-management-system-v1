"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useState } from "react";
import Image from "next/image";
import { Product } from "@/types/product";


const productData: Product[] = [
  {
    image: "/images/product/product-01.png",
    name: "Apple Watch Series 7",
    category: "Electronics",
    price: 296,
    sold: 22,
    profit: 45,
  },
  {
    image: "/images/product/product-02.png",
    name: "Macbook Pro M1",
    category: "Electronics",
    price: 546,
    sold: 12,
    profit: 125,
  },
  {
    image: "/images/product/product-03.png",
    name: "Dell Inspiron 15",
    category: "Electronics",
    price: 443,
    sold: 64,
    profit: 247,
  },
  {
    image: "/images/product/product-04.png",
    name: "HP Probook 450",
    category: "Electronics",
    price: 499,
    sold: 72,
    profit: 103,
  },
];

export default function Home() {
  const [formData, setFormData] = useState({
    name: "",
    phone: "",
    address: "",
    store: "",
    route: "",
    description: "",
    paymentDocument: "",
    price: 0,
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    // Handle form submission logic here (e.g., API call)
    console.log(formData);
  };

  return (
    <>
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
              <p className="font-medium">Category</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Price</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Sold</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Profit</p>
            </div>
          </div>

          {productData.map((product, key) => (
            <div
              className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5"
              key={key}
            >
              <div className="col-span-3 flex items-center">
                <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
                  <div className="h-12.5 w-15 rounded-md">
                    <Image src={product.image} width={60} height={50} alt="Product" />
                  </div>
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{product.name}</p>
                </div>
              </div>
              <div className="col-span-2 hidden items-center sm:flex">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{product.category}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">${product.price}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{product.sold}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-green">${product.profit}</p>
              </div>
            </div>
          ))}
        </div>

        {/* New Form Section */}
        <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card mt-8">
          <div className="px-4 py-6 md:px-6 xl:px-9">
            <h4 className="text-body-2xlg font-bold text-dark dark:text-white">Order Details</h4>
          </div>
          <form onSubmit={handleSubmit} className="flex flex-col gap-5.5 p-6.5">
            <div className="grid grid-cols-1 gap-9 sm:grid-cols-2">
              {/* Name */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Name</label>
                <input
                  type="text"
                  name="name"
                  value={formData.name}
                  onChange={handleChange}
                  placeholder="Enter your name"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                  required
                />
              </div>

              {/* Phone Number */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Phone Number</label>
                <input
                  type="tel"
                  name="phone"
                  value={formData.phone}
                  onChange={handleChange}
                  placeholder="Enter your phone number"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                  required
                />
              </div>

              {/* Address */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Address</label>
                <input
                  type="text"
                  name="address"
                  value={formData.address}
                  onChange={handleChange}
                  placeholder="Enter your address"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                  required
                />
              </div>

              {/* Price (already filled) */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Price</label>
                <input
                  type="text"
                  name="price"
                  value={productData.reduce((total, product) => total + product.price, 0)}
                  readOnly
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                />
              </div>

              {/* Store */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Store</label>
                <input
                  type="text"
                  name="store"
                  value={formData.store}
                  onChange={handleChange}
                  placeholder="Enter the store name"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                />
              </div>

              {/* Route */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Route</label>
                <input
                  type="text"
                  name="route"
                  value={formData.route}
                  onChange={handleChange}
                  placeholder="Enter the route"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                />
              </div>

              {/* Description */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Description</label>
                <textarea
                  name="description"
                  value={formData.description}
                  onChange={handleChange}
                  placeholder="Enter a description"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                  rows={3}
                />
              </div>

              {/* Payment Document */}
              <div>
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Payment Document</label>
                <input
                  type="text"
                  name="paymentDocument"
                  value={formData.paymentDocument}
                  onChange={handleChange}
                  placeholder="Enter the payment document link"
                  className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                />
              </div>
            </div>

            <button
              type="submit"
              className="mt-5 rounded-md bg-primary px-6 py-3 text-white transition hover:bg-primary-dark"
            >
              Submit
            </button>
          </form>
        </div>
      </DashboardLayout>
    </>
  );
}
