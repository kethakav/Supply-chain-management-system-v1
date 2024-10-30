"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import Image from "next/image";
import ButtonDefault from "@/components/Buttons/ButtonDefault"; // Assuming you have a button component
import Loader from "@/components/common/Loader";

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

export default function Home() {
  const [unconfirmedOrders, setUnconfirmedOrders] = useState<Order[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchUnconfirmedOrders = async () => {
      try {
        const response = await fetch("/api/finance/get-confirmed-orders", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch unconfirmed orders");
        }

        const data = await response.json();
        setUnconfirmedOrders(data);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchUnconfirmedOrders();
  }, []);

  if (loading) {
    return (
      <Loader />
    );
  }

  return (
    <DashboardLayout>
      <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
        <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
          Confirmed Orders
        </h4>

        <div className="flex flex-col">
          <div className="grid grid-cols-5 sm:grid-cols-7">
            <div className="px-2 pb-3.5">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Order ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Ordered Date Time</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Customer ID</h5>
            </div>
            <div className="hidden px-2 pb-3.5 text-center sm:block">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Total Amount</h5>
            </div>
            <div className="hidden px-2 pb-3.5 text-center sm:block">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Nearest Store ID</h5>
            </div>
            <div className="hidden px-2 pb-3.5 text-center sm:block">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Payment Documents</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Confirmation</h5>
            </div>
          </div>

          {loading ? (
            <div className="text-center py-4">Loading...</div>
          ) : error ? (
            <div className="text-center py-4 text-red-500">{error}</div>
          ) : (
            unconfirmedOrders.map((order, index) => (
              <div
                className={`grid grid-cols-5 sm:grid-cols-7 border-t border-stroke px-4 py-4.5 dark:border-dark-3`}
                key={order.order_id}
              >
                <div className="px-2 pb-3.5">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">Order #{order.order_id}</p>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    {new Date(order.ordered_date_time).toLocaleString()}
                  </p>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.customer_id}</p>
                </div>
                <div className="hidden px-2 pb-3.5 text-center sm:block">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">${order.total_amount}</p>
                </div>
                <div className="hidden px-2 pb-3.5 text-center sm:block">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.nearest_store_id}</p>
                </div>
                <div className="hidden px-2 pb-3.5 text-center sm:block">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{order.payment_documents}</p>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <ButtonDefault
                    label="Confirm"
                    customClasses="bg-green text-white rounded-full px-10 py-3.5 lg:px-8 xl:px-10"
                    onClick={() => console.log(`Confirm order ${order.order_id}`)}
                  />
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </DashboardLayout>
  );
}
