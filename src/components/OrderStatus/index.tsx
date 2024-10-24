"use client";

import React, { useEffect, useState } from "react";

interface OrderStatusProps {
  currentStage: number;
}

const stages = ["Order Placed", "Processing", "Shipped", "Delivered"];

const OrderStatus: React.FC<OrderStatusProps> = ({ currentStage }) => {
  const [animatedStage, setAnimatedStage] = useState(0);

  // Trigger animation on component mount
  useEffect(() => {
    let currentTimeout: ReturnType<typeof setTimeout>;

    for (let i = 1; i <= currentStage; i++) {
      currentTimeout = setTimeout(() => setAnimatedStage(i), i * 100); // Adjust timing as needed
    }

    return () => clearTimeout(currentTimeout); // Cleanup timeout
  }, [currentStage]);

  return (
    <div className="flex items-center justify-center bg-white p-6 rounded-lg shadow-1 dark:bg-gray-dark">
      <div className="flex w-full max-w-4xl items-center justify-between">
        {stages.map((stage, index) => (
          <div className="flex items-center flex-1" key={stage}>
            <div className="flex flex-col items-center">
              {/* Circle */}
              <div
                className={`w-10 h-10 rounded-full flex items-center justify-center border-[2.5px] transition-colors duration-[600ms] ${
                  index <= animatedStage
                    ? "bg-primary text-white border-primary"
                    : "border-stroke bg-transparent dark:border-dark-3"
                }`}
                style={{
                    transitionDelay: `${(index) * 600}ms`,
                }}
              >
                {index + 1}
              </div>
              {/* Label */}
              <span
                className={`mt-2 text-sm font-medium ${
                  index <= animatedStage
                    ? "text-primary"
                    : "text-dark dark:text-dark-3"
                }`}
              >
                {stage}
              </span>
            </div>

            {/* Line between circles */}
            {index !== stages.length - 1 && (
              <div className="h-[2px] bg-stroke dark:bg-dark-3 flex-1 mx-4 relative overflow-hidden">
                <div
                  className={`absolute top-0 left-0 h-[2px] bg-primary transition-all duration-[600ms] ease-linear ${
                    index < animatedStage ? "w-full" : "w-0"
                  }`}
                  style={{
                    transitionDelay: `${(index) * 600}ms`,
                  }}
                />
              </div>
            )}
          </div>
        ))}
      </div>
    </div>
  );
};

export default OrderStatus;
