// src/app/orders/[orderId]/page.tsx
"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation"; // For navigating between routes
import OrderStatus from "@/components/OrderStatus";
import DashboardLayout from "@/components/Layouts/DashboardLayout";

interface OrderDetails {
  id: number;
  status: number; // You might want to set a default status or modify based on your use case
  items: Array<{ id: number; name: string; quantity: number; price: number }>;
  totalAmount: number;
  orderedDateTime: string;
  paymentDocuments: string; // You might want to handle this based on your response
  expectingDeliveryDate: string;
  orderCapacity: number;
}

// Fetch order details from the API
async function fetchOrderDetails(orderId: number): Promise<OrderDetails> {
  const response = await fetch(`/api/get-order-details`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ orderId }),
  });
  
  if (!response.ok) {
    throw new Error("Failed to fetch order details");
  }
  
  const data = await response.json();

  // Adjusting the response structure based on your API response
  const orderItems = data[0]; // The first element contains the order items
  if (!orderItems || orderItems.length === 0) {
    throw new Error("No order items found");
  }

  // Assuming you want to set the first item's status and other details
  const firstOrder = orderItems[0];
  
  return {
    id: firstOrder.order_id,
    status: firstOrder.status || 0, // Default status if not provided
    items: orderItems.map((item: { product_id: number; product_name: string; quantity: number; product_price: number }) => ({
      id: item.product_id,
      name: item.product_name,
      quantity: item.quantity,
      price: item.product_price,
    })),
    totalAmount: firstOrder.total_amount,
    orderedDateTime: firstOrder.ordered_date_time,
    paymentDocuments: "", // Update based on your requirements
    expectingDeliveryDate: firstOrder.expecting_delivery_date,
    orderCapacity: firstOrder.order_capacity,
  };
}

const OrderPage = ({ params }: { params: { orderId: number } }) => {
  const [orderDetails, setOrderDetails] = useState<OrderDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const { orderId } = params;

  useEffect(() => {
    fetchOrderDetails(orderId)
      .then((data) => {
        setOrderDetails(data);
        setLoading(false);
      })
      .catch((error) => {
        console.error(error);
        setLoading(false);
      });
  }, [orderId]);

  if (loading) {
    return <p>Loading order details...</p>;
  }

  if (!orderDetails) {
    return <p>Order not found</p>;
  }

  return (
    <DashboardLayout>
      <div className="container mx-auto p-6">
        <h1 className="text-2xl font-semibold mb-4">
          Order Details - {orderId}
        </h1>

        <OrderStatus 
          currentStage={orderDetails.status}
          orderId={orderDetails.id}
          orderedDateTime={orderDetails.orderedDateTime}
          totalAmount={orderDetails.totalAmount}
          expectingDeliveryDate={orderDetails.expectingDeliveryDate}
          orderCapacity={orderDetails.orderCapacity}
        />

        <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card mt-6">
          <div className="px-4 py-6 md:px-6 xl:px-9">
            <h4 className="text-body-2xlg font-bold text-dark dark:text-white">
              Items Ordered
            </h4>
          </div>

          <div className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5">
            <div className="col-span-3 flex items-center">
              <p className="font-medium">Product Name</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Quantity</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Price</p>
            </div>
            <div className="col-span-1 flex items-center">
              <p className="font-medium">Total</p>
            </div>
          </div>

          {orderDetails.items.map((item, key) => (
            <div
              className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-8 md:px-6 2xl:px-7.5"
              key={key}
            >
              <div className="col-span-3 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                  {item.name}
                </p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                  {item.quantity}
                </p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                  ${item.price}
                </p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                  ${item.price * item.quantity}
                </p>
              </div>
            </div>
          ))}
        </div>

        <div className="mt-6">
          <h2 className="text-xl font-medium">Total: ${orderDetails.totalAmount}</h2>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default OrderPage;
