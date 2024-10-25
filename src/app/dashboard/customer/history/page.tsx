"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import Image from "next/image";
import { Product } from "@/types/product";


export default function Home() {
  const [orderHistory, setOrderHistory] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchOrderHistory() {
      const storedUser = localStorage.getItem("user");
      if (storedUser) {
        const parsedUser = JSON.parse(storedUser);

        try {
          const response = await fetch("/api/orderHistory", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ customer_ID: parsedUser.id }), // Use the user ID from localStorage
          });

          if (response.ok) {
            const data = await response.json();
            setOrderHistory(data.length ? data : []);
          } else {
            console.error("Failed to fetch order history");
            setOrderHistory([]);
          }
        } catch (error) {
          console.error("Error fetching order history:", error);
          setOrderHistory([]);
        } finally {
          setLoading(false);
        }
      } else {
        console.warn("No user found in localStorage");
        setLoading(false);
      }
    }

    fetchOrderHistory();
  }, []);

  return (
    <>
      <DashboardLayout>
        <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
          <div className="px-4 py-6 md:px-6 xl:px-9">
            <h4 className="text-body-2xlg font-bold text-dark dark:text-white">
              Your Order History
            </h4>
          </div>

          {/* Loading state */}
          {loading ? (
            <p className="px-4 py-6">Loading...</p>
          ) : orderHistory.length > 0 ? (
            <>
              {/* Table headers */}
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

              {/* Order history data */}
              {orderHistory.map((product, key) => (
                <div
                  className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5"
                  key={key}
                >
                  <div className="col-span-3 flex items-center">
                    <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
                      <div className="h-12.5 w-15 rounded-md">
                        <Image
                          src={product.image || "/images/product/default.png"}
                          width={60}
                          height={50}
                          alt="Product"
                        />
                      </div>
                      <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                        {product.name}
                      </p>
                    </div>
                  </div>
                  <div className="col-span-2 hidden items-center sm:flex">
                    <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                      {product.category || "N/A"}
                    </p>
                  </div>
                  <div className="col-span-1 flex items-center">
                    <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                      ${product.price || 0}
                    </p>
                  </div>
                  <div className="col-span-1 flex items-center">
                    <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                      {product.sold || 0}
                    </p>
                  </div>
                  <div className="col-span-1 flex items-center">
                    <p className="text-body-sm font-medium text-green">
                      ${product.profit || 0}
                    </p>
                  </div>
                </div>
              ))}
            </>
          ) : (
            <p className="px-4 py-6">No order history found.</p>
          )}
        </div>
      </DashboardLayout>
    </>
  );
}
