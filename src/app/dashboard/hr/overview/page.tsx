"use client";

import { Metadata } from "next";
import DefaultLayout from "@/components/Layouts/DefaultLayout";
import React from "react";
import withAuth from "@/utils/hoc/withAuth"; // Import the HOC
import ProtectedRoute from "@/components/ProtectedRoute";

// export const metadata: Metadata = {
//   title: "Next.js E-commerce Dashboard Page | NextAdmin - Next.js Dashboard Kit",
//   description: "This is Next.js Home page for NextAdmin Dashboard Kit",
// };

function Home() {
  return (
    <>
      <ProtectedRoute>
        <DefaultLayout>
          <h1>This is the HR Manager overview page</h1>
        </DefaultLayout>
      </ProtectedRoute>
    </>
  );
}

// Wrap the Home component with withAuth and pass "hrManager" as the allowed user type
export default Home;
