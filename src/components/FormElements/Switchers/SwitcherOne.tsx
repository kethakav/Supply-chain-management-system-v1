import React from "react";

// Define the props type for the SwitcherOne component
interface SwitcherOneProps {
  enabled: boolean;  // Prop for the toggle state
  onToggle: () => void;  // Prop for the toggle function
  id: string;  // Add a unique ID prop
}

const SwitcherOne: React.FC<SwitcherOneProps> = ({ enabled, onToggle, id }) => {
  return (
    <div>
      <label
        htmlFor={id} // Use the passed ID for the switch
        className="flex cursor-pointer select-none items-center"
      >
        <div className="relative">
          <input
            type="checkbox"
            id={id} // Use the passed ID for the input
            className="sr-only"
            checked={enabled} // Set checked based on enabled prop
            onChange={onToggle} // Call onToggle when changed
          />
          <div className="block h-8 w-14 rounded-full bg-gray-3 dark:bg-[#5A616B]"></div>
          <div
            className={`absolute left-1 top-1 h-6 w-6 rounded-full bg-white shadow-switch-1 transition ${
              enabled && "!right-1 !translate-x-full !bg-primary dark:!bg-white"
            }`}
          ></div>
        </div>
      </label>
    </div>
  );
};

export default SwitcherOne;
