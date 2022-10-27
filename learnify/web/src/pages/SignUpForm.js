import React, {useState,setState} from 'react';
import { NavLink} from 'react-router-dom';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function SignUpForm() {
    
    const [userName, setUserName] = useState(null);
    const [email, setEmail] = useState(null);
    const [password,setPassword] = useState(null);
    const [confirmPassword,setConfirmPassword] = useState(null);
    const [isChecked, setIsChecked] = useState(false);

    const handleInputChange = (e) => {
        const {id , value} = e.target;
        if(id === "userName"){
            setUserName(value);
        }
        if(id === "email"){
            setEmail(value);
        }
        if(id === "password"){
            setPassword(value);
        }
        if(id === "confirmPassword"){
            setConfirmPassword(value);
        }
        if(id === "isChecked"){
            setIsChecked(value);
        }
    }

    const handleSubmit  = () => {
        console.log(userName,email,password,confirmPassword);
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
                        Login
                    </NavLink>
                </div>
                <div className="form">
                    <div className="form-body">
                        <div className="username">
                            <label className="form__label" for="userName">USERNAME </label>
                            <div className='space-3'></div>
                            <div>
                                <input className="form__input" type="text" value={userName} onChange = {(e) => handleInputChange(e)} id="userName" placeholder="User Name"/>
                            </div>
                        </div>
                        <div className="email">
                            <label className="form__label" for="email">E-MAIL </label>
                            <div className='space-3'></div>
                            <div>
                                <input  type="email" id="email" className="form__input" value={email} onChange = {(e) => handleInputChange(e)} placeholder="Email"/>
                            </div>
                        </div>
                        <div className="password">
                            <label className="form__label" for="password">PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input className="form__input" type="password"  id="password" value={password} onChange = {(e) => handleInputChange(e)} placeholder="Password"/>
                            </div>
                        </div>
                        <div className="confirm-password">
                            <label className="form__label" for="confirmPassword">CONFIRM PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input className="form__input" type="password" id="confirmPassword" value={confirmPassword} onChange = {(e) => handleInputChange(e)} placeholder="Confirm Password"/>
                            </div>
                        </div>
                        <div className='signup-checkbox-field'>
                            <label className='checkboxSignUpLabel'>
                                <input className='signup-checkbox' type="checkbox" value={isChecked} onChange = {(e) => handleInputChange(e)} />
                                <span> I have read the {" "}<a href="https://www.nvi.gov.tr/kvkk-aydinlatma-metni" target="_blank" rel="noopener noreferrer" className="registerKVKK">
                                        clarification on KVKK
                                    </a> and agree on all the terms and conditions.
                                </span>
                            </label>
                        </div>
                    </div>
                    <div class="signup-button">
                        <button onClick={()=>handleSubmit()} type="submit" class="btn-orange">Register</button>
                    </div>
                </div>
            </div>
        </div>
    )       
}

export default SignUpForm;