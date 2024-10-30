"use client";

import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";

interface User {
  id: number;
  type: string;
  store_ID: number;
}

export default function Home() {
  const [data, setData] = useState({ ordersToDeliver: 0, ordersToReceive: 0 });
  const [loading, setLoading] = useState<boolean>(true);
  const [user, setUser] = useState<User | null>(null);

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser: User = JSON.parse(storedUser);
      setUser(parsedUser);
    }
  }, []);
  
  useEffect(() => {
    const fetchData = async () => {
      if (!user) return; // Ensure user is set

      try {
        const response = await fetch("/api/store-mg/get-overview", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ store_ID: user.store_ID }), // Use store_ID from user
        });

        if (response.ok) {
          const result = await response.json();
          setData({
            ordersToDeliver: result.ordersToDeliver,
            ordersToReceive: result.ordersToReceive,
          });
        } else {
          console.error("Failed to fetch data from API");
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [user]); // Run only after user is set

  return (
    <DashboardLayout>
      <Breadcrumb pageName="Overview" />
      <div className="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
        <div className="flex gap-4 md:gap-6 2xl:gap-7.5">
          <div className="flex flex-col gap-4 md:gap-6 2xl:gap-7.5 w-full md:w-1/3">
            <h2 className="text-xl font-semibold text-dark dark:text-white">Orders</h2>

            <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
              <div className="flex items-center">
                <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#3FD97F] text-2xl font-bold text-white">
                  {data.ordersToReceive}
                </div>
                <div className="ml-4">
                  <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                    To Receive
                  </h4>
                </div>
              </div>
            </div>

            <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
              <div className="flex items-center">
                <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#FF9C55] text-2xl font-bold text-white">
                  {data.ordersToDeliver}
                </div>
                <div className="ml-4">
                  <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                    To Deliver
                  </h4>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}
