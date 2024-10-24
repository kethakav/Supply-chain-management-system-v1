"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useState } from "react"; // Import useState
import SwitcherOne from "@/components/FormElements/Switchers/SwitcherOne";
import TableOne from "@/components/Tables/TableOne";
import { BRAND } from "@/types/brand";
import ButtonDefault from "@/components/Buttons/ButtonDefault";

interface OrderData {
    logo: string;
    orderId: string; // Order ID
    orderedDateTime: string; // Ordered Date Time
    totalAmount: string; // Total Amount
    paymentDocuments: string; // Payment Documents
    confirmation: string; // Confirmation
    customer: string; // Customer
}

// Update the brandData to use the new OrderData type
const brandData: OrderData[] = [
    {
      logo: "/images/brand/brand-01.svg",
      orderId: "Order #001",
      orderedDateTime: "2023-10-01 10:00 AM",
      totalAmount: "$5,768",
      paymentDocuments: "Document #001",
      confirmation: "Confirmed",
      customer: "john_doe", // Random username
    },
    {
      logo: "/images/brand/brand-02.svg",
      orderId: "Order #002",
      orderedDateTime: "2023-10-02 11:30 AM",
      totalAmount: "$4,635",
      paymentDocuments: "Document #002",
      confirmation: "Pending",
      customer: "jane_smith", // Random username
    },
    {
      logo: "/images/brand/brand-03.svg",
      orderId: "Order #003",
      orderedDateTime: "2023-10-03 01:15 PM",
      totalAmount: "$4,290",
      paymentDocuments: "Document #003",
      confirmation: "Confirmed",
      customer: "alice_jones", // Random username
    },
    {
      logo: "/images/brand/brand-04.svg",
      orderId: "Order #004",
      orderedDateTime: "2023-10-04 03:45 PM",
      totalAmount: "$3,580",
      paymentDocuments: "Document #004",
      confirmation: "Pending",
      customer: "bob_brown", // Random username
    },
    {
      logo: "/images/brand/brand-05.svg",
      orderId: "Order #005",
      orderedDateTime: "2023-10-05 09:20 AM",
      totalAmount: "$2,740",
      paymentDocuments: "Document #005",
      confirmation: "Confirmed",
      customer: "charlie_black", // Random username
    },
];

export default function Home() {
    // Create a state array for managing toggle states
    const [toggleStates, setToggleStates] = useState<boolean[]>(Array(brandData.length).fill(false));

    const handleToggleChange = (index: number) => {
        const newToggleStates = [...toggleStates];
        newToggleStates[index] = !newToggleStates[index];
        setToggleStates(newToggleStates);
    };

    return (
      <>
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Orders Pending Confirmation
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-4 sm:grid-cols-6"> {/* Updated column count */}
                    <div className="px-2 pb-3.5">
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Order ID
                        </h5>
                    </div>
                    <div className="px-2 pb-3.5 text-center">
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Ordered Date Time
                        </h5>
                    </div>
                    <div className="px-2 pb-3.5 text-center">
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Customer
                        </h5>
                    </div>
                    <div className="hidden px-2 pb-3.5 text-center sm:block">
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Total Amount
                        </h5>
                    </div>
                    <div className="hidden px-2 pb-3.5 text-center sm:block">
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Payment Documents
                        </h5>
                    </div>
                    <div className="px-2 pb-3.5 text-center"> {/* New header for Confirmation */}
                        <h5 className="text-sm font-medium uppercase xsm:text-base">
                        Confirmation
                        </h5>
                    </div>
                    </div>

                    {brandData.map((brand, key) => (
                        <div
                            className={`grid grid-cols-4 sm:grid-cols-6 ${
                            key === brandData.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={key}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                            <p className="hidden font-medium text-dark dark:text-white sm:block">
                                {brand.orderId}
                            </p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                            <p className="font-medium text-dark dark:text-white">
                                {brand.orderedDateTime}
                            </p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                            <p className="font-medium text-dark dark:text-white">
                                {brand.customer}
                            </p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                            <p className="font-medium text-dark dark:text-white">
                                {brand.totalAmount}
                            </p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                            <p className="font-medium text-dark dark:text-white">
                                {brand.paymentDocuments}
                            </p>
                            </div>

                            <div className="mb-7.5 flex flex-wrap gap-5 xl:gap-20 items-center justify-center h-full">
                            <SwitcherOne
                                enabled={toggleStates[key]}
                                onToggle={() => handleToggleChange(key)}
                                id={`toggle-switch-${key}`} // Pass a unique ID for each toggle
                            />
                            </div>
                        </div>
                        ))}
                </div>

                <div className="flex justify-center mt-5">
                    <ButtonDefault 
                        label="Confirm" 
                        onClick={() => console.log("Confirming orders:", toggleStates)}
                        customClasses="bg-blue-600 text-white rounded-full px-10 py-3.5"
                    />
                </div>
            </div>
        </DashboardLayout>
      </>
    );
}
