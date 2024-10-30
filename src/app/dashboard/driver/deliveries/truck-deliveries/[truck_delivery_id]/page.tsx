"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import PercentageBar from "@/components/PercentageBar";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import Link from "next/link";
import { useRouter } from 'next/navigation';

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

    const router = useRouter();

  const { truck_delivery_id } = params;
  const [truckDetail, setTruckDetail] = useState<TruckDetail | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [ordersToDeliver, setOrdersToDeliver] = useState<Order[]>([]);
  const [assignedOrders, setAssignedOrders] = useState<Order[]>([]);
  const [deliveredOrders, setDeliveredOrders] = useState<Order[]>([]);
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

  const fetchAssignedOrders = async () => {
    try {
      const res = await fetch('/api/driver/get-orders-on-current-delivery', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ delivery_id: truck_delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch assigned orders');
      }

      const data = await res.json();
      console.log(data);
      if (Array.isArray(data[0])) {
        setAssignedOrders(data[0]);
      } else {
        throw new Error('Invalid assigned orders data format');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch assigned orders');
    }
  };

  const fetchDeliveredOrders = async () => {
    try {
      const res = await fetch('/api/driver/get-delivered-orders-on-current-delivery', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ delivery_id: truck_delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch assigned orders');
      }

      const data = await res.json();
      console.log(data);
      if (Array.isArray(data[0])) {
        setDeliveredOrders(data[0]);
      } else {
        throw new Error('Invalid assigned orders data format');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch assigned orders');
    }
  };

  
  const fetchAllData = async () => {
    setLoading(true);
    try {
      await fetchTruckDetails();
      await fetchAssignedOrders();
      await fetchDeliveredOrders();
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

  const confirmOrder = async (orderId: number) => {
    try {
      if (!truck_delivery_id) {
        throw new Error('Truck delivery ID not found');
      }

      const res = await fetch('/api/driver/confirm-delivery', {
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

  const handleEndTrip = async () => {
    setLoading(true);
    setError(null);
    setMessage(null);
    try {
      const response = await fetch('/api/driver/end-trip', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ delivery_id: truck_delivery_id }),
      });

      if (!response.ok) {
        throw new Error('Failed to send truck');
      }

      const data = await response.json();
      setMessage(data.message);
      router.push('/dashboard'); // Add redirect here
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
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


        
      </div>
      
        {/* Assigned Orders Section */}
        <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
            <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                Assigned Orders ({assignedOrders.length})
            </h4>

            <div className="flex flex-col">
                <div className="grid grid-cols-6">
                <div className="px-2 pb-3.5">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Order ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Date</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Customer ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Amount</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Store ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Action</h5>
                </div>
                </div>

                {assignedOrders.map((order) => (
                    <div key={order.order_id} className="grid grid-cols-6 border-b border-stroke dark:border-dark-3 cursor-pointer hover:bg-gray-100">
                        <Link href={`/orders/${order.order_id}`} className="col-span-5">
                            <div className="grid grid-cols-5">
                                <div className="flex items-center gap-3.5 px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.order_id}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">
                                        {new Date(order.ordered_date_time).toLocaleDateString()}
                                    </p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.customer_id}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">${order.total_amount}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.nearest_store_id}</p>
                                </div>
                            </div>
                        </Link>
                        <div className="flex items-center justify-center px-2 py-4">
                            <ButtonDefault 
                                label="Confirm Delivery" 
                                onClick={() => confirmOrder(order.order_id)}
                                customClasses="bg-primary text-white rounded-full px-4 py-2"
                            />
                        </div>
                    </div>
                ))}
            </div>
        </div>

        {/* Delivered Orders Section */}
        <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
            <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                Delivered Orders ({deliveredOrders.length})
            </h4>

            <div className="flex flex-col">
                <div className="grid grid-cols-6">
                <div className="px-2 pb-3.5">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Order ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Date</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Customer ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Amount</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Store ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                    <h5 className="text-sm font-medium uppercase xsm:text-base">Action</h5>
                </div>
                </div>

                {deliveredOrders.map((order) => (
                    <div key={order.order_id} className="grid grid-cols-6 border-b border-stroke dark:border-dark-3 cursor-pointer hover:bg-gray-100">
                        <Link href={`/orders/${order.order_id}`} className="col-span-5">
                            <div className="grid grid-cols-5">
                                <div className="flex items-center gap-3.5 px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.order_id}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">
                                        {new Date(order.ordered_date_time).toLocaleDateString()}
                                    </p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.customer_id}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">${order.total_amount}</p>
                                </div>
                                <div className="flex items-center justify-center px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{order.nearest_store_id}</p>
                                </div>
                            </div>
                        </Link>
                        <div className="flex items-center justify-center px-2 py-4">
                            <ButtonDefault 
                                label="Confirm Delivery" 
                                onClick={() => confirmOrder(order.order_id)}
                                customClasses="bg-primary text-white rounded-full px-4 py-2"
                            />
                        </div>
                    </div>
                ))}
            </div>
        </div>

        <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark dark:shadow-card">
            <ButtonDefault 
            label="End Trip" 
            onClick={handleEndTrip}
            customClasses="bg-red text-white rounded-full px-4 py-2"
            />
      </div>
    </DashboardLayout>
  );
};