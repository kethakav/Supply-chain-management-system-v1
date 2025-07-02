"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Link from "next/link"; // Import Link from next/link
import Loader from "@/components/common/Loader";

interface Order {
  order_id: string;
  ordered_date_time: string;
  total_amount: number;
  delivered_confirmation: boolean;
  expecting_delivery_date?: string;
}

export default function Home() {
  const [orderHistory, setOrderHistory] = useState<Order[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchOrderHistory() {
      const storedUser = localStorage.getItem("user");
      if (storedUser) {
        const parsedUser = JSON.parse(storedUser);

        try {
          const response = await fetch("/api/get-order-history", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ customer_ID: parsedUser.id }),
          });

          if (response.ok) {
            const data = await response.json();
            const orderHistoryData = Array.isArray(data[0]) ? data[0] : [];
            setOrderHistory(orderHistoryData);
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

  if (loading) {
    return (
      <Loader />
    );
  }

  return (
    <>
      <DashboardLayout>
        <Breadcrumb pageName="Order History" />
        <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
          {loading ? (
            <p className="px-4 py-6">Loading...</p>
          ) : orderHistory.length > 0 ? (
            <>
              {/* Table headers */}
              <div className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5">
                <div className="col-span-2 flex items-center">
                  <p className="font-medium">Order ID</p>
                </div>
                <div className="col-span-2 flex items-center">
                  <p className="font-medium">Order Date</p>
                </div>
                <div className="col-span-2 flex items-center">
                  <p className="font-medium">Total Amount</p>
                </div>
                <div className="col-span-1 flex items-center">
                  <p className="font-medium">Status</p>
                </div>
                <div className="col-span-1 flex items-center">
                  <p className="font-medium">Expected Delivery</p>
                </div>
              </div>

              {/* Order history data */}
              {orderHistory.map((order) => (
                <Link href={`/orders/${order.order_id}`} key={order.order_id}>
                  <div className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5 hover:bg-gray-100 cursor-pointer">
                    <div className="col-span-2 flex items-center">
                      <p className="text-body-sm font-medium text-blue-500">
                        {order.order_id}
                      </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                      <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                        {new Date(order.ordered_date_time).toLocaleDateString()}
                      </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                      <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                        ${order.total_amount.toLocaleString()}
                      </p>
                    </div>
                    <div className="col-span-1 flex items-center">
                      <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                        {order.delivered_confirmation ? "Delivered" : "Pending"}
                      </p>
                    </div>
                    <div className="col-span-1 flex items-center">
                      <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                        {order.expecting_delivery_date
                          ? new Date(order.expecting_delivery_date).toLocaleDateString()
                          : "N/A"}
                      </p>
                    </div>
                  </div>
                </Link>
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
