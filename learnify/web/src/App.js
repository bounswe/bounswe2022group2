import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import EmailVerificationPage from './pages/EmailVerificationPage';
import ForgetPassword from './pages/ForgetPassword';
import LoginForm from './pages/LoginForm';
import HomePage from './pages/HomePage';
import SignUpForm from './pages/SignUpForm';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>

          <Route path="/login" element={<LoginForm/>}/>
          <Route path="/verify-email" element={<EmailVerificationPage/>}/>
          <Route path="/home-page" element={<HomePage/>}/>
          <Route path="/forget-password" element={<ForgetPassword/>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
