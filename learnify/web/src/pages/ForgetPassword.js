import React, {useState} from 'react';
import { NavLink, useNavigate} from 'react-router-dom';
import { useForm } from "react-hook-form";
import * as Yup from 'yup'
import { yupResolver } from '@hookform/resolvers/yup'
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function ForgetPassword() {   
    const [message, setMessage] = useState("");
    const navigate = useNavigate();

    const validation = Yup.object().shape({
        email: Yup.string()
        .email("Invalid email format!")
        .required("Required"),
     })

     const formOptions = { resolver: yupResolver(validation) }
     const { register, handleSubmit, formState } = useForm(
            formOptions,
            {defaultValues: {
                email: "",
            }});
    
    const { errors } = formState


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
                    localStorage.setItem("emailVerified", true);
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

    const onSubmit = (data, event) => {
        event.preventDefault();
        forgetPassword(data.email);
    };


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
                <form onSubmit={handleSubmit(onSubmit)}>
                    <div className="form-body">
                        <div className="email">
                            <label className="form__label" htmlFor="email"> RESET PASSWORD  </label>
    
                           <div className='form-note'>
                                Enter your email address and we'll send you a code to reset your password.
                            </div>
                            
                            <div>
                                <input
                                    className= {`form-control ${errors.email ? 'is-invalid' : ''}`}
                                    type="email" 
                                    data-testid="email"
                                    placeholder="Email"
                                    {...register("email")}                                   
                                />
                                <div className="invalid-feedback" data-testid="email-error">{errors.email?.message}</div>
                            </div>
                        </div>
                    </div>
                    <div className="signup-button">
                        <button
                            onClick={handleSubmit(onSubmit)} 
                            type="submit"
                            data-testid="submit"
                            className="btn-orange">
                                Send Code
                        </button>
                        <div className="submit-button-error">{message ? <text>{message}</text> : null}</div>
                    </div>
                </form>
            </div>
        </div>
    )       
}

export default ForgetPassword;
