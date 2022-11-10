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
import NavBar from './pages/NavBar'
import NotFoundPage from './pages/NotFoundPage';

function App() {
  return (
     
    
    <div className="App">
      <NavBar/>
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/login" element={<LoginForm/>}/>
          <Route path="/verify-email" element={<PrivateRoutesVerify> <EmailVerificationPage /> </PrivateRoutesVerify>}/>
          <Route path="/home-page" element={<PrivateRoutes> <HomePage /> </PrivateRoutes>}/>
          <Route path="/forget-password" element={<ForgetPassword/>}/>
          <Route path="/change-password" element={<ChangePassword/>}/>
          <Route path='*' element={<NotFoundPage/>} />
        </Routes> 
      </BrowserRouter>

    </div>

    
  );
}

export default App;
