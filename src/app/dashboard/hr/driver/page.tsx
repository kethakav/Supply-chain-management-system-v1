"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import React, { useState } from "react";

interface ManagerData {
    id: number; // Unique identifier for the manager
    name: string; // Manager's name
    email: string; // Manager's email
    department: string; // Manager's department
}

const initialManagers: ManagerData[] = [
    { id: 1, name: "Alice Johnson", email: "alice@example.com", department: "Finance" },
    { id: 2, name: "Bob Smith", email: "bob@example.com", department: "Order Management" },
    { id: 3, name: "Charlie Brown", email: "charlie@example.com", department: "Finance" },
    { id: 4, name: "Diana Prince", email: "diana@example.com", department: "Order Management" },
];

export default function HRDashboard() {
    const [managers, setManagers] = useState<ManagerData[]>(initialManagers);

    const handleRemove = (id: number) => {
        setManagers(managers.filter(manager => manager.id !== id));
    };

    const handleAddManager = () => {
        const newId = managers.length + 1;
        const newManager = {
            id: newId,
            name: `New Manager ${newId}`,
            email: `newmanager${newId}@example.com`,
            department: "Finance",
        };
        setManagers([...managers, newManager]);
    };

    return (
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Driver
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-4 sm:grid-cols-4">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Name</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Email</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Department</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Actions</h5>
                        </div>
                    </div>

                    {managers.map((manager, key) => (
                        <div
                            className={`grid grid-cols-4 sm:grid-cols-4 ${
                                key === managers.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={manager.id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.name}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.email}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.department}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <ButtonDefault 
                                    label="Remove" 
                                    onClick={() => handleRemove(manager.id)}
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Driver" 
                        onClick={handleAddManager}
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>
            </div>
        </DashboardLayout>
    );
}
