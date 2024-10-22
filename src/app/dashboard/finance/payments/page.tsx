"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React from "react";
import SwitcherFour from "@/components/FormElements/Switchers/SwitcherFour";
import SwitcherOne from "@/components/FormElements/Switchers/SwitcherOne";
import SwitcherThree from "@/components/FormElements/Switchers/SwitcherThree";
import SwitcherTwo from "@/components/FormElements/Switchers/SwitcherTwo";
import TableOne from "@/components/Tables/TableOne";
import { BRAND } from "@/types/brand";
import Image from "next/image";
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
    return (
      <>
        <DashboardLayout>
            {/* <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
                <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
                    <h3 className="font-medium text-dark dark:text-white">
                    Toggle switch input
                    </h3>
                </div>
                <div className="flex flex-col gap-5.5 p-6.5">
                    
                    <div className="flex justify-between items-center">
                        <h3 className="font-medium text-dark dark:text-white">Test</h3>
                        <SwitcherOne />
                    </div>
                    
                    <SwitcherTwo />
                    <SwitcherThree />
                    <SwitcherFour />
                </div>
            </div> */}
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
                        key === brandData.length - 1
                            ? ""
                            : "border-b border-stroke dark:border-dark-3"
                        }`}
                        key={key}
                    >
                        <div className="flex items-center gap-3.5 px-2 py-4">
                        {/* <div className="flex-shrink-0">
                            <Image src={brand.logo} alt="Brand" width={48} height={48} />
                        </div> */}
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

                        <div className="mb-7.5 flex flex-wrap gap-5 xl:gap-20 items-center justify-center h-full"> {/* Replaced SwitcherOne with ButtonDefault */}
                        <ButtonDefault 
                            label="Confirm" 
                            onClick={() => console.log("Action")}
                            customClasses="bg-green text-white rounded-full px-10 py-3.5 lg:px-8 xl:px-10"
                        >
                            {/* <svg
                                className="fill-current"
                                width="22"
                                height="22"
                                viewBox="0 0 22 22"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                fillRule="evenodd"
                                clipRule="evenodd"
                                d="M10.9987 2.521C6.31578 2.521 2.51953 6.31725 2.51953 11.0002C2.51953 12.3578 2.8381 13.6391 3.40393 14.7751C3.63103 15.231 3.71848 15.7762 3.57519 16.3118L3.02922 18.3523C2.92895 18.7271 3.2718 19.0699 3.64657 18.9696L5.6871 18.4237C6.22262 18.2804 6.76783 18.3678 7.22378 18.5949C8.3598 19.1608 9.64106 19.4793 10.9987 19.4793C15.6816 19.4793 19.4779 15.6831 19.4779 11.0002C19.4779 6.31725 15.6816 2.521 10.9987 2.521ZM1.14453 11.0002C1.14453 5.55786 5.55639 1.146 10.9987 1.146C16.441 1.146 20.8529 5.55786 20.8529 11.0002C20.8529 16.4425 16.441 20.8543 10.9987 20.8543C9.42358 20.8543 7.93293 20.4843 6.61075 19.8257C6.41345 19.7274 6.21199 19.7066 6.0425 19.7519L4.00197 20.2979C2.60512 20.6717 1.3272 19.3937 1.70094 17.9969L2.24692 15.9564C2.29227 15.7869 2.27142 15.5854 2.17315 15.3881C1.5146 14.0659 1.14453 12.5753 1.14453 11.0002ZM14.2348 8.68069C14.5033 8.94918 14.5033 9.38448 14.2348 9.65296L10.5682 13.3196C10.3035 13.5843 9.87588 13.5886 9.60592 13.3294L7.77258 11.5694C7.49867 11.3065 7.48979 10.8713 7.75274 10.5974C8.0157 10.3235 8.45091 10.3146 8.72481 10.5775L10.0722 11.871L13.2626 8.68069C13.531 8.41221 13.9663 8.41221 14.2348 8.68069Z"
                                fill=""
                                />
                            </svg> */}
                            {/* Optional children can be added here */}
                            {/* <span>Icon</span> */}
                        </ButtonDefault>
                        </div>
                    </div>
                    ))}
                </div>
                </div>
        </DashboardLayout>
      </>
    );
  }