// src/app/orders/[orderId]/page.tsx
"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation"; // For navigating between routes
import OrderStatus from "@/components/OrderStatus";
import DashboardLayout from "@/components/Layouts/DashboardLayout";

interface OrderDetails {
  id: string;
  status: number;
  items: Array<{ id: number; name: string; quantity: number; price: number }>;
  totalAmount: number;
}

// Mock API call to fetch order details (replace with real API call)
async function fetchOrderDetails(orderId: string): Promise<OrderDetails> {
  const mockData = {
    id: orderId,
    status: 3, // current stage of the order
    items: [
      { id: 1, name: "Product 1", quantity: 2, price: 100 },
      { id: 2, name: "Product 2", quantity: 1, price: 50 },
    ],
    totalAmount: 250,
  };
  return new Promise((resolve) => setTimeout(() => resolve(mockData), 1000));
}

const OrderPage = ({ params }: { params: { orderId: string } }) => {
  const [orderDetails, setOrderDetails] = useState<OrderDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const { orderId } = params; // Dynamic parameter from URL

  useEffect(() => {
    // Fetch order details based on the dynamic orderId
    fetchOrderDetails(orderId).then((data) => {
      setOrderDetails(data);
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

        {/* Order status component */}
        <OrderStatus currentStage={orderDetails.status} />

        {/* Order Items Table */}
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

        {/* Total Amount */}
        <div className="mt-6">
          <h2 className="text-xl font-medium">Total: ${orderDetails.totalAmount}</h2>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default OrderPage;
