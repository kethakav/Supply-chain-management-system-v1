"use client";

import { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import Loader from "@/components/common/Loader";
import ChartTwo from "@/components/Charts/ChartTwo"; // Import the modified ChartTwo component

type Product = {
  product_id: number;
  product_name: string;
  product_count: string;
};

type Route = {
  route_id: number;
  end_point: string;
  sum: string;
};

type Store = {
  nearest_store_id: number;
  store_city: string;
  sum: string;
};

type Report = {
  routes: Route[];
  stores: Store[];
};

const Card = ({ title, children }: { title: string; children: React.ReactNode }) => (
  <div className="rounded-[10px] bg-white p-6 shadow-md dark:bg-gray-dark dark:shadow-card mb-6">
    <h4 className="mb-4 text-body-2xlg font-bold text-dark dark:text-white">{title}</h4>
    {children}
  </div>
);

export default function Home() {
  const [products, setProducts] = useState<Product[]>([]);
  const [report, setReport] = useState<Report | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await fetch("/api/finance/items-mostly-ordered", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch product data");
        }

        const data = await response.json();
        setProducts(data);
      } catch (err: any) {
        setError(err.message);
      }
    };

    const fetchSalesReport = async () => {
      try {
        const response = await fetch("/api/finance/sales-report", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch sales report");
        }

        const data = await response.json();
        setReport(data);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    Promise.all([fetchProducts(), fetchSalesReport()]);
  }, []);

  if (loading) {
    return <Loader />;
  }

  return (
    <DashboardLayout>
      <div className="flex flex-wrap justify-between mb-6">
        <div className="w-full sm:w-1/2 pr-2">
          <Card title="Sales Report - Stores">
            <ChartTwo 
              series={[{
                name: "Stores",
                data: report?.stores.map(store => parseFloat(store.sum)) || []
              }]}
              categories={report?.stores.map(store => store.store_city) || []}
            />
          </Card>
        </div>

        <div className="w-full sm:w-1/2 pl-2">
          <Card title="Sales Report - Routes">
            <ChartTwo 
              series={[{
                name: "Routes",
                data: report?.routes.map(route => parseFloat(route.sum)) || []
              }]}
              categories={report?.routes.map(route => route.end_point) || []} 
            />
          </Card>
        </div>
      </div>

      <Card title="Mostly Ordered Products">
        <div className="flex flex-col">
          <div className="grid grid-cols-3 sm:grid-cols-3">
            <div className="px-2 pb-3.5">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Product ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Product Name</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Product Count</h5>
            </div>
          </div>

          {error ? (
            <div className="text-center py-4 text-red-500">{error}</div>
          ) : (
            products.map((product) => (
              <div
                className="grid grid-cols-3 sm:grid-cols-3 border-t border-stroke px-4 py-4.5 dark:border-dark-3"
                key={product.product_id}
              >
                <div className="px-2 pb-3.5">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    #{product.product_id}
                  </p>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    {product.product_name}
                  </p>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">
                    {product.product_count}
                  </p>
                </div>
              </div>
            ))
          )}
        </div>
      </Card>
    </DashboardLayout>
  );
}
