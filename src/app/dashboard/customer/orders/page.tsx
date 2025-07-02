// pages/index.tsx
"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import OrderStatus from "@/components/OrderStatus";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Link from "next/link";

interface Order {
  order_id: number;
  stage: number;
  ordered_date_time: string;
  total_amount: number;
  payment_documents: string;
  expecting_delivery_date: string;
  order_capacity: number;
  confirm_payments?: number;
  recieved_to_store?: number;
  sent_by_train?: number;
  delivered_confirmation?: number;
}

export default function Home() {
  const [orders, setOrders] = useState<Order[]>([]);
  const [currentOrder, setCurrentOrder] = useState<Order | null>(null);

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser = JSON.parse(storedUser);
      fetchOrders(parsedUser.id);
    }
  }, []);

  const fetchOrders = async (userId: number) => {
    try {
      const response = await fetch("/api/get-current-orders", {
        method: "POST",
        body: JSON.stringify({ customer_ID: userId }),
        headers: {
          "Content-Type": "application/json",
        },
      });

      const data = await response.json();
      console.log("Response Data:", data);

      if (Array.isArray(data) && typeof data[0] === "object") {
        const ordersObj = data[0];
        const ordersArray: Order[] = Object.values(ordersObj).filter(
          (order): order is Order => typeof order === "object" && order !== null
        );

        const ordersWithStages = ordersArray.map((order) => {
          let stage = 0;
          if (order.confirm_payments === 1) {
            if (order.recieved_to_store === 1 || order.sent_by_train === 1) {
              stage = 2;
            } else {
              stage = 1;
            }
            if (order.delivered_confirmation === 1) {
              stage = 3;
            }
          }
          return { ...order, stage };
        });

        console.log("Orders with Stages:", ordersWithStages);

        setOrders(ordersWithStages);

        if (ordersWithStages.length > 0) {
          setCurrentOrder(ordersWithStages[0]);
          console.log("Current Order Set:", ordersWithStages[0]);
        } else {
          console.log("No orders found in the orders array.");
        }
      } else {
        console.log("Data is not in the expected format.");
      }
    } catch (error) {
      console.error("Failed to fetch orders:", error);
    }
  };

  return (
    <DashboardLayout>
      <Breadcrumb pageName="Active Orders" />
      {orders.length > 0 ? (
        orders.map((order) => (
          <Link href={`/orders/${order.order_id}`} key={order.order_id}>
            <div className="flex flex-col bg-white p-6 rounded-lg shadow-1 dark:bg-gray-dark cursor-pointer mb-4"> {/* Added mb-4 for margin-bottom */}
              <div className="flex justify-between items-center mb-6">
                <h1 className="text-2xl font-semibold">
                  Order #{order.order_id}
                </h1>
                <div className="text-right">
                  <p className="font-medium">Order Date: {new Date(order.ordered_date_time).toLocaleDateString()}</p>
                  <p className="text-gray-600">Expected Delivery: {new Date(order.expecting_delivery_date).toLocaleDateString()}</p>
                </div>
              </div>
              
              <OrderStatus
                currentStage={order.stage}
                orderId={order.order_id}
                orderedDateTime={order.ordered_date_time}
                totalAmount={order.total_amount}
                expectingDeliveryDate={order.expecting_delivery_date}
                orderCapacity={order.order_capacity}
              />
              <h2 className="pt-9 text-xl font-semibold mb-4 text-green-600">Total: {order.total_amount}</h2>
            </div>
          </Link>
        ))
      ) : (
        <p>No current orders found.</p>
      )}
    </DashboardLayout>
  );
}
