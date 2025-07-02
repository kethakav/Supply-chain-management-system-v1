"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import OrderStatus from "@/components/OrderStatus";
import DashboardLayout from "@/components/Layouts/DashboardLayout";

interface OrderDetails {
  order_id: number;
  customer_id: number;
  customer_first_name: string;
  customer_last_name: string;
  customer_address: string;
  customer_contact: number;
  ordered_date_time: string;
  total_amount: number;
  order_capacity: number;
  expecting_delivery_date: string;
  route_id: number;
  route_details: string;
  delivery_id: number;
  confirm_payments: boolean;
  sent_by_train: boolean;
  recieved_to_store: boolean;
  delivered_confirmation: boolean;
  delivered_date_time: string | null;
  items: Array<{
    product_id: number;
    product_name: string;
    quantity: number;
    product_price: number;
    unit_price: number;
    total_product_price: number;
  }>;
}

function calculateOrderStage(orderDetails: OrderDetails): number {
  if (orderDetails.delivered_confirmation) {
    return 3; // Delivered
  }
  
  if (orderDetails.sent_by_train || orderDetails.recieved_to_store) {
    return 2; // Shipped
  }
  
  if (orderDetails.confirm_payments) {
    return 1; // Processing
  }
  
  return 0; // Order Placed
}

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
  
  if (!data[0] || data[0].length === 0) {
    throw new Error("No order details found");
  }

  // Get the order items from the first array in the response
  const orderItems = data[0];
  const firstItem = orderItems[0];

  // Transform the items array
  const items = orderItems.map((item: any) => ({
    product_id: item.product_id,
    product_name: item.product_name,
    quantity: item.quantity,
    product_price: item.product_price,
    unit_price: item.unit_price,
    total_product_price: item.total_product_price,
  }));

  // Create the order details object using the first item for order-level information
  return {
    order_id: firstItem.order_id,
    customer_id: firstItem.customer_id,
    customer_first_name: firstItem.customer_first_name,
    customer_last_name: firstItem.customer_last_name,
    customer_address: firstItem.customer_address,
    customer_contact: firstItem.customer_contact,
    ordered_date_time: firstItem.ordered_date_time,
    total_amount: firstItem.total_amount,
    order_capacity: firstItem.order_capacity,
    expecting_delivery_date: firstItem.expecting_delivery_date,
    route_id: firstItem.route_id,
    route_details: firstItem.route_details,
    delivery_id: firstItem.delivery_id,
    confirm_payments: Boolean(firstItem.confirm_payments),
    sent_by_train: Boolean(firstItem.sent_by_train),
    recieved_to_store: Boolean(firstItem.recieved_to_store),
    delivered_confirmation: Boolean(firstItem.delivered_confirmation),
    delivered_date_time: firstItem.delivered_date_time,
    items: items,
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
    return <div className="flex items-center justify-center min-h-screen">
      <p className="text-lg">Loading order details...</p>
    </div>;
  }

  if (!orderDetails) {
    return <div className="flex items-center justify-center min-h-screen">
      <p className="text-lg">Order not found</p>
    </div>;
  }

  const currentStage = calculateOrderStage(orderDetails);

  return (
    <DashboardLayout>
      <div className="container mx-auto p-6">
        <div className="flex justify-between items-center mb-6">
          <h1 className="text-2xl font-semibold">
            Order #{orderDetails.order_id}
          </h1>
          <div className="text-right">
            <p className="font-medium">Order Date: {new Date(orderDetails.ordered_date_time).toLocaleDateString()}</p>
            <p className="text-gray-600">Expected Delivery: {new Date(orderDetails.expecting_delivery_date).toLocaleDateString()}</p>
            {orderDetails.delivered_date_time && (
              <p className="text-green-600">Delivered: {new Date(orderDetails.delivered_date_time).toLocaleString()}</p>
            )}
          </div>
        </div>

        <OrderStatus 
          currentStage={currentStage}
          orderId={orderDetails.order_id}
          orderedDateTime={orderDetails.ordered_date_time}
          totalAmount={orderDetails.total_amount}
          expectingDeliveryDate={orderDetails.expecting_delivery_date}
          orderCapacity={orderDetails.order_capacity}
        />

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 my-6">
          {/* Customer Information */}
          <div className="bg-white rounded-lg shadow-1 p-6 dark:bg-gray-dark">
            <h2 className="text-xl font-semibold mb-4">Customer Information</h2>
            <div className="space-y-2">
              <p><span className="font-medium">Name:</span> {orderDetails.customer_first_name} {orderDetails.customer_last_name}</p>
              <p><span className="font-medium">Address:</span> {orderDetails.customer_address}</p>
              <p><span className="font-medium">Contact No:</span> {orderDetails.customer_contact}</p>
              <p><span className="font-medium">Customer ID:</span> {orderDetails.customer_id}</p>
            </div>
          </div>

          {/* Delivery Information */}
          <div className="bg-white rounded-lg shadow-1 p-6 dark:bg-gray-dark">
            <h2 className="text-xl font-semibold mb-4">Delivery Information</h2>
            <div className="space-y-2">
              <p><span className="font-medium">Route ID:</span> {orderDetails.route_id}</p>
              <p><span className="font-medium">Route Details:</span> {orderDetails.route_details}</p>
              <p><span className="font-medium">Delivery ID:</span> {orderDetails.delivery_id || "Not yet assigned"}</p>
              <p><span className="font-medium">Order Capacity:</span> {orderDetails.order_capacity}</p>
              {orderDetails.sent_by_train && <p className="text-blue-600">✓ Sent by Train</p>}
              {orderDetails.recieved_to_store && <p className="text-blue-600">✓ Received at Store</p>}
            </div>
          </div>
        </div>

        {/* Order Items */}
        <div className="rounded-lg bg-white shadow-1 dark:bg-gray-dark mt-6">
          <div className="px-6 py-4">
            <h2 className="text-xl font-semibold">Order Items</h2>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="border-t border-stroke dark:border-dark-3">
                <tr className="bg-gray-50 dark:bg-gray-800">
                  <th className="px-6 py-4 text-left font-medium">Product Name</th>
                  <th className="px-6 py-4 text-center font-medium">Quantity</th>
                  <th className="px-6 py-4 text-right font-medium">Unit Price</th>
                  <th className="px-6 py-4 text-right font-medium">Total</th>
                </tr>
              </thead>
              <tbody>
                {orderDetails.items.map((item, index) => (
                  <tr key={index} className="border-t border-stroke dark:border-dark-3">
                    <td className="px-6 py-4">{item.product_name}</td>
                    <td className="px-6 py-4 text-center">{item.quantity}</td>
                    <td className="px-6 py-4 text-right">${item.unit_price.toLocaleString()}</td>
                    <td className="px-6 py-4 text-right">${item.total_product_price.toLocaleString()}</td>
                  </tr>
                ))}
              </tbody>
              <tfoot className="border-t border-stroke dark:border-dark-3">
                <tr className="font-medium">
                  <td colSpan={3} className="px-6 py-4 text-right">Total Amount:</td>
                  <td className="px-6 py-4 text-right">${orderDetails.total_amount.toLocaleString()}</td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default OrderPage;