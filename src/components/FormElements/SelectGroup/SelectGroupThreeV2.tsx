"use client";
import React, { useState } from "react";

// Define the structure of the options prop
interface SelectGroupThreeProps {
  options: { value: string; label: string }[]; // Array of value-label objects
  name: string; // Name of the select input
  onChange: (value: string) => void; // Callback to handle changes
}

const SelectGroupThree: React.FC<SelectGroupThreeProps> = ({ options, name, onChange }) => {
  const [selectedOption, setSelectedOption] = useState<string>(""); // Track selected option
  const [isOptionSelected, setIsOptionSelected] = useState<boolean>(false); // Track if an option is selected

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const value = e.target.value;
    setSelectedOption(value); // Update the selected option
    setIsOptionSelected(true); // Change color once an option is selected
    onChange(value); // Notify the parent component of the change
  };

  return (
    <div className="mb-5.5">
      {/* Select Group */}
      <div className="dark:bg-form-input relative z-20 bg-transparent">
        <select
          value={selectedOption} // Controlled input value
          onChange={handleChange}
          name={name} // Ensure name is passed to the select
          className={`relative z-20 w-full appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary dark:border-dark-3 dark:bg-dark-2 dark:focus:border-primary ${
            isOptionSelected ? "text-dark dark:text-white" : "" // Conditional text color change
          }`}
        >
          {/* Default placeholder option */}
          <option value="" disabled className="text-body dark:text-bodydark">
            Select
          </option>
          {/* Render each option */}
          {options.map((option) => (
            <option
              key={option.value}
              value={option.value}
              className="text-body dark:text-bodydark"
            >
              {option.label}
            </option>
          ))}
        </select>

        {/* SVG icon */}
        <span className="absolute right-4 top-1/2 z-30 -translate-y-1/2">
          <svg
            className="fill-current"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <g opacity="0.8">
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M5.29289 8.29289C5.68342 7.90237 6.31658 7.90237 6.70711 8.29289L12 13.5858L17.2929 8.29289C17.6834 7.90237 18.3166 7.90237 18.7071 8.29289C19.0976 8.68342 19.0976 9.31658 18.7071 9.70711L12.7071 15.7071C12.3166 16.0976 11.6834 16.0976 11.2929 15.7071L5.29289 9.70711C4.90237 9.31658 4.90237 8.68342 5.29289 8.29289Z"
                fill=""
              ></path>
            </g>
          </svg>
        </span>
      </div>
    </div>
  );
};

export default SelectGroupThree;
