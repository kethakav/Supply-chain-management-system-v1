"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React from "react";
import TableOne from "@/components/Tables/TableOne";
import TableTwo from "@/components/Tables/TableTwo";
import TableThree from "@/components/Tables/TableThree";
import { Package } from "@/types/package";
import MultiSelect from "@/components/FormElements/MultiSelect";
import ButtonDefault from "@/components/Buttons/ButtonDefault";

interface Option {
    value: string;
    text: string;
    selected: boolean;
    element?: HTMLElement;
  }

type Train = {
    train_id: number;
    destination_store_id: number;
    total_capacity: number;
    departure: string; // Use string for simplicity, can be Date if needed
    arrival: string; // Use string for simplicity, can be Date if needed
    selectedOptions: Option[]; // New property for selected orders
};

// Dummy data for trains with selected orders
const trainData: Train[] = [
    {
        train_id: 1,
        destination_store_id: 101,
        total_capacity: 200,
        departure: "2023-10-01T10:00:00",
        arrival: "2023-10-01T12:00:00",
        selectedOptions: [
            { value: "1", text: "Order 1", selected: false },
            { value: "2", text: "Order 2", selected: false },
            { value: "3", text: "Order 3", selected: false },
            { value: "4", text: "Order 4", selected: false },
          ], // Example selected orders
    },
    {
        train_id: 2,
        destination_store_id: 102,
        total_capacity: 150,
        departure: "2023-10-02T11:00:00",
        arrival: "2023-10-02T13:00:00",
        selectedOptions: [
            { value: "1", text: "Order 1", selected: false },
            { value: "2", text: "Order 2", selected: false },
            { value: "3", text: "Order 3", selected: false },
            { value: "4", text: "Order 4", selected: false },
          ], // Example selected orders
    },
    {
        train_id: 3,
        destination_store_id: 103,
        total_capacity: 300,
        departure: "2023-10-03T09:00:00",
        arrival: "2023-10-03T11:00:00",
        selectedOptions: [
            { value: "1", text: "Order 1", selected: false },
            { value: "2", text: "Order 2", selected: false },
            { value: "3", text: "Order 3", selected: false },
            { value: "4", text: "Order 4", selected: false },
          ], // Initialize with empty array
    },
];


export default function Home() {
    return (
      <>
        <DashboardLayout>
            <div className="rounded-[10px] border border-stroke bg-white p-4 shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card sm:p-7.5">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Manage Trains
                </h4>
                <div className="max-w-full overflow-x-auto">
                    <table className="w-full table-auto">
                    <thead>
                        <tr className="bg-[#F7F9FC] text-left dark:bg-dark-2">
                        <th className="min-w-[220px] px-4 py-4 font-medium text-dark dark:text-white xl:pl-7.5">
                            Train ID {/* Updated column title */}
                        </th>
                        <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                            Destination Store {/* New column header */}
                        </th>
                        <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                            Departure
                        </th>
                        <th className="min-w-[150px] px-4 py-4 font-medium text-dark dark:text-white">
                            Select Orders {/* Updated column title */}
                        </th>
                        {/* <th className="px-4 py-4 text-right font-medium text-dark dark:text-white xl:pr-7.5">
                            Confirm
                        </th> */}
                        </tr>
                    </thead>
                    <tbody>
                        {trainData.map((trainItem, index) => (
                        <tr key={index}>
                            <td
                            className={`border-[#eee] px-4 py-4 dark:border-dark-3 xl:pl-7.5 ${index === trainData.length - 1 ? "border-b-0" : "border-b"}`}
                            >
                            <h5 className="text-dark dark:text-white">
                                Train {trainItem.train_id}
                            </h5>
                            <p className="mt-[3px] text-body-sm font-medium">
                                Capacity: {trainItem.total_capacity}
                            </p>
                            </td>
                            <td
                            className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${index === trainData.length - 1 ? "border-b-0" : "border-b"}`}
                            >
                            <p className="text-dark dark:text-white">
                                Store {trainItem.destination_store_id} {/* Display destination store ID */}
                            </p>
                            </td>
                            <td
                            className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${index === trainData.length - 1 ? "border-b-0" : "border-b"}`}
                            >
                            <p className="text-dark dark:text-white">
                                {trainItem.departure}
                            </p>
                            </td>
                            <td
                            className={`border-[#eee] px-4 py-4 dark:border-dark-3 ${index === trainData.length - 1 ? "border-b-0" : "border-b"}`}
                            >
                            <MultiSelect id={`multiSelect-${trainItem.train_id}`} options={trainItem.selectedOptions} />
                            </td>
                            {/* <td
                            className={`border-[#eee] px-4 py-4 dark:border-dark-3 xl:pr-7.5 ${index === trainData.length - 1 ? "border-b-0" : "border-b"}`}
                            >
                            </td> */}
                        </tr>
                        ))} 
                    </tbody>
                    </table>
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
          {/* <TableTwo /> */}
        </DashboardLayout>
      </>
    );
}