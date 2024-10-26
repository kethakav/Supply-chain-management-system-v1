// app/dashboard/hr/store/id/[store_id]/page.tsx

"use client";

import { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import { useRouter } from 'next/navigation';


interface StoreData {
    store_id: number;
    store_city: string;
    truck_count: string;
}

interface ManagerData {
    manager_id: number; // Unique identifier for the manager
    store_id: number; // Store ID
    manager_first_name: string; // Manager's first name
    manager_last_name: string; // Manager's last name
    manager_contact: number; // Manager's contact number
    manager_email: string; // Manager's email
}

interface DriverData {
    driver_id: number; // Unique identifier for the driver
    store_id: number; // Store ID
    driver_first_name: string; // Driver's first name
    driver_last_name: string; // Driver's last name
    driver_contact: number; // Driver's contact number
    driver_email: string; // Driver's email
    worked_hours: number; // Driver's worked hours
    availability: number; // Driver's availability (1 or 0  - 1 for available, 0 for unavailable)
}

interface AstDriverData {
    ast_driver_id: number; // Unique identifier for the driver
    store_id: number; // Store ID
    ast_driver_first_name: string; // Driver's first name
    ast_driver_last_name: string; // Driver's last name
    ast_driver_contact: number; // Driver's contact number
    ast_driver_email: string; // Driver's email
    worked_hours: number; // Driver's worked hours
    availability: number; // Driver's availability (1 or 0  - 1 for available, 0 for unavailable)
}

interface TruckData {
    truck_id: number; // Unique identifier for the driver
    store_id: number; // Store ID
    vehicle_number: number;
    availability: number; // Driver's availability (1 or 0  - 1 for available, 0 for unavailable)
}

export default function StoreDetails({
    params,
}: {
    params: { store_id: string };
}) {
    const [store, setStore] = useState<StoreData | null>(null);
    const [managers, setManagers] = useState<ManagerData[]>([]);
    const [drivers, setDrivers] = useState<DriverData[]>([]);
    const [trucks, setTrucks] = useState<TruckData[]>([]);
    const [astDrivers, setAstDrivers] = useState<AstDriverData[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const router = useRouter(); // Initialize useRouter


    useEffect(() => {
        const fetchStore = async () => {
            try {
                const response = await fetch(`/api/hr/get-store?store_id=${params.store_id}`);
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                const data: StoreData = await response.json();
                setStore(data);
            } catch (error) {
                console.error("Error fetching store:", error);
            }
        };

        const fetchManagers = async () => {
            try {
                const response = await fetch('/api/hr/get-store-managers', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        store_id: params.store_id,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data: ManagerData[] = await response.json();
                setManagers(data);
            } catch (error) {
                console.error('Error fetching store managers:', error);
            } finally {
                setLoading(false);
            }
        };

        const fetchDrivers = async () => { // New function to fetch drivers
            try {
                const response = await fetch('/api/hr/get-drivers', { // Update the endpoint accordingly
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        store_id: params.store_id,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data: DriverData[] = await response.json();
                console.log(data);
                setDrivers(data); // Set the drivers state with the fetched data
            } catch (error) {
                console.error('Error fetching store drivers:', error);
            }
        };

        const fetchTrucks = async () => { // New function to fetch drivers
            try {
                const response = await fetch('/api/hr/get-trucks', { // Update the endpoint accordingly
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        store_id: params.store_id,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data: TruckData[] = await response.json();
                console.log(data);
                setTrucks(data); // Set the drivers state with the fetched data
            } catch (error) {
                console.error('Error fetching trucks:', error);
            }
        };

        const fetchAstDrivers = async () => { // New function to fetch drivers
            try {
                const response = await fetch('/api/hr/get-ast-drivers', { // Update the endpoint accordingly
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        store_id: params.store_id,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data: AstDriverData[] = await response.json();
                console.log(data);
                setAstDrivers(data); // Set the drivers state with the fetched data
            } catch (error) {
                console.error('Error fetching store drivers:', error);
            }
        };

        fetchStore();
        fetchManagers();
        fetchDrivers();
        fetchAstDrivers();
        fetchTrucks();
    }, [params.store_id]);

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

            // Update state to remove the manager from the UI
            setManagers((prevManagers) => prevManagers.filter(manager => manager.manager_id !== id));
            console.log('Manager removed successfully');
        } catch (error) {
            console.error('Error removing manager:', error);
        }
    };

    const handleRemoveDriver = async (id: number) => { // New function to remove a driver
        const confirmRemove = window.confirm("Are you sure you want to remove this driver?");
        if (!confirmRemove) return;

        try {
            const response = await fetch('/api/hr/remove-drivers', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    input_table: 'driver',
                    input_id: id,
                }),
            });

            if (!response.ok) {
                throw new Error('Failed to remove driver');
            }

            // Update state to remove the driver from the UI
            setDrivers((prevDrivers) => prevDrivers.filter(driver => driver.driver_id !== id));
            console.log('Driver removed successfully');
        } catch (error) {
            console.error('Error removing driver:', error);
        }
    };

    const handleRemoveAstDriver = async (id: number) => { // New function to remove a driver
        const confirmRemove = window.confirm("Are you sure you want to remove this assistant driver?");
        if (!confirmRemove) return;

        try {
            const response = await fetch('/api/hr/remove-drivers', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    input_table: 'assistant_driver',
                    input_id: id,
                }),
            });

            if (!response.ok) {
                throw new Error('Failed to remove driver');
            }

            // Update state to remove the driver from the UI
            setAstDrivers((prevDrivers) => prevDrivers.filter(driver => driver.ast_driver_id !== id));
            console.log('Driver removed successfully');
        } catch (error) {
            console.error('Error removing driver:', error);
        }
    };

    const handleRemoveTruck = async (id: number) => { // New function to remove a driver
        const confirmRemove = window.confirm("Are you sure you want to remove this truck?");
        if (!confirmRemove) return;

        try {
            const response = await fetch('/api/hr/remove-properties', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    input_table: 'truck',
                    input_id: id,
                }),
            });

            if (!response.ok) {
                throw new Error('Failed to remove driver');
            }

            // Update state to remove the driver from the UI
            setTrucks((prevTrucks) => prevTrucks.filter(truck => truck.truck_id !== id));
            console.log('Truck removed successfully');
        } catch (error) {
            console.error('Error removing truck:', error);
        }
    };

    const handleAddManager = () => {
        // Redirect to add manager page (update the route as necessary)
        router.push(`/dashboard/hr/store/id/${params.store_id}/add-manager`);
    };

    const handleAddDriver = () => {
        // Redirect to add driver page (update the route as necessary)
        router.push(`/dashboard/hr/store/id/${params.store_id}/add-driver`);
    };

    const handleAddAstDriver = () => {
        // Redirect to add driver page (update the route as necessary)
        router.push(`/dashboard/hr/store/id/${params.store_id}/add-ast-driver`);
    };

    const handleAddTruck = () => {
        // Redirect to add driver page (update the route as necessary)
        router.push(`/dashboard/hr/store/id/${params.store_id}/add-truck`);
    };

    if (loading) return <div>Loading...</div>;
    if (!store) return <div>Store not found</div>;

    return (
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Details
                </h4>
                <p><strong>Store ID:</strong> {store.store_id}</p>
                <p><strong>City:</strong> {store.store_city}</p>
                <p><strong>Truck Count:</strong> {store.truck_count}</p>

                <h4 className="mt-8 mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Managers
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-6 sm:grid-cols-6">
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
                                    onClick={() => handleRemoveManager(manager.manager_id)}
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Store Manager" 
                        onClick={handleAddManager}
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>

                {/* Drivers Table */}
                <h4 className="mt-8 mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Drivers
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-7 sm:grid-cols-7">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">First Name</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Last Name</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Contact</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Email</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Worked Hours</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Availability</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Actions</h5>
                        </div>
                    </div>

                    {drivers.map((driver, key) => (
                        <div
                            className={`grid grid-cols-7 sm:grid-cols-7 ${
                                key === drivers.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={driver.driver_id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.driver_first_name}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.driver_last_name}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.driver_contact}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.driver_email}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.worked_hours}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.availability}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <ButtonDefault 
                                    label="Remove" 
                                    onClick={() => handleRemoveDriver(driver.driver_id)}
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Driver" 
                        onClick={handleAddDriver}
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>

                {/* Ast Drivers Table */}
                <h4 className="mt-8 mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Assistant Drivers
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-7 sm:grid-cols-7">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">First Name</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Last Name</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Contact</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Email</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Worked Hours</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Availability</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Actions</h5>
                        </div>
                    </div>

                    {astDrivers.map((driver, key) => (
                        <div
                            className={`grid grid-cols-7 sm:grid-cols-7 ${
                                key === astDrivers.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={driver.ast_driver_id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.ast_driver_first_name}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.ast_driver_last_name}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.ast_driver_contact}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.ast_driver_email}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.worked_hours}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{driver.availability}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <ButtonDefault 
                                    label="Remove" 
                                    onClick={() => handleRemoveAstDriver(driver.ast_driver_id)}
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Assistant Driver" 
                        onClick={handleAddAstDriver}
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>

                {/* Trucks Table */}
                <h4 className="mt-8 mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Store Trucks
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-7 sm:grid-cols-7">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Truck ID</h5>
                        </div>
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Vehicle Number</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Availability</h5>
                        </div>
                    </div>

                    {trucks.map((truck, key) => (
                        <div
                            className={`grid grid-cols-7 sm:grid-cols-7 ${
                                key === trucks.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={truck.truck_id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{truck.truck_id}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{truck.vehicle_number}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{truck.availability}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <ButtonDefault 
                                    label="Remove" 
                                    onClick={() => handleRemoveTruck(truck.truck_id)}
                                    customClasses="bg-red-500 text-white rounded-full px-4 py-2"
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <div className="mt-5">
                    <ButtonDefault 
                        label="Add Assistant Driver" 
                        onClick={handleAddTruck}
                        customClasses="bg-green text-white rounded-full px-8 py-3"
                    />
                </div>
            </div>
        </DashboardLayout>
    );
}
