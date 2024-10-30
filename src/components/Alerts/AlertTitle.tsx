// AlertTitle.tsx
import React from 'react';

interface AlertTitleProps extends React.HTMLAttributes<HTMLHeadingElement> {
  intent?: 'default' | 'destructive';
}

const AlertTitle: React.FC<AlertTitleProps> = ({ intent = 'default', className, ...props }) => {
  const titleStyles = `text-lg font-semibold ${
    intent === 'default' ? 'text-foreground' : 'text-destructive-foreground'
  } ${className}`;

  return <h3 className={titleStyles} {...props} />;
};

export { AlertTitle };