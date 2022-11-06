import React from 'react';
import { Navigate } from 'react-router-dom';

const PrivateRoutes = ({ children }) => {  
  var jwt=sessionStorage.getItem('token')

  return jwt ? children : <Navigate to= "/login" />;
};


export default PrivateRoutes;
