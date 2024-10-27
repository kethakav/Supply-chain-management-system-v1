// pages/index.tsx
"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import OrderStatus from "@/components/OrderStatus";

interface Order {
  order_id: number;
  stage: number;
  ordered_date_time: string;
  total_amount: number;
  payment_documents: string;
  expecting_delivery_date: string;
  order_capacity: number;
  confirm_payments?: number; // Added optional properties
  recieved_to_store?: number; // Added optional properties
  sent_by_train?: number; // Added optional properties
  delivered_confirmation?: number; // Added optional properties
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

        // Calculate the stage for each order
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
      {orders.length > 0 ? (
        orders.map((order) => (
          <OrderStatus
            key={order.order_id}
            currentStage={order.stage}
            orderId={order.order_id}
            orderedDateTime={order.ordered_date_time}
            totalAmount={order.total_amount}
            expectingDeliveryDate={order.expecting_delivery_date}
            orderCapacity={order.order_capacity}
          />
        ))
      ) : (
        <p>No current orders found.</p>
      )}
    </DashboardLayout>
  );
}
