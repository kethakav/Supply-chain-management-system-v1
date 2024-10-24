import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React from "react";

export const metadata: Metadata = {
  title: "Next.js E-commerce Dashboard Page | NextAdmin - Next.js Dashboard Kit",
  description: "This is Next.js Home page for NextAdmin Dashboard Kit",
};

export default function Home() {
  return (
    <>
      <DashboardLayout>
        <div className="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
          <div className="flex gap-4 md:gap-6 2xl:gap-7.5">
            {/* Left Column */}
            <div className="flex flex-col gap-4 md:gap-6 2xl:gap-7.5 w-full md:w-1/3">
              <h2 className="text-xl font-semibold text-dark dark:text-white">Orders</h2>
              <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
                <div className="flex items-center">
                  <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#3FD97F] text-2xl font-bold text-white">
                    12
                  </div>
                  <div className="ml-4">
                    <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                      To Receive
                    </h4>
                    {/* <span className="text-body-sm font-medium">24 Orders</span> */}
                  </div>
                </div>
              </div>

              <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
                <div className="flex items-center">
                  <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#FF9C55] text-2xl font-bold text-white">
                    2
                  </div>
                  <div className="ml-4">
                    <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                      To Deliver
                    </h4>
                    {/* <span className="text-body-sm font-medium">12 Orders</span> */}
                  </div>
                </div>
              </div>
            </div>

            {/* Right Column */}
            <div className="flex flex-col gap-4 md:gap-6 2xl:gap-7.5 w-full md:w-2/3">
              {/* Available Section */}
              <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
                <h2 className="text-xl font-semibold text-dark dark:text-white">Available</h2>
                <div className="flex gap-4 mt-4">
                  {/* Trucks */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#18BFFF] text-2xl font-bold text-white">
                      10
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Trucks
                      </h4>
                    </div>
                  </div>
                  {/* Drivers */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#FF9C55] text-2xl font-bold text-white">
                      5
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Drivers
                      </h4>
                    </div>
                  </div>
                  {/* Assistant Drivers */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#3FD97F] text-2xl font-bold text-white">
                      3
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Assistant Drivers
                      </h4>
                    </div>
                  </div>
                </div>
              </div>

              {/* All Section */}
              <div className="rounded-[10px] bg-white p-6 shadow-1 dark:bg-gray-dark">
                <h2 className="text-xl font-semibold text-dark dark:text-white">All</h2>
                <div className="flex gap-4 mt-4">
                  {/* Trucks */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#18BFFF] text-2xl font-bold text-white">
                      10
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Trucks
                      </h4>
                      <span className="text-body-sm font-medium">10 Total</span>
                    </div>
                  </div>
                  {/* Drivers */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#FF9C55] text-2xl font-bold text-white">
                      5
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Drivers
                      </h4>
                      <span className="text-body-sm font-medium">5 Total</span>
                    </div>
                  </div>
                  {/* Assistant Drivers */}
                  <div className="flex items-center flex-1">
                    <div className="flex h-14.5 w-14.5 items-center justify-center rounded-full bg-[#3FD97F] text-2xl font-bold text-white">
                      3
                    </div>
                    <div className="ml-4">
                      <h4 className="text-heading-6 font-bold text-dark dark:text-white">
                        Assistant Drivers
                      </h4>
                      <span className="text-body-sm font-medium">3 Total</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </DashboardLayout>
    </>
  );
}
