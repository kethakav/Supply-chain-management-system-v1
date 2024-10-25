// pages/index.tsx
"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import OrderStatus from "@/components/OrderStatus";

// Define the order interface for TypeScript
interface Order {
  order_id: number;
  stage: number; // This will be calculated based on order status
  ordered_date_time: string; // Date and time of the order
  total_amount: number; // Total amount of the order
  payment_documents: string; // Payment documents associated with the order
  expecting_delivery_date: string; // Expected delivery date
  order_capacity: number; // Capacity of the order
}

export default function Home() {
  const [orders, setOrders] = useState<Order[]>([]); // State to store orders
  const [currentOrder, setCurrentOrder] = useState<Order | null>(null); // State for the current order

  // Load user data and fetch orders on component mount
  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser = JSON.parse(storedUser);
      fetchOrders(parsedUser.id); // Fetch orders using user ID
    }
  }, []);

  // Function to fetch orders based on user ID
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
  
      // Access the first element of the returned array
      if (Array.isArray(data) && typeof data[0] === 'object') {
        const ordersObj = data[0]; // The first element contains the orders as an object
        // Extract values that are of type Order
        const ordersArray: Order[] = Object.values(ordersObj).filter(
          (order): order is Order => typeof order === 'object' && order !== null
        );
  
        console.log("Orders Array:", ordersArray); // Log the extracted orders array
  
        setOrders(ordersArray); // Set all orders to state
  
        // Optionally set the current order based on the first order (if available)
        if (ordersArray.length > 0) {
          setCurrentOrder(ordersArray[0]); // Set the first order as the current order
          console.log("Current Order Set:", ordersArray[0]); // Log the current order
        } else {
          console.log("No orders found in the orders array."); // Log if the orders array is empty
        }
      } else {
        console.log("Data is not in the expected format."); // Log if the data structure is unexpected
      }
    } catch (error) {
      console.error("Failed to fetch orders:", error);
    }
  };

  return (
    <DashboardLayout>
      {/* Check if there are orders to display */}
      {orders.length > 0 ? (
        orders.map((order) => (
          <OrderStatus
            key={order.order_id} // Use order_id as a unique key
            currentStage={order.stage}
            orderId={order.order_id}
            orderedDateTime={order.ordered_date_time}
            totalAmount={order.total_amount}
            paymentDocuments={order.payment_documents}
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
