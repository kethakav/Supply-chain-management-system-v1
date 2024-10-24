"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useState } from "react";
import Image from "next/image";

// Create a new Order type
type Order = {
  orderId: string;
  customerName: string;
  product: string;
  category: string;
  price: number;
  deliveryDate: string;
  status: "Delivered" | "In Progress" | "Cancelled";
  image: string;
};

const orderData: Order[] = [
  {
    orderId: "ORD001",
    customerName: "John Doe",
    product: "Apple Watch Series 7",
    category: "Electronics",
    price: 296,
    deliveryDate: "2024-10-01",
    status: "Delivered",
    image: "/images/product/product-01.png",
  },
  {
    orderId: "ORD002",
    customerName: "Jane Smith",
    product: "Macbook Pro M1",
    category: "Electronics",
    price: 546,
    deliveryDate: "2024-10-12",
    status: "Delivered",
    image: "/images/product/product-02.png",
  },
  {
    orderId: "ORD003",
    customerName: "Alice Johnson",
    product: "Dell Inspiron 15",
    category: "Electronics",
    price: 443,
    deliveryDate: "2024-09-28",
    status: "Cancelled",
    image: "/images/product/product-03.png",
  },
  {
    orderId: "ORD004",
    customerName: "Bob Williams",
    product: "HP Probook 450",
    category: "Electronics",
    price: 499,
    deliveryDate: "2024-10-15",
    status: "In Progress",
    image: "/images/product/product-04.png",
  },
];

export default function OrderHistory() {
  return (
    <>
      <DashboardLayout>
        <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
          <div className="px-4 py-6 md:px-6 xl:px-9">
            <h4 className="text-body-2xlg font-bold text-dark dark:text-white">Order History</h4>
          </div>

          {/* Table Headers */}
          <div className="grid grid-cols-7 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-11 md:px-6 2xl:px-7.5">
            <div className="col-span-2 flex items-center">
              <p className="font-medium">Order ID</p>
            </div>
            <div className="col-span-2 hidden items-center sm:flex">
              <p className="font-medium">Customer</p>
            </div>
            <div className="col-span-2 flex items-center">
              <p className="font-medium">Product</p>
            </div>
            <div className="col-span-1 hidden items-center sm:flex">
              <p className="font-medium">Category</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Price</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Status</p>
            </div>
            <div className="col-span-2 hidden items-center sm:flex">
              <p className="font-medium">Delivery Date</p>
            </div>
          </div>

          {/* Orders Data */}
          {orderData.map((order, key) => (
            <div
              className="grid grid-cols-7 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-11 md:px-6 2xl:px-7.5"
              key={key}
            >
              <div className="col-span-2 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.orderId}</p>
              </div>
              <div className="col-span-2 hidden items-center sm:flex">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.customerName}</p>
              </div>
              <div className="col-span-2 flex items-center">
                <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
                  <div className="h-12.5 w-15 rounded-md">
                    <Image src={order.image} width={60} height={50} alt="Product" />
                  </div>
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.product}</p>
                </div>
              </div>
              <div className="col-span-1 hidden items-center sm:flex">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.category}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">${order.price}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p
                  className={`text-body-sm font-medium ${
                    order.status === "Delivered"
                      ? "text-green"
                      : order.status === "Cancelled"
                      ? "text-red"
                      : "text-yellow"
                  }`}
                >
                  {order.status}
                </p>
              </div>
              <div className="col-span-2 hidden items-center sm:flex">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.deliveryDate}</p>
              </div>
            </div>
          ))}
        </div>
      </DashboardLayout>
    </>
  );
}
