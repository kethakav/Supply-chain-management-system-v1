"use client";

import DashboardLayout from "@/components/Layouts/DashboardLayout";
import { useEffect, useState } from "react";
import Link from 'next/link';

interface StoreData {
    store_id: number;
    store_city: string;
    truck_count: string;
}

export default function HRDashboard() {
    const [managers, setManagers] = useState<StoreData[]>([]);
    const [loading, setLoading] = useState<boolean>(true);

    useEffect(() => {
        const fetchManagers = async () => {
            try {
                const response = await fetch('/api/hr/get-stores');
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data: [StoreData[]] = await response.json();
                setManagers(data[0]);
            } catch (error) {
                console.error('Error fetching stores:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchManagers();
    }, []);

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Managers
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-3 sm:grid-cols-3">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Store ID</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Store City</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Truck Count</h5>
                        </div>
                    </div>
                    {managers.map((manager, key) => (
                        <Link href={`/dashboard/hr/store/id/${manager.store_id}`} key={manager.store_id}>
                            <div
                                className={`grid grid-cols-3 sm:grid-cols-3 ${
                                    key === managers.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                                }`}
                            >
                                <div className="flex items-center gap-3.5 px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{manager.store_id}</p>
                                </div>
                                <div className="flex items-center gap-3.5 px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{manager.store_city}</p>
                                </div>
                                <div className="flex items-center gap-3.5 px-2 py-4">
                                    <p className="font-medium text-dark dark:text-white">{manager.truck_count}</p>
                                </div>
                            </div>
                        </Link>
                    ))}
                </div>
            </div>
        </DashboardLayout>
    );
}