// Alert.tsx
import React from 'react';

interface AlertProps extends React.HTMLAttributes<HTMLDivElement> {
  variant?: 'default' | 'destructive';
}

const Alert: React.FC<AlertProps> = ({ variant = 'default', className, ...props }) => {
  const alertStyles = `relative w-full rounded-md border p-4 [&:not(:first-child)]:mt-4 ${
    variant === 'default'
      ? 'bg-background border-border'
      : 'bg-destructive border-destructive text-destructive-foreground'
  } ${className}`;

  return <div className={alertStyles} {...props} />;
};

export { Alert };