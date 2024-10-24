"use client";

import { useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import SelectGroupThreeV2 from "@/components/FormElements/SelectGroup/SelectGroupThreeV2";
import DatePickerTwo from "@/components/FormElements/DatePicker/DatePickerTwo";

// Example truck delivery data
const initialDeliveries = [
  {
    driver: "John Doe",
    assistant: "Jane Doe",
    truck: "Truck 01",
    route: "Route A",
    departureDate: "2024-10-20",
    orders: ["Order 1", "Order 2", "Order 3"],
  },
  {
    driver: "Mike Ross",
    assistant: "Rachel Zane",
    truck: "Truck 02",
    route: "Route B",
    departureDate: "2024-10-21",
    orders: ["Order 4", "Order 5"],
  },
  {
    driver: "Harvey Specter",
    assistant: "Donna Paulsen",
    truck: "Truck 03",
    route: "Route C",
    departureDate: "2024-10-22",
    orders: ["Order 6"],
  },
];

export default function Home() {
  const [formData, setFormData] = useState({
    driver: "",
    assistant: "",
    truck: "",
    route: "",
    departureDate: "",
    orders: [],
  });

  const [deliveries, setDeliveries] = useState(initialDeliveries);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setDeliveries((prevDeliveries) => [...prevDeliveries, formData]);
  };

  const handleRemoveDelivery = (index: number) => {
    setDeliveries((prevDeliveries) => prevDeliveries.filter((_, i) => i !== index));
  };

  return (
    <DashboardLayout>
      <div className="grid grid-cols-1 gap-9 sm:grid-cols-1">
        <div className="flex flex-col gap-9">
          {/* New Delivery Form */}
          <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
            <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
              <h3 className="font-semibold text-dark dark:text-white">New Delivery</h3>
            </div>
            <form onSubmit={handleSubmit}>
              <div className="p-6.5">
                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                  Select Driver
                </label>
                <SelectGroupThreeV2
                  // name="driver"
                  // onChange={handleChange}
                  options={[
                    { value: "John Doe", label: "John Doe" },
                    { value: "Mike Ross", label: "Mike Ross" },
                    { value: "Harvey Specter", label: "Harvey Specter" },
                  ]}
                />

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                  Select Assistant Driver
                </label>
                <SelectGroupThreeV2
                  // name="assistant"
                  // onChange={handleChange}
                  options={[
                    { value: "Jane Doe", label: "Jane Doe" },
                    { value: "Rachel Zane", label: "Rachel Zane" },
                    { value: "Donna Paulsen", label: "Donna Paulsen" },
                  ]}
                />

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                  Select Truck
                </label>
                <SelectGroupThreeV2
                  // name="truck"
                  // onChange={handleChange}
                  options={[
                    { value: "Truck 01", label: "Truck 01" },
                    { value: "Truck 02", label: "Truck 02" },
                    { value: "Truck 03", label: "Truck 03" },
                  ]}
                />

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                  Select Route
                </label>
                <SelectGroupThreeV2
                  options={[
                    { value: "Route A", label: "Route A" },
                    { value: "Route B", label: "Route B" },
                    { value: "Route C", label: "Route C" },
                  ]}
                />

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                  Departure Date
                </label>
                <DatePickerTwo />

                <button className="mt-4 w-full justify-center rounded-[7px] bg-primary p-[13px] font-medium text-white hover:bg-opacity-90">
                  Add Delivery
                </button>
              </div>
            </form>
          </div>
        </div>

        {/* Existing Deliveries with Orders */}
        <div className="flex flex-col gap-9">
          {deliveries.map((delivery, index) => (
            <div
              key={index}
              className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card"
            >
              <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
                <h3 className="font-semibold text-dark dark:text-white">
                  Delivery by {delivery.driver}
                </h3>
                <p className="text-sm text-dark dark:text-white">
                  Assistant: {delivery.assistant}, Truck: {delivery.truck}, Route: {delivery.route}
                </p>
                <p className="text-sm text-dark dark:text-white">
                  Departure Date: {delivery.departureDate}
                </p>
              </div>
              <div className="p-6.5">
                <h4 className="font-semibold text-dark dark:text-white">Assigned Orders</h4>
                <ul className="mb-4">
                  {delivery.orders.map((order, orderIndex) => (
                    <li key={orderIndex} className="text-dark dark:text-white">
                      {order}
                    </li>
                  ))}
                </ul>

                <button
                  onClick={() => handleRemoveDelivery(index)}
                  className="mt-2 w-full justify-center rounded-[7px] bg-red-600 p-[13px] font-medium text-white hover:bg-opacity-90"
                >
                  Remove Delivery
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </DashboardLayout>
  );
}
