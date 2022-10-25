import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import Header from './pages/Header';
import LogInForm from './pages/LogInForm';
import SignUpForm from './pages/SignUpForm';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/login" element={<LogInForm/>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
