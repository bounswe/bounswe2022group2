import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import EmailVerificationPage from './pages/EmailVerificationPage';
import Header from './pages/Header';
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
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
