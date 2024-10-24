import React from "react";

interface OrderStatusProps {
  currentStage: number;
}

const stages = ["Order Placed", "Processing", "Shipped", "Delivered"];

const OrderStatus: React.FC<OrderStatusProps> = ({ currentStage }) => {
  return (
    <div className="flex items-center justify-between p-6 bg-white rounded-lg shadow-lg">
      {stages.map((stage, index) => (
        <div className="flex items-center" key={stage}>
          <div className="flex flex-col items-center">
            {/* Circle */}
            <div
              className={`w-8 h-8 rounded-full flex items-center justify-center border-2 ${
                index <= currentStage
                  ? "bg-blue-500 border-blue-500 text-white"
                  : "border-gray-300"
              }`}
            >
              {index + 1}
            </div>
            {/* Label */}
            <span className="mt-2 text-sm font-medium">{stage}</span>
          </div>

          {/* Line between circles */}
          {index !== stages.length - 1 && (
            <div className="flex-1 h-1 bg-gray-300 mx-4">
              <div
                className={`h-1 bg-blue-500 ${
                  index < currentStage ? "w-full" : "w-0"
                }`}
              />
            </div>
          )}
        </div>
      ))}
    </div>
  );
};

export default OrderStatus;
