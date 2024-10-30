// AlertDialog.tsx
import React from 'react';

interface AlertDialogProps extends React.HTMLAttributes<HTMLDivElement> {
  open: boolean;
}

const AlertDialog: React.FC<AlertDialogProps> = ({ open, className, ...props }) => {
  const dialogStyles = `fixed inset-0 z-50 flex items-center justify-center overflow-y-auto ${
    open ? 'visible opacity-100' : 'invisible opacity-0'
  } ${className}`;

  const contentStyles = `relative flex w-full max-w-md flex-col rounded-lg bg-background p-6 shadow-lg ${
    open ? 'scale-100 opacity-100' : 'scale-95 opacity-0'
  }`;

  return (
    <div className={dialogStyles}>
      <div className={contentStyles}>
        {props.children}
      </div>
    </div>
  );
};

export { AlertDialog };