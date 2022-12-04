import React, { useState, useEffect } from 'react';
import axios from 'axios';
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
import LSbyCategoryPage from './pages/LSbyCategoryPage';


function App() {

  const [categories, setCategories] = useState([])
  const [learningspaces, setLearningspaces] = useState([])

  useEffect(() => {
      const getCategory = async () => {
          const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}categories`)
          setCategories(res.data.Categories)
      }
      getCategory()
  }, [])

  useEffect(() => {
      const getLearningSpaces = async () => {
          const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace`)
          setLearningspaces(res.data.learning_spaces)
      }
      getLearningSpaces()
  }, [])

  const categoryRoutes = categories.map(category => (
    <Route path={`/categories/${category.toLowerCase().replace(/\s+/g, '-')}`} element={<PrivateRoutesVerify> <LSbyCategoryPage title={category}/> </PrivateRoutesVerify>}/>
  ));

  // const lsRoutes = learningspaces.map(ls => (
  //   <Route path={`/${ls._id}`} element={<PrivateRoutesVerify> <LearningSpacePage id={ls._id}/> </PrivateRoutesVerify>}/>
  // ));

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
          {categoryRoutes}
          {/* {lsRoutes} */}
        </Routes>
      </BrowserRouter>

    </div>

    
  );
}

export default App;
