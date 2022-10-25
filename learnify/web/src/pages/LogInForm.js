import React, {useState,setState} from 'react';
import {NavLink} from 'react-router-dom';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'
function LogInForm() {

    const [email, setEmail] = useState(null);
    const [password,setPassword] = useState(null);

    const handleInputChange = (e) => {
        const {id , value} = e.target;
        if(id === "email"){
            setEmail(value);
        }
        if(id === "password"){
            setPassword(value);
        }
    }

    const handleSubmit  = () => {
        console.log("email and password was entered as");
        console.log(email,password);
    }

    return(
        <div className='pageLayout'>
            <div className='leftPart'>
                <div className='login-page-logo'>
                    <img src={logo} alt="Learnify Logo" height={80} />
                </div>
                <div className='login-page-illustration'>
                    <img src={illustration} alt="Welcome Illustration" height={400} />
                </div>
                <div className='illustration-text'>
                    Learnify. Where <span className='bold-text'>learning</span> is achieved <span className='bold-text'>through collaboration.</span>
                </div>
            </div>
            <div className="rightPart">
                <div className='welcome-navigation'>
                    <NavLink to="/" activeClassName="welcome-navigation-item-active" className="welcome-navigation-item">
                        Sign Up
                    </NavLink>
                    <div className='space-8'/>
                    <NavLink to="/login" activeClassName="welcome-navigation-item-active" className="welcome-navigation-item">
                        Log In
                    </NavLink>
                </div>
                <div className="form">
                    
                    <div className='space-50'/>
                    <div className="email">
                        <label className="form__label" for="email">EMAIL </label>
                        <input  type="email" id="email" className="form__input" value={email} onChange = {(e) => handleInputChange(e)} placeholder="Email"/>
                    </div>

                    <div className='space-50'/>

                    <div className="password">
                        <label className="form__label" for="password">PASSWORD </label>
                        <input className="form__input" type="password"  id="password" value={password} onChange = {(e) => handleInputChange(e)} placeholder="Password"/>
                    </div>
                
                    <div class="signup-button">
                        <button onClick={()=>handleSubmit()} type="submit" class="btn-orange">Log In</button>
                    </div>
                    <NavLink to="/" className="additional-Nav-Text">
                    Forgot Password
                    </NavLink>
                </div>
            </div>
        </div>
       
    )       
}

export default LogInForm;