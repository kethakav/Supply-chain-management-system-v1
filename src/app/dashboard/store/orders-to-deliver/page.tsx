"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useState } from "react";
import SelectGroupThreeV2 from "@/components/FormElements/SelectGroup/SelectGroupThreeV2";
import ButtonDefault from "@/components/Buttons/ButtonDefault";

interface DeliveryOption {
  value: string;
  label: string;
}

type Order = {
  order_id: number;
  destination_address: string;
  total_items: number;
  order_date: string; // Use string for simplicity, can be Date if needed
  assignedDelivery: string; // New property for the assigned delivery
};

// Dummy data for orders
const orderData: Order[] = [
  {
    order_id: 1,
    destination_address: "123 Main St",
    total_items: 5,
    order_date: "2023-10-01",
    assignedDelivery: "", // Default: no delivery assigned
  },
  {
    order_id: 2,
    destination_address: "456 Oak St",
    total_items: 3,
    order_date: "2023-10-02",
    assignedDelivery: "", // Default: no delivery assigned
  },
  {
    order_id: 3,
    destination_address: "789 Pine St",
    total_items: 8,
    order_date: "2023-10-03",
    assignedDelivery: "", // Default: no delivery assigned
  },
];

export default function Home() {
  const [orders, setOrders] = useState(orderData);

  const handleDeliveryChange = (order_id: number, selectedDelivery: string) => {
    setOrders((prevOrders) =>
      prevOrders.map((order) =>
        order.order_id === order_id ? { ...order, assignedDelivery: selectedDelivery } : order
      )
    );
  };

  return (
    <>
      <DashboardLayout>
        <div className="rounded-[10px] border border-stroke bg-white p-4 shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card sm:p-7.5">
          <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
            Orders to Delivery Assignment
          </h4>
          <div className="max-w-full overflow-x-auto">
            <table className="w-full table-auto">
              <thead>
                <tr className="bg-[#F7F9FC] text-left dark:bg-dark-2">
                  <th className="min-w-[220px] px-4 py-4 font-medium text-dark dark:text-white xl:pl-7.5">
                    Order ID
                  </th>
                  <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                    Destination Address
                  </th>
                  <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                    Order Date
                  </th>
                  <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                    Assign Delivery
                  </th>
                </tr>
              </thead>
              <tbody>
                {orders.map((orderItem, index) => (
                  <tr key={index}>
                    <td
                      className={`border-[#eee] px-4 py-4 dark:border-dark-3 xl:pl-7.5 ${
                        index === orders.length - 1 ? "border-b-0" : "border-b"
                      }`}
                    >
                      <h5 className="text-dark dark:text-white">Order {orderItem.order_id}</h5>
                      <p className="mt-[3px] text-body-sm font-medium">
                        Items: {orderItem.total_items}
                      </p>
                    </td>
                    <td
                      className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${
                        index === orders.length - 1 ? "border-b-0" : "border-b"
                      }`}
                    >
                      <p className="text-dark dark:text-white">
                        {orderItem.destination_address}
                      </p>
                    </td>
                    <td
                      className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${
                        index === orders.length - 1 ? "border-b-0" : "border-b"
                      }`}
                    >
                      <p className="text-dark dark:text-white">{orderItem.order_date}</p>
                    </td>
                    <td
                      className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${
                        index === orders.length - 1 ? "border-b-0" : "border-b"
                      }`}
                    >
                      <SelectGroupThreeV2
                        options={[
                          { value: "DEL-001", label: "Delivery 001" },
                          { value: "DEL-002", label: "Delivery 002" },
                          { value: "DEL-003", label: "Delivery 003" },
                        ]}
                        // onChange={(selectedOption: any) =>
                        //   handleDeliveryChange(orderItem.order_id, selectedOption.value)
                        // }
                      />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
            <ButtonDefault
              label="Confirm Assignments"
              onClick={() => console.log("Assignments:", orders)}
              customClasses="bg-green text-white rounded-full px-10 py-3.5 lg:px-8 xl:px-10"
            />
          </div>
        </div>
      </DashboardLayout>
    </>
  );
}
