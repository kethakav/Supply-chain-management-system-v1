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

      console.log(userData);

      // Define the redirect paths based on user type
      const redirectPaths: { [key: string]: string } = {
        hrManager: "/dashboard/hr/overview",
        financeManager: "/dashboard/finance/pending-orders",
        manager: "/dashboard/store/overview",
        driver: "/dashboard/driver/deliveries",
        assistantDriver: "/dashboard/assistant-driver/deliveries",
        customer: "/dashboard/customer/products",
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