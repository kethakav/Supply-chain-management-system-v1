"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import PercentageBar from "@/components/PercentageBar";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";

interface TruckDetail {
  truck_delivery_id: number;
  sent_datetime: string | null;
  completed: number;
  truck_id: number;
  vehicle_number: number;
  truck_availability: number;
  driver_id: number;
  driver_name: string;
  driver_contact: number;
  ast_driver_id: number;
  assistant_driver_name: string;
  assistant_driver_contact: number;
  route_id: number;
  route_end_point: string;
  route_description: string;
  route_distance: number;
  route_max_time: number;
  store_id: number;
  store_city: string;
  store_truck_count: number;
}

// Keep existing Order interface
interface Order {
  order_id: number;
  customer_id: number;
  ordered_date_time: string;
  total_amount: number;
  payment_documents: string;
  order_capacity: number;
  expecting_delivery_date: string;
  nearest_store_id: number;
  route_id: number;
  route_description_input: string;
  finance_manager_id: number | null;
  confirm_payments: number;
  sent_by_train: number;
  train_delivery_id: number | null;
  recieved_to_store: number;
  truck_delivery_id: number | null;
  delivered_confirmation: number;
  delivered_date_time: string | null;
}

interface PageProps {
  params: {
    truck_delivery_id: string;
  };
}

interface User {
  id: number;
  type: string;
  store_ID: number;
}

export default function TruckDeliveryDetailsPage({ params }: PageProps) {
  const { truck_delivery_id } = params;
  const [truckDetail, setTruckDetail] = useState<TruckDetail | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [ordersToDeliver, setOrdersToDeliver] = useState<Order[]>([]);
  const [assignedOrders, setAssignedOrders] = useState<Order[]>([]);
  const [message, setMessage] = useState<string | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [userLoaded, setUserLoaded] = useState<boolean>(false);

  // First, load the user data
  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser: User = JSON.parse(storedUser);
      setUser(parsedUser);
    }
    setUserLoaded(true); // Mark user loading as complete, even if no user was found
  }, []);

  const fetchTruckDetails = async () => {
    try {
      const res = await fetch('/api/get-truck-delivery-details', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ truck_delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch truck details');
      }

      const data = await res.json();
      if (data && data.length > 0) {
        setTruckDetail(data[0]);
      } else {
        throw new Error('No truck details found');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch truck details');
    }
  };

  const fetchOrdersToDeliver = async () => {
    if (!user?.store_ID) {
      console.error("Store ID is not available");
      setError("Store ID is not available. Please ensure you're properly logged in.");
      return;
    }

    try {
      const res = await fetch("/api/store-mg/orders-to-deliver", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ store_id: user.store_ID }),
      });

      if (!res.ok) {
        throw new Error("Failed to fetch confirmed orders");
      }

      const data = await res.json();
      if (data && data[0]) {
        setOrdersToDeliver(data[0]);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch confirmed orders');
    }
  };

  const fetchAssignedOrders = async () => {
    try {
      const res = await fetch('/api/store-mg/get-orders-by-truck-delivery-id', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ truck_delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch assigned orders');
      }

      const data = await res.json();
      if (Array.isArray(data[0])) {
        setAssignedOrders(data[0]);
      } else {
        throw new Error('Invalid assigned orders data format');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch assigned orders');
    }
  };

  const handleSendTruck = async () => {
    setLoading(true);
    setError(null);
    setMessage(null);

    try {
      const response = await fetch('/api/store-mg/send-truck', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ truck_delivery_id }),
      });

      if (!response.ok) {
        throw new Error('Failed to send truck');
      }

      const data = await response.json();
      setMessage(data.message);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  };

  const fetchAllData = async () => {
    setLoading(true);
    try {
      await fetchTruckDetails();
      if (user?.store_ID) {
        await fetchOrdersToDeliver();
      }
      await fetchAssignedOrders();
    } finally {
      setLoading(false);
    }
  };

  // Only fetch data once user is loaded and truck_delivery_id is available
  useEffect(() => {
    if (userLoaded && truck_delivery_id) {
      fetchAllData();
    }
  }, [userLoaded, truck_delivery_id, user?.store_ID]);

  const addOrderToTruck = async (orderId: number) => {
    try {
      if (!truck_delivery_id) {
        throw new Error('Truck delivery ID not found');
      }

      const res = await fetch('/api/store-mg/add-orders-to-truck', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          order_id: orderId,
          truck_delivery_id: truck_delivery_id,
        }),
      });

      if (!res.ok) {
        throw new Error('Failed to add order to train delivery');
      }

      const data = await res.json();
      setMessage(data.message || 'Order added successfully!');
      // Refresh the data after successful addition
      fetchAllData();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to add order');
    }
  };

  const removeOrderFromTruck = async (orderId: number) => {
    try {
      if (!truck_delivery_id) {
        throw new Error('Train delivery ID not found');
      }

      const res = await fetch('/api/store-mg/remove-orders-from-truck', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          order_id: orderId,
        }),
      });

      if (!res.ok) {
        throw new Error('Failed to remove order from truck delivery');
      }

      const data = await res.json();
      setMessage(data.message || 'Order removed successfully!');
      // Refresh the data after successful addition
      fetchAllData();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Failed to remove order');
    }
  };

  if (loading) {
    return (
      <DashboardLayout>
        <div className="flex items-center justify-center h-screen">
          <div className="text-lg">Loading truck details...</div>
        </div>
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark">
          <div className="text-red-500">Error: {error}</div>
        </div>
      </DashboardLayout>
    );
  }

  if (!truckDetail) {
    return (
      <DashboardLayout>
        <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark">
          <div className="text-lg">No truck details found.</div>
        </div>
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
    <Breadcrumb pageName={`Truck Delivery ${truck_delivery_id}`} />
      <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark dark:shadow-card">
        <h2 className="text-xl font-bold mb-4 text-dark dark:text-white">Truck Details</h2>
        
        {/* Truck Details Section */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
          <div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Truck ID:</strong> {truckDetail.truck_id}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Vehicle Number:</strong> {truckDetail.vehicle_number}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Driver Name:</strong> {truckDetail.driver_name}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Driver Contact:</strong> {truckDetail.driver_contact}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Assistant Driver:</strong> {truckDetail.assistant_driver_name}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Assistant Contact:</strong> {truckDetail.assistant_driver_contact}
            </div>
          </div>
          <div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Route End Point:</strong> {truckDetail.route_end_point}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Route Description:</strong> {truckDetail.route_description}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Route Distance:</strong> {truckDetail.route_distance} km
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Max Time:</strong> {truckDetail.route_max_time} minutes
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Store City:</strong> {truckDetail.store_city}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Store Truck Count:</strong> {truckDetail.store_truck_count}
            </div>
          </div>
        </div>

        {message && (
          <div className="mb-4 p-3 bg-green-100 text-green-700 rounded">
            {message}
          </div>
        )}

        {/* Confirmed Orders Section */}
        <div className="mb-8">
          <h4 className="text-xl font-bold mb-4 text-dark dark:text-white">
            Confirmed Orders ({ordersToDeliver.length})
          </h4>
          <div className="overflow-x-auto">
            <table className="min-w-full">
              <thead className="bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th className="px-4 py-2">Order ID</th>
                  <th className="px-4 py-2">Date</th>
                  <th className="px-4 py-2">Customer ID</th>
                  <th className="px-4 py-2">Amount</th>
                  <th className="px-4 py-2">Store ID</th>
                  <th className="px-4 py-2">Action</th>
                </tr>
              </thead>
              <tbody>
                {ordersToDeliver.map((order) => (
                  <tr key={order.order_id} className="border-b dark:border-gray-600">
                    <td className="px-4 py-2 text-center">{order.order_id}</td>
                    <td className="px-4 py-2 text-center">{new Date(order.ordered_date_time).toLocaleDateString()}</td>
                    <td className="px-4 py-2 text-center">{order.customer_id}</td>
                    <td className="px-4 py-2 text-center">${order.total_amount}</td>
                    <td className="px-4 py-2 text-center">{order.nearest_store_id}</td>
                    <td className="px-4 py-2 text-center">
                      <ButtonDefault
                        label="Add to truck"
                        onClick={() => addOrderToTruck(order.order_id) } //addOrderToTrain(order.order_id)
                        customClasses="bg-primary text-white rounded-full px-4 py-2"
                      />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Assigned Orders Section */}
        <div>
          <h4 className="text-xl font-bold mb-4 text-dark dark:text-white">
            Assigned Orders ({assignedOrders.length})
          </h4>
          <div className="overflow-x-auto">
            <table className="min-w-full">
              <thead className="bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th className="px-4 py-2">Order ID</th>
                  <th className="px-4 py-2">Date</th>
                  <th className="px-4 py-2">Customer ID</th>
                  <th className="px-4 py-2">Amount</th>
                  <th className="px-4 py-2">Store ID</th>
                  <th className="px-4 py-2">Action</th>
                </tr>
              </thead>
              <tbody>
                {assignedOrders.map((order) => (
                  <tr key={order.order_id} className="border-b dark:border-gray-600">
                    <td className="px-4 py-2 text-center">{order.order_id}</td>
                    <td className="px-4 py-2 text-center">{new Date(order.ordered_date_time).toLocaleDateString()}</td>
                    <td className="px-4 py-2 text-center">{order.customer_id}</td>
                    <td className="px-4 py-2 text-center">${order.total_amount}</td>
                    <td className="px-4 py-2 text-center">{order.nearest_store_id}</td>
                        <td className="px-2 py-3.5 text-center">
                        <ButtonDefault 
                            label="Remove from truck" 
                            onClick={() =>  removeOrderFromTruck(order.order_id)} //removeOrderFromTrain(order.order_id)
                            customClasses="bg-primary text-white rounded-full px-4 py-2"
                            />
                
                        </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          
        </div>
        
      </div>
      <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark dark:shadow-card">
        <ButtonDefault 
          label="Send Truck" 
          onClick={handleSendTruck}
          customClasses="bg-red text-white rounded-full px-4 py-2"
        />
      </div>
    </DashboardLayout>
  );
};