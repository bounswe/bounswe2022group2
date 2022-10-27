import React, {useState,setState} from 'react';
import { NavLink} from 'react-router-dom';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function ForgetPassword() {
    
    const [email, setEmail] = useState(null);


    const handleInputChange = (e) => {
        const {id , value} = e.target;
        if(id === "email"){
            setEmail(value);
        }
    }

    const handleSubmit  = () => {
        console.log(email);
    }

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
                    <NavLink to="/" activeClassName="welcome-navigation-item-active" className="welcome-navigation-item">
                        Sign Up
                    </NavLink>
                    <div className='space-8'/>
                    <NavLink to="/login" activeClassName="welcome-navigation-item-active" className="welcome-navigation-item">
                        Sign In
                    </NavLink>
                </div>
                <div className="form">
                    <div className="form-body">
                        <div className="email">
                            <label className="form__label" for="email"> RESET PASSWORD  </label>
                            <div/>
                            <label className="text-body">
                                Enter your email address and we'll send you a code to reset your password.
                            </label>
                            <div className='space-3'></div>
                            <div>
                                <input  type="email" id="email" className="form__input" value={email} onChange = {(e) => handleInputChange(e)} placeholder="Email"/>
                            </div>
                        </div>
                    </div>
                    <div class="signup-button">
                    <NavLink to="/verify-email">
                        <button onClick={()=>handleSubmit()} type="submit" class="btn-orange">Send Code</button>
                    </NavLink>
                    </div>
                </div>
            </div>
        </div>
    )       
}

export default ForgetPassword;
