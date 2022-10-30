import React, {useState} from 'react';
import { NavLink, useNavigate} from 'react-router-dom';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function ForgetPassword() {
    
    const [email, setEmail] = useState(null);

    const [message, setMessage] = useState("");
    const navigate = useNavigate();

    const forgetPassword = async (email) => {
        await fetch("http://3.75.151.200:3000/auth/resend", {
            method: "POST",
            body: JSON.stringify({
                email: email,
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
            .then((response) => {
                if (response.status === 200) {
                    navigate('/verify-email', {replace: true});
                    console.log("Password reset link has been sent to your email address!");
                } else {
                    response.json().then( json => {
                        setMessage(json.resultMessage)
                    });
                    console.log("There is no user with this email address!");
                }
            })
            .catch((error) => {
                console.log(error);
            });
    };


    const handleInputChange = (e) => {
        const {id , value} = e.target;
        if(id === "email"){
            setEmail(value);
        }
    }

    
    const handleSubmit  = () => {
        forgetPassword(email);
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
                        Login
                    </NavLink>
                </div>
                <div className="form">
                    <div className="form-body">
                        <div className="email">
                            <label className="form__label" for="email"> RESET PASSWORD  </label>
    
                           <div className='form-note'>
                                Enter your email address and we'll send you a code to reset your password.
                            </div>
                            
                            <div>
                                <input  type="email" id="email" className="form__input" value={email} onChange = {(e) => handleInputChange(e)} placeholder="Email"/>
                            </div>
                        </div>
                    </div>
                    <div class="signup-button">
                        <button 
                            onClick={()=>handleSubmit()} 
                            type="submit" 
                            class="btn-orange">
                                Send Code
                        </button>
                        <div className="submit-button-error">{message ? <p>{message}</p> : null}</div>
                    </div>
                </div>
            </div>
        </div>
    )       
}

export default ForgetPassword;
