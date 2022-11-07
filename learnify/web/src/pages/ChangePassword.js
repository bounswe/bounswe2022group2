import React, { useState } from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function ChangePassword() {
    const email = localStorage.getItem('email');
    
    const formSchema = Yup.object().shape({
        password: Yup.string()
            .required("Password is required!")
            .matches(
                /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/,
                "Password must be 6 to 20 characters long and contain at least one uppercase, one lowercase letter, and one number!"
            ),
        confirmPassword: Yup.string()
            .required("You need to confirm your password!")
            .oneOf([Yup.ref("password")], "Passwords do not match!"),
    })
    const formOptions = { resolver: yupResolver(formSchema) }

    const { register, handleSubmit, formState } = useForm(
        formOptions,
        {defaultValues: {
            password: "",
            confirmPassword: ""
        }});
    const { errors } = formState

    const navigate = useNavigate();

    const [message, setMessage] = useState("");
    
    const changePassword = async (email, password) => {
        console.log(email)
        console.log(password)
        setMessage("Loading...");
        navigate("/home-page");
        
    };


    const onSubmit = (passwordData, event) => {
        event.preventDefault();
        changePassword(email, passwordData.password);
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
                    <NavLink to="/" className="welcome-navigation-item">
                        Sign Up
                    </NavLink>
                    <div className='space-8'/>
                    <NavLink to="/login" className="welcome-navigation-item">
                        Login
                    </NavLink>
                </div>
                <div className='space-20'/>
                <form onSubmit={handleSubmit(onSubmit)}>
                    <div className="form-body">
                        <div className="password">
                            <label className="form__label" htmlFor="email"> RESET PASSWORD  </label>
                            <div className='form-note'>
                                Enter the new password you would like to use.
                            </div>
                            <label className="form__label" htmlFor="password">PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.password ? 'is-invalid' : ''}`}
                                    type="password"
                                    data-testid="password"
                                    placeholder="Password"
                                    {...register('password')}
                                />
                                <div className="invalid-feedback" data-testid="password-error">{errors.password?.message}</div>
                            </div>
                        </div>
                        <div className="confirm-password">
                            <label className="form__label" htmlFor="confirmPassword">CONFIRM PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.confirmPassword ? 'is-invalid' : ''}`}
                                    type="password"
                                    data-testid="confirmPassword"
                                    placeholder="Confirm Password"
                                    {...register('confirmPassword')}
                                />
                                <div className="invalid-feedback" data-testid="cfpassword-error">{errors.confirmPassword?.message}</div>
                            </div>
                        </div>
                    </div>
                    <div className="signup-button">
                        <button 
                            onClick={handleSubmit(onSubmit)}
                            type="submit" 
                            data-testid="submit"
                            className="btn-orange">
                                Submit
                        </button>
                        <div className="submit-button-error">{message ? <p>{message}</p> : null}</div>
                    </div>
                </form>
            </div>
        </div>
    )       
}

export default ChangePassword;
