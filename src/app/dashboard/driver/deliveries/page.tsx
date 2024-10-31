"use client";

import { useEffect, useState } from 'react';
import Link from 'next/link';
import DashboardLayout from '@/components/Layouts/DashboardLayout';
import PercentageBar from '@/components/PercentageBar';
import Breadcrumb from '@/components/Breadcrumbs/Breadcrumb';

type Delivery = {
  delivery_id: number;
  truck_id: number;
  vehicle_number: string;
  destination: string;
  route_description: string;
  distance: number;
  max_time: string;
  store_location: string;
  sent_datetime: string;
};

const TruckTable = () => {
  const [deliveries, setDeliveries] = useState<Delivery[]>([]);

  useEffect(() => {
    const fetchOrders = async (driver_id: number) => {
      try {
        const response = await fetch('/api/driver/get-deliveries', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ driver_id }),
        });

        if (!response.ok) {
          throw new Error('Failed to fetch deliveries');
        }

        const data = await response.json();
        setDeliveries(data);
      } catch (error) {
        console.error('Error fetching deliveries:', error);
      }
    };

    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser = JSON.parse(storedUser);
      fetchOrders(parsedUser.id);
    }
  }, []);

  return (
    <DashboardLayout>
      <Breadcrumb pageName='Deliveries' />
      <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
        <h4 className="mb-5.5 text-body-2xlg font-bold text-dark dark:text-white">
          Truck Deliveries
        </h4>

        <div className="flex flex-col">
          <div className="grid grid-cols-7">
            <div className="px-2 pb-3.5">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Delivery ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Truck ID</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Vehicle Number</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Destination</h5>
            </div>

            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Distance</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Max Time</h5>
            </div>
            <div className="px-2 pb-3.5 text-center">
              <h5 className="text-sm font-medium uppercase xsm:text-base">Store Location</h5>
            </div>
          </div>

          {deliveries.map((delivery) => (
            <Link href={`/dashboard/driver/deliveries/truck-deliveries/${delivery.delivery_id}`} key={delivery.delivery_id}>
              <div className="grid grid-cols-7 border-b border-stroke dark:border-dark-3 cursor-pointer hover:bg-gray-100">
                <div className="flex items-center gap-3.5 px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.delivery_id}</p>
                </div>
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.truck_id}</p>
                </div>
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.vehicle_number}</p>
                </div>
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.destination}</p>
                </div>
        
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.distance}</p>
                </div>
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.max_time}</p>
                </div>
                <div className="flex items-center justify-center px-2 py-4">
                  <p className="font-medium text-dark dark:text-white">{delivery.store_location}</p>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default TruckTable;
