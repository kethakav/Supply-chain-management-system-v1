// app/products/page.tsx
'use client';

import { useState, useEffect } from 'react';
import DashboardLayout from '@/components/Layouts/DashboardLayout';
import Image from 'next/image';
import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Loader from '@/components/common/Loader';

interface Product {
  product_id: number;
  product_name: string;
  product_price: number;
  Product_capacity: number;
  product_image_url: string;
}

interface User {
  id: number;
  type: string;
}

export default function ProductsPage() {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [quantities, setQuantities] = useState<{ [key: number]: number }>({});

  useEffect(() => {
    // Fetch user data from local storage
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
      setUser(JSON.parse(storedUser));
    }

    // Fetch products data
    const fetchProducts = async () => {
      try {
        const response = await fetch('/api/products');
        if (!response.ok) {
          throw new Error('Failed to fetch products');
        }
        const data = await response.json();
        setProducts(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load products');
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, []);

  const handleQuantityChange = (productId: number, delta: number) => {
    setQuantities((prevQuantities) => ({
      ...prevQuantities,
      [productId]: Math.max(1, (prevQuantities[productId] || 1) + delta),
    }));
  };

  const handleAddToCart = async (productId: number) => {
    if (!user) {
      alert('User not authenticated');
      return;
    }

    const quantity = quantities[productId] || 1;
    try {
      const response = await fetch('/api/cart/add', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          id: user.id,
          product_ID: productId,
          quantity,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to add product to cart');
      }
      alert('Product added to cart successfully');
    } catch (error) {
      console.error('Error adding product to cart:', error);
      alert('Failed to add product to cart');
    }
  };

  if (loading) {
    return (
      <Loader />
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <div className="text-center text-red-600 p-4">Error: {error}</div>
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
      <Breadcrumb pageName="Products" />
      <div className="container mx-auto px-4">
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {products.map((product) => (
            <div
              key={product.product_id}
              className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
            >
              <div className="relative h-48 w-full">
                {product.product_image_url ? (
                  <Image
                    src={product.product_image_url}
                    alt={product.product_name}
                    fill
                    className="object-cover"
                  />
                ) : (
                  <div className="w-full h-full bg-gray-200 flex items-center justify-center">
                    <span className="text-gray-400">No image available</span>
                  </div>
                )}
              </div>
              
              <div className="p-4">
                <h3 className="text-lg font-semibold text-gray-800 mb-2">
                  {product.product_name}
                </h3>
                
                <div className="flex justify-between items-center mb-2">
                  <span className="text-lg font-bold text-blue-600">
                    ${product.product_price.toLocaleString()}
                  </span>
                  {/* <span className="text-sm text-gray-600">
                    Stock: {product.Product_capacity}
                  </span> */}
                </div>

                <div className="flex items-center mb-2">
                  <button
                    className="px-2 py-1 bg-gray-200 rounded-l"
                    onClick={() => handleQuantityChange(product.product_id, -1)}
                  >
                    -
                  </button>
                  <span className="px-4">{quantities[product.product_id] || 1}</span>
                  <button
                    className="px-2 py-1 bg-gray-200 rounded-r"
                    onClick={() => handleQuantityChange(product.product_id, 1)}
                  >
                    +
                  </button>
                </div>

                <button
                  className="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 transition-colors duration-300"
                  onClick={() => handleAddToCart(product.product_id)}
                >
                  Add to Cart
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </DashboardLayout>
  );
}
