import { useEffect } from "react";
import { useRouter } from "next/navigation";

interface WithAuthProps {
  userType: string; // Allowed user type for this page
}

const withAuth = (WrappedComponent: React.ComponentType, allowedUserType: string) => {
  const AuthComponent = (props: any) => {
    const router = useRouter();
    
    useEffect(() => {
      // Retrieve user data from local storage
      const storedUser = localStorage.getItem('user');
      
      if (!storedUser) {
        router.push('/login'); // Redirect to login if no user data is found
        return;
      }

      const user = JSON.parse(storedUser);

      // Check if user type matches the allowed type
      if (user.type !== allowedUserType) {
        router.push('/unauthorized'); // Redirect to unauthorized page if user type doesn't match
      }
    }, []);

    return  {...props} as JSX.Element;
  };

  return AuthComponent;
};

export default withAuth;
