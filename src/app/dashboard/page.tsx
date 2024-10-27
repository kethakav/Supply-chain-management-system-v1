"use client";

// import ECommerce from "@/components/Dashboard/E-commerce";
import { Metadata } from "next";
import DefaultLayout from "@/components/Layouts/DefaultLayout";
import React from "react";
import { useEffect } from "react";
import { useRouter } from "next/navigation";

// export const metadata: Metadata = {
//     title:
//       "Next.js E-commerce Dashboard Page | NextAdmin - Next.js Dashboard Kit",
//     description: "This is Next.js Home page for NextAdmin Dashboard Kit",
//   };
  

  // export default function Home() {
  //   return (
  //     <>
  //       <DefaultLayout>
  //         <h1>Test</h1>
  //       </DefaultLayout>
  //     </>
  //   );
  // }
  

  

const DashboardPage = () => {
  const router = useRouter();

  useEffect(() => {
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
      const userData = JSON.parse(storedUser);
      const userType = userData.type;

      // Define the redirect paths based on user type
      const redirectPaths: { [key: string]: string } = {
        hrManager: "/dashboard/hr/overview",
        financeManager: "/dashboard/finance/pending-orders",
        storeManager: "/dashboard/store/overview",
        driver: "/dashboard/driver/overview",
        assistantDriver: "/dashboard/assistant-driver/overview",
        customer: "/dashboard/customer/overview",
      };

      // Redirect to the appropriate overview page
      const redirectPath = redirectPaths[userType];
      if (redirectPath) {
        router.push(redirectPath);
      }
    } else {
      router.push("/auth/signin");
    }
  }, [router]);

  return (
    <div>
      {/* Dashboard content goes here */}
    </div>
  );
};

export default DashboardPage;