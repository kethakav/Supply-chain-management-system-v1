"use client";

import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Loader from "@/components/common/Loader";

interface DriverData {
    id: number;
    name: string;
    worked_hours: number;
    type: string;
}

interface TruckData {
    id: number;
    vehicle_number: number;
    worked_hours: number;
}

interface User {
    id: number;
    type: string;
    store_ID: number;
}

export default function DriverDashboard() {
    const [drivers, setDrivers] = useState<DriverData[]>([]);
    const [trucks, setTrucks] = useState<TruckData[]>([]);
    const [loading, setLoading] = useState<boolean>(true);

    useEffect(() => {
        const fetchDriversAndTrucks = async () => {
            try {
                const storedUser = localStorage.getItem("user");
                if (storedUser) {
                    const parsedUser: User = JSON.parse(storedUser);
                    setLoading(true);

                    const response = await fetch('/api/store-mg/get-working-hours', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ store_id: parsedUser.store_ID })
                    });

                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    const data = await response.json();
                    console.log(data);

                    // Filter and set drivers and trucks from the response data
                    const filteredDrivers = data.results.filter((item: any) => item.type === "Driver" || item.type === "Assistant Driver");
                    const filteredTrucks = data.results.filter((item: any) => item.type === "Truck");

                    setDrivers(filteredDrivers.map((driver: any) => ({
                        id: driver.id,
                        name: driver.name,
                        worked_hours: driver.worked_hours,
                        type: driver.type
                    })));

                    setTrucks(filteredTrucks.map((truck: any) => ({
                        id: truck.id,
                        vehicle_number: truck.vehicle_number,
                        worked_hours: truck.worked_hours
                    })));
                }
            } catch (error) {
                console.error('Error fetching data:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchDriversAndTrucks();
    }, []);

    if (loading) {
        return <Loader />;
    }

    // Separate drivers, assistant drivers, and trucks
    const mainDrivers = drivers.filter(driver => driver.type === "Driver");
    const assistantDrivers = drivers.filter(driver => driver.type === "Assistant Driver");

    const renderTable = (title: string, data: any[], columns: string[]) => (
        <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card mb-6">
            <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">{title}</h4>
            <div className="flex flex-col">
                <div className="grid grid-cols-3 sm:grid-cols-3">
                    {columns.map((col, index) => (
                        <div key={index} className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">{col}</h5>
                        </div>
                    ))}
                </div>

                {data.map((item, key) => (
                    <div
                        className={`grid grid-cols-3 sm:grid-cols-3 ${
                            key === data.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                        }`}
                        key={item.id}
                    >
                        {columns.map((col, index) => (
                            <div key={index} className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{item[col.toLowerCase().replace(" ", "_")]}</p>
                            </div>
                        ))}
                    </div>
                ))}
            </div>
        </div>
    );

    return (
        <DashboardLayout>
            <Breadcrumb pageName="Driver Management" />
            {renderTable("Drivers", mainDrivers, ["ID", "Name", "Worked Hours"])}
            {renderTable("Assistant Drivers", assistantDrivers, ["ID", "Name", "Worked Hours"])}
            {renderTable("Trucks", trucks, ["ID", "Vehicle Number", "Worked Hours"])}
        </DashboardLayout>
    );
}
