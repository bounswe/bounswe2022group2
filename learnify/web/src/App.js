import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import Header from './pages/Header';
import LoginForm from './pages/LoginForm';
import SignUpForm from './pages/SignUpForm';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/login" element={<LoginForm/>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
