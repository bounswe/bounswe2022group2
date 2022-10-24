import { BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import Header from './pages/Header';
import SignInForm from './pages/SignInForm';
import SignUpForm from './pages/SignUpForm';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
      <Header/>
        <Routes>  
          <Route path="/" element={<SignUpForm/>}/>
          <Route path="/signin" element={<SignInForm/>}/>
        </Routes> 
      </BrowserRouter>
    </div>
  );
}

export default App;
