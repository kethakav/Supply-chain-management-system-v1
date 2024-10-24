"use client";

import { useEffect, ReactNode } from 'react';
import { useRouter, usePathname } from 'next/navigation';

interface ProtectedRouteProps {
  children: ReactNode;
}

const routePermissions = {
  hrManager: ['/dashboard/hr'],
  financeManager: ['/dashboard/finance'],
  storeManager: ['/dashboard/store'],
  driver: ['/dashboard/driver'],
  assistantDriver: ['/dashboard/assistant-driver'],
  customer: ['/dashboard/customer', '/orders'],
};

const ProtectedRoute = ({ children }: ProtectedRouteProps) => {
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    const checkAuthorization = () => {
      // Check for user data in localStorage
      const storedUser = localStorage.getItem('user');
      
      if (!storedUser) {
        router.push('/auth/signin');
        return;
      }

      try {
        const userData = JSON.parse(storedUser);
        const userType = userData.type as keyof typeof routePermissions;
        
        // Check if the current path starts with any of the allowed routes for the user type
        const isAuthorized = routePermissions[userType]?.some(route => 
          pathname.startsWith(route)
        );

        // If user is not authorized for this route, redirect to their overview page
        if (!isAuthorized) {
          const redirectPaths: { [key: string]: string } = {
            hrManager: "/dashboard/hr/overview",
            financeManager: "/dashboard/finance/overview",
            storeManager: "/dashboard/store/overview",
            driver: "/dashboard/driver/overview",
            assistantDriver: "/dashboard/assistant-driver/overview",
            customer: "/dashboard/customer/overview",
          };

          router.push(redirectPaths[userType]);
        }
      } catch (error) {
        console.error('Error parsing user data:', error);
        router.push('/auth/signin');
      }
    };

    checkAuthorization();
  }, [pathname, router]);

  // Simply return the children component
  return <>{children}</>;
};

export default ProtectedRoute;