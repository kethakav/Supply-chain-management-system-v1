"use client";
import React, { useState, ReactNode } from "react";
import Sidebar from "@/components/Sidebar";
import Header from "@/components/Header";
import ProtectedRoute from "../ProtectedRoute";

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const [sidebarOpen, setSidebarOpen] = useState(false); // Sidebar starts closed

  // Function to close the sidebar
  const closeSidebar = () => {
    setSidebarOpen(false);
  };

  return (
    <>
      <ProtectedRoute>
        <div className="flex h-screen overflow-hidden">
          <Sidebar sidebarOpen={sidebarOpen} setSidebarOpen={setSidebarOpen} />
          <div className="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">
            <Header 
              sidebarOpen={sidebarOpen} 
              setSidebarOpen={setSidebarOpen} 
              // Pass closeSidebar function to Header if needed
            />
            <main>
              <div className="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
                {children}
              </div>
            </main>
          </div>
        </div>
      </ProtectedRoute>
    </>
  );
}
