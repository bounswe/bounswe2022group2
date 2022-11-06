import React from 'react';
import { Navigate } from 'react-router-dom';

const PrivateRoutesVerify = ({ children }) => {  
var jwt=localStorage.getItem('emailVerified')

return jwt ? children : <Navigate to= "/" />;
};


export default PrivateRoutesVerify;
