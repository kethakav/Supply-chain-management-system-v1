// AlertDialogAction.tsx
import React from 'react';

const AlertDialogAction = React.forwardRef<HTMLButtonElement, React.ButtonHTMLAttributes<HTMLButtonElement>>(
  (props, ref) => {
    return <button ref={ref} {...props} />;
  }
);
AlertDialogAction.displayName = 'AlertDialogAction';

export { AlertDialogAction };