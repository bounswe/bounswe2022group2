import React, {useState,setState} from 'react';
import { NavLink} from 'react-router-dom';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function SignUpForm() {
    
    const formSchema = Yup.object().shape({
        username: Yup.string()
            .required("Username is required!")
            .min(3, "Username must be at least 3 characters long!"),
        email: Yup.string().email("Invalid email!")
            .required("Email is required!"),
        password: Yup.string()
            .required("Password is required!")
            .matches(
                /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/,
                "Password must be 6 to 20 characters long and contain at least one uppercase, one lowercase letter, and one number!"
            ),
        confirmPassword: Yup.string()
            .required("You need to confirm your password!")
            .oneOf([Yup.ref("password")], "Passwords do not match!"),
        kvkk: Yup.boolean()
            .oneOf([true], "You must agree the KVKK confirmation!")
    })
    const formOptions = { resolver: yupResolver(formSchema) }

    const { register, handleSubmit, formState } = useForm(formOptions);
    const { errors } = formState
    const onSubmit = (data) => {
        console.log(data);
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
                <form onSubmit={handleSubmit(onSubmit)}>
                    <div className="form-body">
                        <div className="username">
                            <label className="form__label" for="username">USERNAME </label>
                            <div className='space-3'></div>
                            <div>
                                <input 
                                    className={`form-control ${errors.username ? 'is-invalid' : ''}`}
                                    type="text" 
                                    placeholder="Username"
                                    {...register('username')}
                                />
                                <div className="invalid-feedback">{errors.username?.message}</div>
                            </div>
                        </div>
                        <div className="email">
                            <label className="form__label" for="email">E-MAIL </label>
                            <div className='space-3'></div>
                            <div>
                                <input 
                                    className={`form-control ${errors.email ? 'is-invalid' : ''}`}
                                    type="email" 
                                    placeholder="Email"
                                    {...register('email')}
                                />
                                <div className="invalid-feedback">{errors.email?.message}</div>
                            </div>
                        </div>
                        <div className="password">
                            <label className="form__label" for="password">PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.password ? 'is-invalid' : ''}`}
                                    type="password" 
                                    placeholder="Password"
                                    {...register('password')}
                                />
                                <div className="invalid-feedback">{errors.password?.message}</div>
                            </div>
                        </div>
                        <div className="confirm-password">
                            <label className="form__label" for="confirmPassword">CONFIRM PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.confirmPassword ? 'is-invalid' : ''}`}
                                    type="password"
                                    placeholder="Confirm Password"
                                    {...register('confirmPassword')}
                                />
                                <div className="invalid-feedback">{errors.confirmPassword?.message}</div>
                            </div>
                        </div>
                        <div className='signup-checkbox-field'>
                            <label className='checkboxSignUpLabel'>
                                <input 
                                    className={`form-check-input ${errors.kvkk ? 'is-invalid' : ''}`}
                                    type="checkbox" 
                                    {...register('kvkk')}
                                />
                                <span> I have read the {" "}<a href="https://www.nvi.gov.tr/kvkk-aydinlatma-metni" target="_blank" rel="noopener noreferrer" className="registerKVKK">
                                        clarification on KVKK
                                    </a> and agree on all the terms and conditions.
                                </span>
                                <div className="invalid-feedback">{errors.kvkk?.message}</div>
                            </label>
                        </div>
                    </div>
                    <div class="signup-button">
                    <NavLink to="/verify-email">
                        <button onClick={handleSubmit(onSubmit)} type="submit" class="btn-orange">Register</button>
                    </NavLink>
                    </div>
                </form>
            </div>
        </div>
    )       
}

export default SignUpForm;
