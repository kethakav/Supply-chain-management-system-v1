"use client";

import { useEffect, useState } from "react";
import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import Link from "next/link"; // Import Link for dynamic routing

interface OrderData {
    order_id: number;
    customer_id: number;
    ordered_date_time: string;
    total_amount: number;
    payment_documents: string;
    // Additional fields can be added here as needed
}

export default function Home() {
    const [orders, setOrders] = useState<OrderData[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const storeId = 1; // Replace with the actual store ID you want to use

    useEffect(() => {
        const fetchOrders = async () => {
            try {
                const response = await fetch("/api/finance/get-unconfirmed-orders", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({ store_id: storeId }),
                });

                if (!response.ok) {
                    throw new Error("Failed to fetch orders");
                }

                const data = await response.json();
                setOrders(data[0]); // Assuming the orders are in the first element of the response
            } catch (error) {
                console.error('Error fetching orders:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchOrders();
    }, [storeId]);

    if (loading) {
        return <div>Loading...</div>; // You can customize your loading state here
    }

    return (
        <DashboardLayout>
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
                    Orders Pending Confirmation
                </h4>

                <div className="flex flex-col">
                    <div className="grid grid-cols-4 sm:grid-cols-6">
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
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">
                                Confirmation
                            </h5>
                        </div>
                    </div>

                    {orders.map((order) => (
                        <div
                            className={`grid grid-cols-4 sm:grid-cols-6 border-b border-stroke dark:border-dark-3`}
                            key={order.order_id}
                        >
                            <div className="flex items-center gap-3.5 px-2 py-4">
                                <p className="hidden font-medium text-dark dark:text-white sm:block">
                                    <Link href={`/orders/${order.order_id}`}>
                                        {`Order #${order.order_id}`}
                                    </Link>
                                </p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">
                                    {new Date(order.ordered_date_time).toLocaleString()}
                                </p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">
                                    {order.customer_id} {/* Assuming customer_id represents the customer, you can modify accordingly */}
                                </p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                                <p className="font-medium text-dark dark:text-white">
                                    {`$${order.total_amount}`} {/* Format amount as currency */}
                                </p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                                <p className="font-medium text-dark dark:text-white">
                                    {order.payment_documents}
                                </p>
                            </div>

                            <div className="mb-7.5 flex flex-wrap gap-5 xl:gap-20 items-center justify-center h-full">
                                <ButtonDefault 
                                    label="Confirm" 
                                    onClick={() => console.log("Confirm action for order", order.order_id)} // Placeholder for action
                                    customClasses="bg-green text-white rounded-full px-10 py-3.5 lg:px-8 xl:px-10"
                                />
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </DashboardLayout>
    );
}
