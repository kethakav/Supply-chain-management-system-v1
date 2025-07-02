"use client";
import { useState } from "react";
import { useRouter } from 'next/navigation';
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import DefaultLayout from "@/components/Layouts/DefaultLayout";
import { useParams } from "next/navigation";

const AddStoreManager = () => {
  const router = useRouter();
  const params = useParams();
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  
  const [formData, setFormData] = useState({
    vehicle_number: "",
    store_id: params.store_id || "", // Initialize with store_id from URL
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setError(null);
    const { name, value } = e.target;

    // Update vehicle_number correctly
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setIsLoading(true);

    try {
      const response = await fetch("/api/hr/add-truck", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.error || 'Registration failed');
      }

      // Redirect back to the store page after successful registration
      router.push(`/dashboard/hr/store/id/${params.store_id}`);
      
    } catch (error) {
      setError((error as Error).message || 'An error occurred during registration');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <DefaultLayout>
      <Breadcrumb pageName={`Add Truck for Store ${params.store_id}`} />

      <form onSubmit={handleSubmit}>
        <div className="grid grid-cols-1 gap-9 sm:grid-cols-2">
          <div className="flex flex-col gap-9">
            {error && (
              <div className="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                {error}
              </div>
            )}

            <div className="rounded-[10px] border border-stroke bg-white shadow-1 dark:border-dark-3 dark:bg-gray-dark dark:shadow-card">
              <div className="border-b border-stroke px-6.5 py-4 dark:border-dark-3">
                <h3 className="font-medium text-dark dark:text-white">
                  Truck Information for Store {params.store_id}
                </h3>
              </div>
              <div className="flex flex-col gap-5.5 p-6.5">
                {/* Vehicle Number Field */}
                <div>
                  <label className="mb-3 block text-body-sm font-medium text-dark dark:text-white">
                    Vehicle Number
                  </label>
                  <input
                    type="number"  // Changed type to number
                    name="vehicle_number" // Changed name to vehicle_number
                    value={formData.vehicle_number}
                    onChange={handleChange}
                    placeholder="Enter Vehicle Number"
                    className="w-full rounded-[7px] border-[1.5px] border-stroke bg-transparent px-5.5 py-3 text-dark outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:text-white"
                    required
                    disabled={isLoading}
                  />
                </div>

                <button
                  type="submit"
                  className={`inline-flex h-12 items-center justify-center rounded-md bg-primary px-5 text-base font-semibold text-white transition hover:bg-opacity-90 dark:bg-primary-dark ${
                    isLoading ? "opacity-50 cursor-not-allowed" : ""
                  }`}
                  disabled={isLoading}
                >
                  {isLoading ? "Adding Truck..." : "Add Truck"}
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </DefaultLayout>
  );
};

export default AddStoreManager;
