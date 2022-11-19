import React from 'react';
import { NavLink } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'
import ChangePwdForm from '../components/ChangePwdForm';

function ChangePassword() {

    return(
        <div className='pageLayout'>
            <div className='leftPart'>
                <div className='signup-page-logo'>
                    <img src={logo} alt="Learnify Logo" height={80} />
                </div>
                <div className='signup-page-illustration'>
                    <img src={illustration} alt="Welcome Illustration" height={400} />
                </div>
                <div className='illustration-text'>
                    Learnify. Where <span className='bold-text'>learning</span> is achieved <span className='bold-text'>through collaboration.</span>
                </div>
            </div>
            <div className='rightPart'>
                <div className='welcome-navigation'>
                    <NavLink to="/" className="welcome-navigation-item">
                        Sign Up
                    </NavLink>
                    <div className='space-8'/>
                    <NavLink to="/login" className="welcome-navigation-item">
                        Login
                    </NavLink>
                </div>
                <div className='space-20'/>
                <ChangePwdForm/>
            </div>
        </div>
    )       
}

export default ChangePassword;
