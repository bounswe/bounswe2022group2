import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import EmailVerificationPage from './pages/EmailVerificationPage';
import ForgetPassword from './pages/ForgetPassword';
import LoginForm from './pages/LoginForm';
import HomePage from './pages/HomePage';
import SignUpForm from './pages/SignUpForm';
import PrivateRoutes from './pages/PrivateRoutes';
import PrivateRoutesVerify from './pages/PrivateRoutesVerify';
import ChangePassword from './pages/ChangePassword';
import NotFoundPage from './pages/NotFoundPage';

import CreateLS from './pages/CreateLS';
import LearningSpace from './pages/LearningSpace';

import CategoriesPage from './pages/CategoriesPage';


function App() {
  return (
     
    
    <div className="App">
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/login" element={<LoginForm/>}/>
          <Route path="/verify-email" element={<PrivateRoutesVerify> <EmailVerificationPage /> </PrivateRoutesVerify>}/>
          <Route path="/home" element={<PrivateRoutes> <HomePage /> </PrivateRoutes>}/>
          <Route path="/user/learning-spaces" element={<PrivateRoutes> <LearningSpace /> </PrivateRoutes>}/>
          <Route path="/forget-password" element={<ForgetPassword/>}/>
          <Route path="/change-password" element={<ChangePassword/>}/>
          <Route path="/create-ls" element={<PrivateRoutes> <CreateLS /> </PrivateRoutes>}/>
          <Route path="/categories" element={<PrivateRoutes> <CategoriesPage /> </PrivateRoutes>}/>
          <Route path='*' element={<NotFoundPage/>} />
        </Routes> 
      </BrowserRouter>

    </div>

    
  );
}

export default App;
