import React, {useState,setState} from 'react';
import { NavLink} from 'react-router-dom';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function EmailVerificationPage() {
    
    const [verificationCode, setVerificationCode] = useState(null);

    const handleInputChange = (e) => {
        const {id , value} = e.target;
        if(id === "verificationCode"){
            setVerificationCode(value);
        }
    }

    const handleSubmit  = () => {
        console.log(verificationCode);
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
                        <div className="verificationCode">
                            <label className="form__label" for="verificationCode">VERIFICATION CODE </label>
                            <div className='space-3'></div>
                            <div>
                                <input className="form__input" type="text" value={verificationCode} onChange = {(e) => handleInputChange(e)} id="verificationCode" placeholder="Verification Code"/>
                            </div>
                        </div>
                    </div>
                    <div class="signup-button">
                        <NavLink to="/home-page">
                            <button onClick={()=>handleSubmit()} type="submit" class="btn-orange">Verify</button>
                        </NavLink>
                    </div>
                </div>
            </div>
        </div>
    )       
}

export default EmailVerificationPage;
