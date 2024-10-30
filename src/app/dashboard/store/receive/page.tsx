"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useState, useEffect } from "react";
import SwitcherOne from "@/components/FormElements/Switchers/SwitcherOne";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Loader from "@/components/common/Loader";

interface OrderData {
    orderId: number;
    orderedDateTime: string;
    totalAmount: string;
    paymentDocuments: string;
    confirmation: string;
    customer: string;
}

interface User {
    id: number;
    type: string;
    store_ID: number;
}

export default function Home() {
    const [orders, setOrders] = useState<OrderData[]>([]);
    const [toggleStates, setToggleStates] = useState<boolean[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [user, setUser] = useState<User | null>(null);
    const [selectedOrderIds, setSelectedOrderIds] = useState<number[]>([]);
    const [error, setError] = useState<string | null>(null); // State for error messages

    useEffect(() => {
        const fetchOrders = async () => {
            try {
                setLoading(true);
                const storedUser = localStorage.getItem("user");
                if (storedUser) {
                    const parsedUser: User = JSON.parse(storedUser);
                    setUser(parsedUser);

                    const response = await fetch("/api/store-mg/orders-to-recieve", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify({ store_ID: parsedUser.store_ID }),
                    });

                    if (!response.ok) {
                        throw new Error('Failed to fetch orders');
                    }

                    const data = await response.json();
                    const formattedOrders = data[0].map((order: any) => ({
                        orderId: order.order_id,
                        orderedDateTime: new Date(order.ordered_date_time).toLocaleString(),
                        totalAmount: `$${order.total_amount.toLocaleString()}`,
                        paymentDocuments: order.payment_documents || "N/A",
                        confirmation: order.confirm_payments ? "Confirmed" : "Pending",
                        customer: `Customer #${order.customer_id}`,
                    }));

                    setOrders(formattedOrders);
                    setToggleStates(Array(formattedOrders.length).fill(false));
                }
            } catch (error) {
                setError((error as Error).message); // Set error message
                console.error("Error fetching orders:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchOrders();
    }, []);

    const handleToggleChange = (index: number, orderId: number) => {
        const newToggleStates = [...toggleStates];
        newToggleStates[index] = !newToggleStates[index];

        if (newToggleStates[index]) {
            setSelectedOrderIds((prev) => [...prev, orderId]); // Add orderId to selected
        } else {
            setSelectedOrderIds((prev) => prev.filter(id => id !== orderId)); // Remove orderId from selected
        }

        setToggleStates(newToggleStates);
    };

    const handleConfirmOrders = async () => {
        try {
            const response = await fetch('/api/store-mg/confirm-orders', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ orderIds: selectedOrderIds }),
            });

            if (!response.ok) {
                throw new Error('Failed to confirm orders');
            }

            // Remove confirmed orders from the local state
            setOrders((prevOrders) => prevOrders.filter(order => !selectedOrderIds.includes(order.orderId)));
            setSelectedOrderIds([]); // Clear selected orders
            setToggleStates((prevStates) => prevStates.filter((_, index) => !selectedOrderIds.includes(orders[index].orderId)));

            // Optionally refetch data if needed
            // fetchOrders(); // Uncomment if you want to refetch all orders after confirmation
        } catch (error) {
            setError((error as Error).message); // Set error message
            console.error(error);
        }
    };

    if (loading) {
        return (
          <Loader />
        );
      }

    return (
        <DashboardLayout>
            <Breadcrumb pageName="Recieve Inventory" />
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Orders Pending Confirmation
                </h4>

                {error && <p className="text-red-600">{error}</p>} {/* Display error message */}

                <div className="flex flex-col">
                    <div className="grid grid-cols-4 sm:grid-cols-6">
                        <div className="px-2 pb-3.5">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Order ID</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Ordered Date Time</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Customer</h5>
                        </div>
                        <div className="hidden px-2 pb-3.5 text-center sm:block">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Total Amount</h5>
                        </div>
                        <div className="hidden px-2 pb-3.5 text-center sm:block">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Payment Documents</h5>
                        </div>
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">Confirmation</h5>
                        </div>
                    </div>

                    {orders.map((order, key) => (
                        <div
                            className={`grid grid-cols-4 sm:grid-cols-6 ${
                                key === orders.length - 1 ? "" : "border-b border-stroke dark:border-dark-3"
                            }`}
                            key={key}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="hidden font-medium text-dark dark:text-white sm:block">{order.orderId}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{order.orderedDateTime}</p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">{order.customer}</p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                                <p className="font-medium text-dark dark:text-white">{order.totalAmount}</p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                                <p className="font-medium text-dark dark:text-white">{order.paymentDocuments}</p>
                            </div>

                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <SwitcherOne
                                    enabled={toggleStates[key]}
                                    onToggle={() => handleToggleChange(key, order.orderId)}
                                    id={`toggle-switch-${key}`}
                                />
                            </div>
                        </div>
                    ))}
                </div>

                <ButtonDefault 
                    label="Confirm" 
                    onClick={handleConfirmOrders}
                    customClasses="bg-blue-600 text-white rounded-full px-10 py-3.5"
                />
            </div>
        </DashboardLayout>
    );
}
