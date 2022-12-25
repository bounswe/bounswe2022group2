import React from 'react';
import {useNavigate} from 'react-router-dom';
import './style.css'
import notfound from '../images/404NotFound.jpg'
import logo from '../images/logo-dblue.png'

function NotFoundPage() {

  const navigate = useNavigate();

  return(        
        <div className='notFoundPageLayout'>
            <div className='notfound-page-logo'>
                <img  style={{float:"left"}} src={logo} alt="Learnify Logo" height={60} />
            </div>
            <div className='notfoundpage-text'><h1>Oops! Something went wrong!</h1></div>
            <img src={notfound} style={{ width: "60%"}} alt="Learnify 404 Not Found" className = 'mockup'/> 
            <div>
                <button className="btn-blue" onClick={() => navigate(-1)}>Return</button>
            </div>
        </div>
    )       
}

export default NotFoundPage;
