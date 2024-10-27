import React from 'react';

interface PercentageBarProps {
  percentage: number; // Percentage value between 0 and 100
  label?: string; // Optional label for the percentage bar
}

const PercentageBar: React.FC<PercentageBarProps> = ({ percentage, label }) => {
  // Ensure percentage is between 0 and 100
  const clampedPercentage = Math.min(Math.max(percentage, 0), 100);

  return (
    <div className="w-full bg-gray-200 rounded-full">
      <div
        className="bg-blue-600 text-xs font-medium text-white text-center p-0.5 leading-none rounded-full"
        style={{ width: `${clampedPercentage}%` }}
      >
        {label && <span>{label}: {clampedPercentage}%</span>}
      </div>
    </div>
  );
};

export default PercentageBar;
