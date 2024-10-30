// AlertDescription.tsx
import React from 'react';

interface AlertDescriptionProps extends React.HTMLAttributes<HTMLParagraphElement> {
  intent?: 'default' | 'destructive';
}

const AlertDescription: React.FC<AlertDescriptionProps> = ({ intent = 'default', className, ...props }) => {
  const descriptionStyles = `text-sm ${
    intent === 'default' ? 'text-muted-foreground' : 'text-destructive-foreground'
  } ${className}`;

  return <p className={descriptionStyles} {...props} />;
};

export { AlertDescription };