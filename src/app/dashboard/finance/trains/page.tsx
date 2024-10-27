"use client";

import { useEffect, useState } from 'react';
import Image from 'next/image';
import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import DashboardLayout from '@/components/Layouts/DashboardLayout';
import ButtonDefault from "@/components/Buttons/ButtonDefault";

type Train = {
  train_id: number;
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
    const fetchTrains = async () => {
      try {
        const response = await fetch('/api/finance/get-all-trains');
        const data = await response.json();
        setTrains(data);
      } catch (error) {
        console.error('Error fetching trains:', error);
      }
    };

    fetchTrains();
  }, []);

  const handleCreateSchedule = async (trainId: number) => {
    try {
      const response = await fetch('/api/finance/create-train-schedule', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ train_id: trainId }),
      });

      if (response.ok) {
        console.log(`Schedule created for train ${trainId}`);
        alert(`Schedule created for train ${trainId}`);
      } else {
        console.error('Failed to create schedule');
        alert('Failed to create schedule');
      }
    } catch (error) {
      console.error('Error creating schedule:', error);
      alert('Error creating schedule');
    }
  };

  return (
    <DashboardLayout>
      <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
        <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
          Train Schedule
        </h4>

        <div className="flex flex-col">
          <div className="grid grid-cols-7">
            <div className="px-2 pb-3.5">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Train ID
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Destination Store ID
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Capacity
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Departure Day
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Departure Time
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Arrival Time
              </h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">
                Actions
              </h5>
            </div>
          </div>

          {trains.map((train) => (
            <div
              className="grid grid-cols-7 border-b border-stroke dark:border-dark-3"
              key={train.train_id}
            >
              <div className="flex items-center gap-3.5 px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.train_id}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.destination_store_id}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.total_capacity}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.departure_day}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.departure_time}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <p className="font-medium text-dark dark:text-white">
                  {train.arrival_time}
                </p>
              </div>
              <div className="flex items-center justify-center px-2 py-4">
                <ButtonDefault
                  label="Create Schedule"
                  onClick={() => handleCreateSchedule(train.train_id)}
                  customClasses="bg-green text-white rounded-full px-6 py-2"
                />
              </div>
            </div>
          ))}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default TrainTable;
