import React from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'
import ButtonLoader from "../buttonIndex";

function EmailVerificationPage() {
    
    const formSchema = Yup.object().shape({
        verificationCode: Yup.string()
            .required("Verification Code is required!")
            .matches(
                /^\d{4}$/,
                "Verification Code must contain exactly 4 digit number!"
            ),
    })
    const formOptions = { resolver: yupResolver(formSchema) }

    const { register, handleSubmit, formState } = useForm(
        formOptions,
        {defaultValues: {
            verificationCode: "",
        }});
    const { errors } = formState

    const navigate = useNavigate();

    const onSubmit = (data, event) => {
        console.log(data, event);
        event.preventDefault();
        navigate('/home-page', {replace: true});
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
                        <div className="verificationCode">
                            <label className="form__label" for="verificationCode">VERIFICATION CODE </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.verificationCode ? 'is-invalid' : ''}`}
                                    type="verificationCode" 
                                    placeholder="Verification Code"
                                    {...register('verificationCode')}
                                />
                                <div className="invalid-feedback">{errors.verificationCode?.message}</div>
                            </div>
                        </div>
                    </div>
                    <div class="signup-button">
                        <button 
                            onClick={handleSubmit(onSubmit)}
                            type="submit" 
                            class="btn-orange">
                                Verify
                        </button>
                    <div className='space-8'/>
                    <ButtonLoader />
                    </div>
                </form>
            </div>
        </div>
    )       
}

export default EmailVerificationPage;
