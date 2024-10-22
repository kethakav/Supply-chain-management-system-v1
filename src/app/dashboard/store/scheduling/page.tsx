"use client";

import { Metadata } from "next";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import React from "react";
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import InputGroup from "@/components/FormElements/InputGroup";
import SelectGroupOne from "@/components/FormElements/SelectGroup/SelectGroupOne";
import Link from "next/link";
import SelectGroupThree from "@/components/FormElements/SelectGroup/SelectGroupThree";
import SelectGroupTwo from "@/components/FormElements/SelectGroup/SelectGroupTwo";
import DatePickerOne from "@/components/FormElements/DatePicker/DatePickerOne";
import DatePickerTwo from "@/components/FormElements/DatePicker/DatePickerTwo";


  export default function Home() {
    return (
        <DashboardLayout>
          {/* <Breadcrumb pageName="Form Layout" /> */}
    
          <div className="grid grid-cols-1 gap-9 sm:grid-cols-1">
            <div className="flex flex-col gap-9">
              {/* <!-- Contact Form --> */}
              <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
                <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
                  <h3 className="font-semibold text-dark dark:text-white">
                    New Delivery
                  </h3>
                </div>
                <form action="#">
                  <div className="p-6.5">
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                      Select Driver
                    </label>
                    <SelectGroupThree options={[{ value: "Student", label: "Student" }, { value: "UX/UI Designer", label: "UX/UI Designer" }, { value: "Web Developer", label: "Web Developer" }]} />
                    
                    <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                      Select Assistant Driver
                    </label>
                    <SelectGroupThree options={[{ value: "Student", label: "Student" }, { value: "UX/UI Designer", label: "UX/UI Designer" }, { value: "Web Developer", label: "Web Developer" }]} />
    
                    <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                      Select Truck
                    </label>
                    <SelectGroupThree options={[{ value: "Student", label: "Student" }, { value: "UX/UI Designer", label: "UX/UI Designer" }, { value: "Web Developer", label: "Web Developer" }]} />

                    <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                      Select Route
                    </label>
                    <SelectGroupThree options={[{ value: "Student", label: "Student" }, { value: "UX/UI Designer", label: "UX/UI Designer" }, { value: "Web Developer", label: "Web Developer" }]} />

                    <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                      Departure Date
                    </label>
                    <DatePickerTwo />
    
                    <button className="flex w-full justify-center rounded-[7px] bg-primary p-[13px] pt-[10px] font-medium text-white hover:bg-opacity-90">
                      Add delivery
                    </button>
                  </div>
                </form>
              </div>
            </div>
    
           
          </div>
        </DashboardLayout>
      );
  }