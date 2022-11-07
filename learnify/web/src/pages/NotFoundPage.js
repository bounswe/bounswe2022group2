import React from 'react';
import {useNavigate} from 'react-router-dom';
import './style.css'
import notfound from '../images/404NotFound.png'
import logo from '../images/logo-dblue.png'

function NotFoundPage() {

  const navigate = useNavigate();

  return(        
        <div className='notFoundPageLayout'>
            <div className='welcomeNotFound'>
                <div className='notfound-page-logo'>
                    <img src={logo} alt="Learnify Logo" height={60} />
                </div>
                <div className='notfoundpage-text'><h1>Oops! Something went wrong!</h1>
                </div>
            </div>
            <img src={notfound} style={{ width: "70%", height: "80.5%" }} alt="Learnify 404 Not Found" class = 'mockup'/> 
            <button className="btn-blue" onClick={() => navigate(-1)}>Return</button>
        </div>
    )       
}

export default NotFoundPage;
