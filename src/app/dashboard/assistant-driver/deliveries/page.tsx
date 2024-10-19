"use client";

import { Metadata } from "next";
import DefaultLayout from "@/components/Layouts/DefaultLayout";
import React, { useEffect, useState } from "react";

type Delivery = {
    delivery_id: number; // Changed to match the API response
    truck_id: number; // Changed to match the API response
    route_id: number; // Changed to match the API response
    end_point: string; // Added to match the API response
    route_description: string; // Added to match the API response
    distance: number; // Added to match the API response
    max_time: number; // Added to match the API response
};

export default function Home() {
    const [deliveries, setDeliveries] = useState<Delivery[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const astDriverId = 1; // Replace with the actual driver ID you want to fetch

    useEffect(() => {
        const fetchDeliveries = async () => {
            try {
                const response = await fetch(`/api/ast-driver/get-deliveries`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ astDriverId }),
                });
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data = await response.json();
                setDeliveries(data[0]); // Access the first element of the outer array
                console.log(data);
            } catch (err) {
                setError((err as Error).message);
            } finally {
                setLoading(false);
            }
        };

        fetchDeliveries();
    }, [astDriverId]);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error: {error}</p>;

    return (
      <>
        <DefaultLayout>
            <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
                <div className="px-4 py-6 md:px-6 xl:px-9">
                    <h4 className="text-body-2xlg font-bold text-dark dark:text-white">
                    Assigned Deliveries
                    </h4>
                </div>

                <div className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-12 md:px-6 2xl:px-7.5">
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">Delivery ID</p>
                    </div>
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">Truck ID</p>
                    </div>
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">Route ID</p>
                    </div>
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">End Point</p> {/* Added End Point */}
                    </div>
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">Distance</p> {/* Added Distance */}
                    </div>
                    <div className="col-span-2 flex items-center">
                    <p className="font-medium">Max Time</p> {/* Added Max Time */}
                    </div>
                </div>

                {deliveries.map((delivery) => (
                    <div
                    className="grid grid-cols-6 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-12 md:px-6 2xl:px-7.5"
                    key={delivery.delivery_id}
                    >
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.delivery_id}
                        </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.truck_id}
                        </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.route_id}
                        </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.end_point} {/* Display End Point */}
                        </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.distance} km {/* Display Distance */}
                        </p>
                    </div>
                    <div className="col-span-2 flex items-center">
                        <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                            {delivery.max_time} mins {/* Display Max Time */}
                        </p>
                    </div>
                    </div>
                ))}
                </div>
        </DefaultLayout>
      </>
    );
}