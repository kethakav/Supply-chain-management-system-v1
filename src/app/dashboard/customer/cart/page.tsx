"use client";

import React, { useEffect, useState } from "react";
import DashboardLayout from "@/components/Layouts/DashboardLayout";
import Image from "next/image";

// Define interfaces
interface CartProduct {
  customer_id: number;
  product_id: number;
  product_name: string;
  product_price: number;
  product_image_url: string;
  quantity: number;
}

interface User {
  id: number;
  type: string;
}

interface CustomerData {
  customer_first_name: string;
  customer_last_name: string;
  customer_address: string;
}

const Home: React.FC = () => {
  const [cartData, setCartData] = useState<CartProduct[]>([]);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [user, setUser] = useState<User | null>(null);
  const [customerData, setCustomerData] = useState<CustomerData | null>(null);
  const [error, setError] = useState<string | null>(null);

  const [storeID, setStoreID] = useState<number | null>(null);
  const [routeID, setRouteID] = useState<number | null>(null);
  const [description, setDescription] = useState<string>("");
  const [payment, setPayment] = useState<string>("");

  const fetchCart = async (userId: number) => {
    setIsLoading(true);
    setError(null);

    try {
      const res = await fetch("/api/cart/get", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ customer_ID: userId }),
      });

      if (!res.ok) throw new Error(`Error: ${res.status} ${res.statusText}`);

      const data = await res.json();
      setCartData(data[0]);
    } catch (error: any) {
      console.error("Failed to load cart:", error);
      setError("Failed to load cart data. Please try again later.");
    } finally {
      setIsLoading(false);
    }
  };

  const fetchCustomerData = async (userId: number) => {
    try {
      const res = await fetch("/api/get-customer-data", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: userId }),
      });

      if (!res.ok) throw new Error(`Error: ${res.status} ${res.statusText}`);

      const data = await res.json();
      setCustomerData({
        customer_first_name: data.user.customer_first_name,
        customer_last_name: data.user.customer_last_name,
        customer_address: data.user.customer_address,
      });
    } catch (error: any) {
      console.error("Failed to load customer data:", error);
      setError("Failed to load customer data. Please try again later.");
    }
  };

  const handlePlaceOrder = async () => {
    try {
      const res = await fetch("/api/cart/purchase", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          customer_ID: user?.id,
          store_ID: storeID,
          route_ID: routeID,
          description,
          payment,
        }),
      });

      if (!res.ok) throw new Error(`Order failed: ${res.status} ${res.statusText}`);

      const data = await res.json();
      alert("Order placed successfully!");
    } catch (error) {
      console.error("Failed to place order:", error);
      alert("Failed to place order. Please try again.");
    }
  };

  const handleRemove = async (productId: number) => {
    try {
      const res = await fetch("/api/cart/remove-item", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          customer_ID: user?.id,
          product_ID: productId,
        }),
      });

      if (!res.ok) throw new Error(`Failed to remove item: ${res.status} ${res.statusText}`);

      // Refresh cart data after removal
      fetchCart(user!.id);
      alert("Item removed successfully.");
    } catch (error) {
      console.error("Failed to remove item from cart:", error);
      alert("Failed to remove item. Please try again.");
    }
  };

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      const parsedUser: User = JSON.parse(storedUser);
      setUser(parsedUser);
      fetchCart(parsedUser.id);
      fetchCustomerData(parsedUser.id);
    }
  }, []);

  const totalPrice = cartData.reduce(
    (total, product) => total + product.product_price * product.quantity,
    0
  );

  if (isLoading) return <div>Loading your cart...</div>;
  if (!user) return <div>Loading user data...</div>;
  if (error) return <div>{error}</div>;

  return (
    <DashboardLayout>
      <div className="rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card">
        <div className="px-4 py-6 md:px-6 xl:px-9">
          <h4 className="text-body-2xlg font-bold text-dark dark:text-white">Your Cart</h4>
        </div>

        <div className="grid grid-cols-7 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-9 md:px-6 2xl:px-7.5">
          <div className="col-span-3 flex items-center"><p className="font-medium">Product Name</p></div>
          <div className="col-span-2 hidden items-center sm:flex"><p className="font-medium">Quantity</p></div>
          <div className="col-span-1 flex items-center"><p className="font-medium">Price</p></div>
          <div className="col-span-1 flex items-center"><p className="font-medium">Total</p></div>
          <div className="col-span-1 flex items-center justify-center"><p className="font-medium">Remove</p></div>
        </div>

        {cartData.length > 0 ? (
          cartData.map((product, key) => (
            <div className="grid grid-cols-7 border-t border-stroke px-4 py-4.5 dark:border-dark-3 sm:grid-cols-9 md:px-6 2xl:px-7.5" key={key}>
              <div className="col-span-3 flex items-center">
                <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
                  <div className="h-12.5 w-15 rounded-md">
                    <Image src={product.product_image_url} width={60} height={50} alt={product.product_name} />
                  </div>
                  <p className="text-body-sm font-medium text-dark dark:text-dark-6">{product.product_name}</p>
                </div>
              </div>
              <div className="col-span-2 hidden items-center sm:flex">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">{product.quantity}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">${product.product_price}</p>
              </div>
              <div className="col-span-1 flex items-center">
                <p className="text-body-sm font-medium text-dark dark:text-dark-6">${(product.product_price * product.quantity).toFixed(2)}</p>
              </div>
              <div className="col-span-1 flex items-center justify-center">
                <button
                  onClick={() => handleRemove(product.product_id)}
                  className="text-red-600 hover:text-red-800"
                >
                  Remove
                </button>
              </div>
            </div>
          ))
        ) : (
          <div className="px-4 py-4 text-body-sm text-dark dark:text-dark-6">Your cart is empty.</div>
        )}

        <div className="px-4 py-4 text-body-lg font-bold text-dark dark:text-white">Total: ${totalPrice.toFixed(2)}</div>
      </div>

      {/* Order Placement Form */}
      <div className="mt-8 rounded-[10px] bg-white shadow-1 dark:bg-gray-dark dark:shadow-card p-4">
        <h4 className="text-body-2xlg font-bold text-dark dark:text-white mb-4">Place Your Order</h4>

        {/* Form fields here as before */}
        <button onClick={handlePlaceOrder} className="w-full py-2 bg-primary text-white rounded mt-4">
          Place Order
        </button>
      </div>
    </DashboardLayout>
  );
};

export default Home;
