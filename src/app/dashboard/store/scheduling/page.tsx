"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import Link from "next/link";

interface User {
  id: number;
  type: string;
  store_ID: number;
}

interface Route {
  route_id: number;
  store_id: number;
  end_point: string;
  route_description: string;
  distance: number;
  max_time: number;
}

interface Driver {
  driver_id: number;
  driver_first_name: string;
  driver_last_name: string;
}

interface AstDriver {
  ast_driver_id: number;
  ast_driver_first_name: string;
  ast_driver_last_name: string;
}

interface Truck {
  truck_id: number;
  store_id: number;
  vehicle_number: string; // Ensure this is a string
  availability: number;
}

interface Delivery {
  delivery_id: number;
  driver_id: string;
  assistant_driver_id: string;
  truck_id: string;
  route_id: string;
  departureDate: string;
  orders: string[]; // assuming orders are stored as an array of strings
}


export default function Home() {
  const [formData, setFormData] = useState({
    driver: "",
    assistant: "",
    truck: "",
    route: "",
    departureDate: "",
    orders: [],
  });

  const [deliveries, setDeliveries] = useState<Delivery[]>([]);
  const [routes, setRoutes] = useState<Route[]>([]);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [availableDrivers, setAvailableDrivers] = useState<Driver[]>([]);
  const [availableAssistantDrivers, setAvailableAssistantDrivers] = useState<AstDriver[]>([]); // Initialize as an empty array
  const [availableTrucks, setAvailableTrucks] = useState<Truck[]>([]); // Change to Truck[]

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser = JSON.parse(storedUser);
      setUser(parsedUser);
    }
  }, []);

  useEffect(() => {
    const fetchRoutes = async () => {
      if (!user) return;

      try {
        setLoading(true);
        const response = await fetch("/api/get-all-routes");
        if (!response.ok) throw new Error("Failed to fetch routes");
        const data = await response.json();
        const filteredRoutes = data.filter((route: Route) => route.store_id === user.store_ID);
        setRoutes(filteredRoutes);
      } catch (err) {
        setError((err as Error).message);
        console.error("Error fetching routes:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchRoutes();
  }, [user]);

  useEffect(() => {
    const fetchData = async () => {
      if (!user) return;

      try {
        const response = await fetch("/api/store-mg/get-scheduling-data", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ store_ID: user.store_ID }),
        });

        if (response.ok) {
          const result = await response.json();
          setAvailableDrivers(result.availableDrivers);
          // Assuming you fetch assistant drivers and trucks too.
          setAvailableAssistantDrivers(result.availableAssistantDrivers);
          setAvailableTrucks(result.availableTrucks);
        } else {
          console.error("Failed to fetch data from API");
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [user]);

  useEffect(() => {
    const fetchDeliveries = async () => {
      if (!user) return;

      try {
        setLoading(true);
        const response = await fetch("/api/store-mg/get-deliveries", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ store_ID: user.store_ID }),
        });

        if (!response.ok) throw new Error("Failed to fetch deliveries");
        const data = await response.json();
        setDeliveries(data[0]); // Assuming the response contains the delivery data
        console.log(data[0]);
      } catch (err) {
        setError((err as Error).message);
        console.error("Error fetching deliveries:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchDeliveries();
  }, [user]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    // Prepare data for the API request
    const deliveryData = {
      truck_id: formData.truck,
      driver_id: formData.driver,
      ast_driver_id: formData.assistant,
      route_id: formData.route,
      store_id: user?.store_ID, // Ensure user is available and store_ID is correct
    };

    try {
      const response = await fetch("/api/store-mg/schedule-delivery", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(deliveryData),
      });

      if (!response.ok) throw new Error("Failed to schedule delivery");
      const result = await response.json();

      // Optionally handle the result or any success feedback here
      console.log(result.message);

      // Update deliveries state if needed
      // setDeliveries((prevDeliveries) => [...prevDeliveries, formData]);

      // Reset form
      setFormData({
        driver: "",
        assistant: "",
        truck: "",
        route: "",
        departureDate: "",
        orders: [],
      });
    } catch (error) {
      console.error("Error scheduling delivery:", error);
    }
  };

  const handleRemoveDelivery = (index: number) => {
    setDeliveries((prevDeliveries) => prevDeliveries.filter((_, i) => i !== index));
  };

  return (
    <DashboardLayout>
      <div className="grid grid-cols-1 gap-9 sm:grid-cols-1">
        <div className="flex flex-col gap-9">
          <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
            <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
              <h3 className="font-semibold text-dark dark:text-white">New Delivery</h3>
            </div>
            <form onSubmit={handleSubmit}>
              <div className="p-6.5">
                <label htmlFor="drivers">Select Driver:</label>
                <select
                  id="drivers"
                  name="driver"
                  value={formData.driver}
                  onChange={handleChange}
                  className="w-full p-2 border border-gray-300 rounded dark:bg-gray-800 dark:border-gray-600 dark:text-white"
                >
                  <option value="" disabled>Select a Driver</option>
                  {availableDrivers && availableDrivers.length > 0 ? (
                    availableDrivers.map((driver) => (
                      <option key={driver.driver_id} value={driver.driver_id}>
                        {driver.driver_first_name} {driver.driver_last_name}
                      </option>
                    ))
                  ) : (
                    <option disabled>No drivers available</option>
                  )}
                </select>

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Select Assistant Driver</label>
                <select
                  name="assistant"
                  value={formData.assistant}
                  onChange={handleChange}
                  className="w-full p-2 border border-gray-300 rounded dark:bg-gray-800 dark:border-gray-600 dark:text-white"
                >
                  <option value="" disabled>Select an Assistant Driver</option>
                  {availableAssistantDrivers && availableAssistantDrivers.length > 0 ? (
                    availableAssistantDrivers.map((assistant) => (
                      <option key={assistant.ast_driver_id} value={assistant.ast_driver_id}>
                        {assistant.ast_driver_first_name} {assistant.ast_driver_last_name}
                      </option>
                    ))
                  ) : (
                    <option disabled>No assistant drivers available</option>
                  )}
                </select>

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Select Truck</label>
                <select
                  name="truck"
                  value={formData.truck}
                  onChange={handleChange}
                  className="w-full p-2 border border-gray-300 rounded dark:bg-gray-800 dark:border-gray-600 dark:text-white"
                >
                  <option value="" disabled>Select a Truck</option>
                  {availableTrucks && availableTrucks.length > 0 ? (
                    availableTrucks.map((truck) => (
                      <option key={truck.truck_id} value={truck.truck_id}>
                        {truck.vehicle_number}  {/* Use vehicle_number here */}
                      </option>
                    ))
                  ) : (
                    <option disabled>No trucks available</option>
                  )}
                </select>

                <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">Select Route</label>
                <select
                  name="route"
                  value={formData.route}
                  onChange={handleChange}
                  className="w-full p-2 border border-gray-300 rounded dark:bg-gray-800 dark:border-gray-600 dark:text-white"
                  disabled={routes.length === 0}
                >
                  <option value="" disabled>
                    {routes.length ? "Select a Route" : "No routes available"}
                  </option>
                  {routes.map((route) => (
                    <option key={route.route_id} value={route.route_id}>
                      {route.end_point} ({route.distance} km, {route.max_time} min)
                    </option>
                  ))}
                </select>

                <div className="mt-4">
                  <button type="submit" className="btn btn-primary">
                    Add Delivery
                  </button>
                </div>
              </div>
            </form>
          </div>

          
          <div className="dark:border-dark-3">
              <h3 className="font-semibold text-dark dark:text-white">Deliveries</h3>
            </div>
          {/* New one */}
          <div className="rounded-[10px] bg-white px-7.5 pb-4 pt-7.5 shadow-1 dark:bg-gray-dark dark:shadow-card">
            
            <div className="flex flex-col">
              <div className="grid grid-cols-3">
                <div className="px-2 pb-3.5">
                  <h5 className="text-sm font-medium uppercase xsm:text-base">Delivery ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <h5 className="text-sm font-medium uppercase xsm:text-base">Truck ID</h5>
                </div>
                <div className="px-2 pb-3.5 text-center">
                  <h5 className="text-sm font-medium uppercase xsm:text-base">Route ID</h5>
                </div>
              </div>

              {/* Conditional Rendering for loading, error, and empty deliveries */}
              {loading ? (
                <p>Loading...</p>
              ) : error ? (
                <p className="text-red-500">{error}</p>
              ) : deliveries.length > 0 ? (
                deliveries.map((delivery) => (
                  <Link href={`/dashboard/store/scheduling/truck-deliveries/${delivery.delivery_id}`} key={delivery.delivery_id}>
                    <div className="grid grid-cols-3 border-b border-stroke dark:border-dark-3 cursor-pointer hover:bg-gray-100"> {/* Added cursor and hover effects */}
                      <div className="flex items-center gap-3.5 px-2 py-4">
                        <p className="font-medium text-dark dark:text-white">{delivery.delivery_id}</p>
                      </div>
                      <div className="flex items-center justify-center px-2 py-4">
                        <p className="font-medium text-dark dark:text-white">{delivery.truck_id}</p>
                      </div>
                      <div className="flex items-center justify-center px-2 py-4">
                        <p className="font-medium text-dark dark:text-white">{delivery.route_id}</p>
                      </div>
                    </div>
                  </Link>
                ))
              ) : (
                <p>No deliveries scheduled yet.</p>
              )}
            </div>
          </div>

        </div>
      </div>
    </DashboardLayout>
  );
}

