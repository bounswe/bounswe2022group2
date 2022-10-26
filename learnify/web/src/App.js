import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import EmailVerificationPage from './pages/EmailVerificationPage';
import Header from './pages/Header';
import HomePage from './pages/HomePage';
import SignInForm from './pages/SignInForm';
import SignUpForm from './pages/SignUpForm';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/signin" element={<SignInForm/>}/>
          <Route path="/verify-email" element={<EmailVerificationPage/>}/>
          <Route path="/home-page" element={<HomePage/>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
