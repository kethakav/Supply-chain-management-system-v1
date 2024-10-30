"use client";

import React, { useState, useEffect } from "react";
import { usePathname } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import SidebarItem from "@/components/Sidebar/SidebarItem";
import ClickOutside from "@/components/ClickOutside";
import useLocalStorage from "@/hooks/useLocalStorage";

interface SidebarProps {
  sidebarOpen: boolean;
  setSidebarOpen: (arg: boolean) => void;
}

// Define menu items for each user type
const menuItemsByUserType = {
  hrManager: [
    { label: "Overview", route: "/dashboard/hr/overview" },
    { label: "Finance & Order Managers", route: "/dashboard/hr/finance" },
    // { label: "Store Managers", route: "/dashboard/hr/store-mg" },
    // { label: "Driver Management", route: "/dashboard/hr/driver" },
    // { label: "Assistant Driver Management", route: "/dashboard/hr/ast-driver" },
    { label: "Store Management", route: "/dashboard/hr/store" },
    // { label: "Truck Management", route: "/dashboard/hr/truck" },
  ],
  financeManager: [
    { label: "Pending Orders", route: "/dashboard/finance/pending-orders" },
    // { label: "Confirmed Orders", route: "/dashboard/finance/confirmed-orders" },
    { label: "Trains", route: "/dashboard/finance/trains" },
    { label: "Train Deliveries", route: "/dashboard/finance/train-deliveries" },

  ],
  manager: [
    { label: "Overview", route: "/dashboard/store/overview" },
    { label: "Receive Inventory", route: "/dashboard/store/receive" },
    // { label: "Orders to Deliver", route: "/dashboard/store/orders-to-deliver" },
    { label: "Delivery Scheduling", route: "/dashboard/store/scheduling" },
    // { label: "Drivers", route: "/dashboard/store/drivers" },
  ],
  driver: [
    // { label: "Overview", route: "/dashboard/driver/overview" },
    { label: "Assigned Deliveries", route: "/dashboard/driver/deliveries" },
    // { label: "Route Details", route: "/dashboard/driver/route" },
    // { label: "Delivery Confirmation", route: "/dashboard/driver/confirmation" },
    // { label: "Hours Worked", route: "/dashboard/driver/hours" },
  ],
  assistantDriver: [
    // { label: "Overview", route: "/dashboard/assistant-driver/overview" },
    { label: "Assigned Deliveries", route: "/dashboard/assistant-driver/deliveries" },
    // { label: "Hours Worked", route: "/dashboard/assistant-driver/hours" },
  ],
  customer: [
    { label: "Products", route: "/dashboard/customer/products" },
    { label: "Active Orders", route: "/dashboard/customer/orders" },
    { label: "Order History", route: "/dashboard/customer/history" },
    { label: "Your Cart", route: "/dashboard/customer/cart" },
  ],
};

const Sidebar = ({ sidebarOpen, setSidebarOpen }: SidebarProps) => {
  const pathname = usePathname();
  const [pageName, setPageName] = useLocalStorage("selectedMenu", "dashboard");
  const [user, setUser] = useState({ type: "" });

  useEffect(() => {
    // Retrieve user data from local storage
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
      const userData = JSON.parse(storedUser); // Assuming user data is stored as JSON
      setUser({
        type: userData.type,
      });
    }
  }, []);

  // Get menu items based on user type
  const menuItems = menuItemsByUserType[user.type as keyof typeof menuItemsByUserType] || [];

  return (
    <ClickOutside onClick={() => setSidebarOpen(false)}>
      <aside
        className={`absolute left-0 top-0 z-9999 flex h-screen w-72.5 flex-col overflow-y-hidden border-r border-stroke bg-white dark:border-stroke-dark dark:bg-gray-dark lg:static lg:translate-x-0 ${
          sidebarOpen
            ? "translate-x-0 duration-300 ease-linear"
            : "-translate-x-full"
        }`}
      >
        {/* <!-- SIDEBAR HEADER --> */}
        <div className="flex items-center justify-between gap-2 px-8 py-5.5 lg:py-6.5 xl:py-9">
          <Link href="/">
            <Image
              width={176}
              height={32}
              src={"/images/logo/Logo Complete.svg"}
              alt="Logo"
              priority
              className="dark:hidden"
              style={{ width: "auto", height: "auto" }}
            />
            <Image
              width={176}
              height={32}
              src={"/images/logo/logo complete light.svg"}
              alt="Logo"
              priority
              className="hidden dark:block"
              style={{ width: "auto", height: "auto" }}
            />
        
          </Link>

          <button
            onClick={() => setSidebarOpen(!sidebarOpen)}
            className="block lg:hidden"
          >
            <svg
              className="fill-current"
              width="20"
              height="18"
              viewBox="0 0 20 18"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M19 8.175H2.98748L9.36248 1.6875C9.69998 1.35 9.69998 0.825 9.36248 0.4875C9.02498 0.15 8.49998 0.15 8.16248 0.4875L0.399976 8.3625C0.0624756 8.7 0.0624756 9.225 0.399976 9.5625L8.16248 17.4375C8.31248 17.5875 8.53748 17.7 8.76248 17.7C8.98748 17.7 9.17498 17.625 9.36248 17.475C9.69998 17.1375 9.69998 16.6125 9.36248 16.275L3.02498 9.8625H19C19.45 9.8625 19.825 9.4875 19.825 9.0375C19.825 8.55 19.45 8.175 19 8.175Z"
                fill=""
              />
            </svg>
          </button>
        </div>
        {/* <!-- SIDEBAR HEADER --> */}

        <div className="no-scrollbar flex flex-col overflow-y-auto duration-300 ease-linear">
          {/* <!-- Sidebar Menu --> */}
          <nav className="mt-1 px-4 lg:px-6">
            {/* <h3 className="mb-5 text-sm font-medium text-dark-4 dark:text-dark-6">
              MAIN MENU
            </h3> */}
            <ul className="mb-6 flex flex-col gap-2">
              {menuItems.map((menuItem, menuIndex) => (
                <SidebarItem
                  key={menuIndex}
                  item={menuItem}
                  pageName={pageName}
                  setPageName={setPageName}
                  closeSidebar={() => setSidebarOpen(false)} // Close sidebar on item click
                />
              ))}
            </ul>
          </nav>
          {/* <!-- Sidebar Menu --> */}
        </div>
      </aside>
    </ClickOutside>
  );
};

export default Sidebar;
