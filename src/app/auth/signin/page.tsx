import React from "react";
import Link from "next/link";
import Image from "next/image";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import { Metadata } from "next";
import LoginLayout from "@/components/Layouts/LoginLayout";
import Signin from "@/components/Auth/Signin";

export const metadata: Metadata = {
  title: "Next.js Login Page | NextAdmin - Next.js Dashboard Kit",
  description: "This is Next.js Login Page NextAdmin Dashboard Kit",
};

const SignIn: React.FC = () => {
  return (
    <LoginLayout>
      <Breadcrumb pageName="Sign In" />
 
      <div className=" mx-auto rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card items-center justify-center"> {/* Added max-w-md and mx-auto */}
        <div className="flex flex-wrap justify-center"> {/* Added justify-center here */}
          <div className="w-full xl:w-1/2">
            <div className="w-full p-4 sm:p-12.5 xl:p-15">
              <Signin />
            </div>
          </div>

          {/* <div className="hidden w-full p-7.5 xl:block xl:w-1/2">
            <div className="custom-gradient-1 overflow-hidden rounded-2xl px-12.5 pt-12.5 dark:!bg-dark-2 dark:bg-none">
              
            </div>
          </div> */}
        </div>
      </div>
    </LoginLayout>
  );
};

export default SignIn;
