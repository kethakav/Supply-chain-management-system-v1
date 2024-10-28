"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import PercentageBar from "@/components/PercentageBar";
import ButtonDefault from "@/components/Buttons/ButtonDefault";

interface TrainDetail {
  train_id: number;
  destination_store_id: number;
  total_capacity: number;
  departure_day: string;
  departure_time: string;
  arrival_day: string;
  arrival_time: string;
  train_delivery_id: number;
  allocated_capacity: number;
}

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
  delivery_id: number | null;
  delivered_confirmation: number;
  delivered_date_time: string | null;
}

const TrainDetails: React.FC<{ params: { delivery_id: string } }> = ({ params }) => {
  const { delivery_id } = params;
  const [trainDetail, setTrainDetail] = useState<TrainDetail | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [confirmedOrders, setConfirmedOrders] = useState<Order[]>([]);
  const [assignedOrders, setAssignedOrders] = useState<Order[]>([]);
  const [message, setMessage] = useState<string | null>(null);

  const fetchTrainDetails = async () => {
    try {
      const res = await fetch('/api/finance/get-train-details-by-delivery-id', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch train details');
      }

      const data = await res.json();
      // Check if data exists and has the expected structure
      if (data && data[0] && data[0].length > 0) {
        setTrainDetail(data[0][0]);
      } else {
        throw new Error('No train details found');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch train details');
    }
  };

  const fetchConfirmedOrders = async () => {
    try {
      const res = await fetch("/api/finance/get-confirmed-orders", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (!res.ok) {
        throw new Error("Failed to fetch confirmed orders");
      }

      const data = await res.json();
      // Check if data exists and has the expected structure
      if (data && data[0]) {
        setConfirmedOrders(data[0]);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch confirmed orders');
    }
  };

  const fetchAssignedOrders = async () => {
    try {
      const res = await fetch('/api/finance/get-orders-by-delivery-id', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ delivery_id }),
      });

      if (!res.ok) {
        throw new Error('Failed to fetch assigned orders');
      }

      const data = await res.json();
      console.log(data);
      // Ensure we're setting the correct data structure
      if (Array.isArray(data[0])) {
        setAssignedOrders(data[0]);
      } else {
        throw new Error('Invalid assigned orders data format');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch assigned orders');
    }
  };

  const handleSendTrain = async () => {
    setLoading(true);
    setError(null);
    setMessage(null);

    try {
        const response = await fetch('/api/finance/send-train', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ delivery_id }), // Replace with actual delivery_id
        });

        if (!response.ok) {
            throw new Error('Failed to send train');
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
      await Promise.all([
        fetchTrainDetails(),
        fetchConfirmedOrders(),
        fetchAssignedOrders()
      ]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchAllData();
  }, [delivery_id]);

  const addOrderToTrain = async (orderId: number) => {
    try {
      if (!trainDetail?.train_delivery_id) {
        throw new Error('Train delivery ID not found');
      }

      const res = await fetch('/api/finance/add-orders-to-train', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          order_id: orderId,
          train_delivery_id: trainDetail.train_delivery_id,
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

  const removeOrderFromTrain = async (orderId: number) => {
    try {
      if (!trainDetail?.train_delivery_id) {
        throw new Error('Train delivery ID not found');
      }

      const res = await fetch('/api/finance/remove-orders-from-train', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          order_id: orderId,
          train_delivery_id: trainDetail.train_delivery_id,
        }),
      });

      if (!res.ok) {
        throw new Error('Failed to remove order from train delivery');
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
          <div className="text-lg">Loading train details...</div>
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

  if (!trainDetail) {
    return (
      <DashboardLayout>
        <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark">
          <div className="text-lg">No train details found.</div>
        </div>
      </DashboardLayout>
    );
  }

  const filledPercentage = (trainDetail.allocated_capacity / trainDetail.total_capacity) * 100;

  return (
    <DashboardLayout>
      <div className="p-6 bg-white shadow-lg rounded-lg dark:bg-gray-dark dark:shadow-card">
        <h2 className="text-xl font-bold mb-4 text-dark dark:text-white">Train Details</h2>
        
        {/* Train Details Section */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
          <div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Train ID:</strong> {trainDetail.train_id}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Destination Store ID:</strong> {trainDetail.destination_store_id}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Total Capacity:</strong> {trainDetail.total_capacity}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Departure:</strong> {trainDetail.departure_day} at {trainDetail.departure_time}
            </div>
          </div>
          <div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Arrival:</strong> {trainDetail.arrival_day} at {trainDetail.arrival_time}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Train Delivery ID:</strong> {trainDetail.train_delivery_id}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Allocated Capacity:</strong> {trainDetail.allocated_capacity}
            </div>
            <div className="mb-4">
              <strong className="text-dark dark:text-white">Capacity Filled:</strong>
              <div className="w-full md:w-48 mt-2">
                <PercentageBar percentage={filledPercentage} />
              </div>
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
            Confirmed Orders ({confirmedOrders.length})
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
                {confirmedOrders.map((order) => (
                  <tr key={order.order_id} className="border-b dark:border-gray-600">
                    <td className="px-4 py-2 text-center">{order.order_id}</td>
                    <td className="px-4 py-2 text-center">{new Date(order.ordered_date_time).toLocaleDateString()}</td>
                    <td className="px-4 py-2 text-center">{order.customer_id}</td>
                    <td className="px-4 py-2 text-center">${order.total_amount}</td>
                    <td className="px-4 py-2 text-center">{order.nearest_store_id}</td>
                    <td className="px-4 py-2 text-center">
                      <ButtonDefault
                        label="Add to train"
                        onClick={() => addOrderToTrain(order.order_id)}
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
                            label="Remove from train" 
                            onClick={() => removeOrderFromTrain(order.order_id) }
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
                            label="Send Train" 
                            onClick={ handleSendTrain }
                            customClasses="bg-red text-white rounded-full px-4 py-2"
                            />
      </div>
      {/* <button
                onClick={handleSendTrain}
                className={`px-4 py-2 text-white rounded-md ${
                    loading ? 'bg-gray-500' : 'bg-blue-500 hover:bg-blue-600'
                }`}
                disabled={loading}
            ></button> */}
      
    </DashboardLayout>
  );
};

export default TrainDetails;