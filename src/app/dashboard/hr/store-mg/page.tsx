"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import React, { useEffect, useState } from "react";
import { useRouter } from 'next/navigation';


interface ManagerData {
    manager_id: number; // Unique identifier for the manager
    store_id: number; // Store ID
    manager_first_name: string; // Manager's first name
    manager_last_name: string; // Manager's last name
    manager_contact: number; // Manager's contact number
    manager_email: string; // Manager's email
}

export default function HRDashboard() {
    const router = useRouter(); // Initialize useRouter
    const [managers, setManagers] = useState<ManagerData[]>([]); // Start with an empty array for managers
    const [loading, setLoading] = useState<boolean>(true); // Loading state

    useEffect(() => {
        const fetchManagers = async () => {
            try {
                const response = await fetch('/api/hr/get-store-managers');
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data: [ManagerData[]] = await response.json();
                setManagers(data[0]); // Extract the first element which contains manager details
            } catch (error) {
                console.error('Error fetching store managers:', error);
            } finally {
                setLoading(false); // Set loading to false after fetching
            }
        };

        fetchManagers();
    }, []);

    const handleRemoveManager = async (id: number) => {
        const confirmRemove = window.confirm("Are you sure you want to remove this manager?");
        if (!confirmRemove) return; // Exit if the user cancels

        try {
            const response = await fetch('/api/hr/remove-managers', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    input_table: 'manager',
                    input_id: id,
                }),
            });

            if (!response.ok) {
                throw new Error('Failed to remove manager');
            }

            // Optionally, re-fetch managers after a successful deletion
            setManagers((prevManagers) => prevManagers.filter(manager => manager.manager_id !== id));
            console.log('Manager removed successfully');
        } catch (error) {
            console.error('Error removing manager:', error);
        }
    };

    const handleAddManager = () => {
        router.push("/dashboard/hr/store-mg/add-account"); // Redirect to the add account page
    };

    if (loading) {
        return <div>Loading...</div>; // Show loading message while data is being fetched
    }

    return (
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Finance & Order Managers
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-6 sm:grid-cols-6"> {/* Change columns to 5 for additional data */}
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">First Name</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Last Name</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Store ID</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Contact</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Email</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Actions</h5>
                        </div>
                    </div>

                    {managers.map((manager, key) => (
                        <div
                            className={`grid grid-cols-6 sm:grid-cols-6 ${
                                key === managers.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={manager.manager_id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.manager_first_name}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.manager_last_name}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.store_id}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.manager_contact}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{manager.manager_email}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <ButtonDefault 
                                    label="Remove" 
                                    onClick={() => handleRemoveManager(manager.manager_id)} // Hooking the button to the remove functionality
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Store Manager" 
                        onClick={handleAddManager} // Attach the redirect function
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>
            </div>
        </DashboardLayout>
    );
}
