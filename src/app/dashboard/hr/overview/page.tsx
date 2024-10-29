"use client";

import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React, { useEffect, useState } from "react";

type CountKeys = 'drivers' | 'managers' | 'stores' | 'trucks';

const dataStatsList = [
  {
    color: "#3FD97F",
    title: "Total Drivers",
    dataKey: "drivers"
  },
  {
    color: "#FF9C55",
    title: "Total Managers",
    dataKey: "managers"
  },
  {
    color: "#8155FF",
    title: "Total Stores",
    dataKey: "stores"
  },
  {
    color: "#18BFFF",
    title: "Total Trucks",
    dataKey: "trucks"
  }
];

export default function Home() {
  const [counts, setCounts] = useState<Record<CountKeys, number>>({
    drivers: 0,
    managers: 0,
    stores: 0,
    trucks: 0
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchCounts = async () => {
      try {
        const response = await fetch('/api/hr/get-overview', {
          method: 'POST'
        });
        if (!response.ok) {
          throw new Error('Failed to fetch counts');
        }
        const data = await response.json();
        setCounts(data);
        setLoading(false);
      } catch (err) {
        setLoading(false);
      }
    };

    fetchCounts();
  }, []);

  return (
    <DashboardLayout>
      <Breadcrumb pageName="HR Manager Overview" />
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 xl:grid-cols-4 2xl:gap-7.5">
        {dataStatsList.map((item, index) => (
          <div
            key={index}
            className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark"
          >
            <div
              className="flex h-14.5 w-14.5 items-center justify-center rounded-full"
              style={{ backgroundColor: item.color }}
            >
              <span className="text-2xl font-bold text-white">
                {loading ? "..." : counts[item.dataKey as CountKeys]}
              </span>
            </div>

            <div className="mt-6">
              <span className="text-body-sm font-medium">{item.title}</span>
              
              {error && (
                <span className="text-red text-sm">Error loading data</span>
              )}
            </div>
          </div>
        ))}
      </div>
    </DashboardLayout>
  );
}