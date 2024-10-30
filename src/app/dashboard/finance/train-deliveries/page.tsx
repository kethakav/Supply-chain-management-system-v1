"use client";

import { useEffect, useState } from 'react';
import Link from 'next/link'; // Import Link from next/link
import DashboardLayout from '@/components/Layouts/DashboardLayout';
import PercentageBar from '@/components/PercentageBar'; // Import the PercentageBar component
import Breadcrumb from '@/components/Breadcrumbs/Breadcrumb';

type Train = {
  train_delivery_id: number;
  train_id: number;
  allocated_capacity: number;
  destination_store_id: number;
  total_capacity: number;
  departure_day: string;
  departure_time: string;
  arrival_day: string;
  arrival_time: string;
};

const TrainTable = () => {
  const [trains, setTrains] = useState<Train[]>([]);

  useEffect(() => {
    const fetchTrainSchedules = async () => {
      try {
        const response = await fetch('/api/finance/get-all-train-deliveries');
        if (!response.ok) {
          throw new Error('Failed to fetch train schedules');
        }
        const data = await response.json();
        setTrains(data);
      } catch (error) {
        console.error('Error fetching train schedules:', error);
      }
    };

    fetchTrainSchedules();
  }, []);

  return (
    <DashboardLayout>
      <Breadcrumb pageName="Train Deliveries" />
      <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
        {/* <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
          Train Schedule
        </h4> */}

        <div className="flex flex-col">
          <div className="grid grid-cols-8">
            <div className="px-2 pb-3.5">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Train ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Destination Store ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Allocated Capacity</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Total Capacity</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Departure Day</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Departure Time</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Arrival Time</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Capacity Filled</h5>
            </div>
          </div>

          {trains.map((train) => {
            const filledPercentage = (train.allocated_capacity / train.total_capacity) * 100;

            return (
              <Link href={`/dashboard/finance/train-deliveries/${train.train_delivery_id}`} key={train.train_delivery_id}>
                <div className="grid grid-cols-8 border-b border-stroke dark:border-dark-3 cursor-pointer hover:bg-gray-100"> {/* Added cursor and hover effects */}
                  <div className="flex items-center gap-3.5 px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.train_id}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.destination_store_id}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.allocated_capacity}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.total_capacity}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.departure_day}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.departure_time}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <p className="font-medium text-dark dark:text-white">{train.arrival_time}</p>
                  </div>
                  <div className="flex items-center justify-center px-2 py-4">
                    <div className="w-24">
                      <PercentageBar percentage={filledPercentage} />
                    </div>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default TrainTable;
