"use client";

import { useEffect, useState } from "react";
import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import ButtonDefault from "@/components/Buttons/ButtonDefault";
import Link from "next/link"; // Import Link for dynamic routing
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Loader from "@/components/common/Loader";

interface OrderData {
    order_id: number;
    customer_id: number;
    ordered_date_time: string;
    total_amount: number;
    payment_documents: string;
    nearest_store_id: number;
    // Additional fields can be added here as needed
}

interface User {
    id: number;
    type: string;
}

export default function Home() {
    const [orders, setOrders] = useState<OrderData[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [user, setUser] = useState<User | null>(null);
    // const storeId = 1; // Replace with the actual store ID you want to use

    useEffect(() => {
        const storedUser = localStorage.getItem("user");
        if (storedUser) {
          const parsedUser: User = JSON.parse(storedUser);
          setUser(parsedUser);
        }
      }, []);

    useEffect(() => {
        const fetchOrders = async () => {
            try {
                const response = await fetch("/api/finance/get-unconfirmed-orders", {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    // body: JSON.stringify({ store_id: storeId }),
                });

                if (!response.ok) {
                    throw new Error("Failed to fetch orders");
                }

                const data = await response.json();
                setOrders(data[0]); // Assuming the orders are in the first element of the response
            } catch (error) {
                console.error("Error fetching orders:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchOrders();
    }, []);

    const handleConfirm = async (order_id: number) => {
        try {
            const response = await fetch("/api/finance/confirm-order", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    order_id,
                    finance_manager_id: user?.id, // Replace with actual finance manager ID if available
                }),
            });

            if (!response.ok) {
                throw new Error("Failed to confirm payment");
            }

            // Remove the confirmed order from the orders list
            setOrders((prevOrders) => prevOrders.filter((order) => order.order_id !== order_id));
        } catch (error) {
            console.error("Error confirming payment:", error);
        }
    };

    if (loading) {
        return (
          <Loader />
        );
      }

    return (
        <DashboardLayout>
            <Breadcrumb pageName="Pending Orders" />
            <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
                
                <div className="flex flex-col">
                    <div className="grid grid-cols-4 sm:grid-cols-7">
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
                        <div className="px-2 pb-3.5 text-center">
                            <h5 className="text-sm font-medium uppercase xsm:text-base">
                                Store ID
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
                            className={`grid grid-cols-4 sm:grid-cols-7 border-b border-stroke dark:border-dark-3`}
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
                                    {order.customer_id}
                                </p>
                            </div>

                            <div className="flex items-center justify-center px-2 py-4">
                                <p className="font-medium text-dark dark:text-white">
                                    {order.nearest_store_id}
                                </p>
                            </div>

                            <div className="hidden items-center justify-center px-2 py-4 sm:flex">
                                <p className="font-medium text-dark dark:text-white">
                                    {`$${order.total_amount}`}
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
                                    onClick={() => handleConfirm(order.order_id)} 
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
