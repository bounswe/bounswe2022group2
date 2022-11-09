import React, { useState } from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function EmailVerificationPage() {

    const email = localStorage.getItem('email');

    const [loading, setLoading]= useState(false);

    const [orange, setOrange] = useState(true);

    const [message, setMessage] = useState("");

    const [messageResend, setMessageResend] = useState("");
    
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
    
    const verifyUser = async (email, verificationCode) => {
        await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}/auth/verifyEmail`, {
            method: "POST",
            body: JSON.stringify({
                email: email,
                code: verificationCode
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
            .then((response) => {
                console.log(response.status);
                console.log(response.statusText);
                if (response.ok) {
                    localStorage.setItem("token", response.json().token)
                    navigate('/home-page', {replace: true});
                    return response.json();
                } else {
                    response.json().then( json => {
                        setMessage(json.resultMessage)
                    });
                    throw Error(response.statusText);
                }
            })
            .catch((err) => {
                console.log(err.message);
            })
    };

    const resendEmail = async (email) => {
        await fetch("http://3.75.151.200:3000/auth/resend", {
            method: "POST",
            body: JSON.stringify({
                email: email
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
            .then((response) => {
                console.log(response.status);
                console.log(response.statusText);
                if (response.ok) {
                    return response.json();
                } else {
                    response.json().then( json => {
                        setMessageResend(json.resultMessage)
                    });
                    throw Error(response.statusText);
                }
            })
            .catch((err) => {
                console.log(err.message);
            })
    };


    const onSubmit = (registerData, event) => {
        event.preventDefault();
        verifyUser(email, registerData.verificationCode);
    }

    const handleSubmitResend  = () => {
        setLoading(current => true);
        setOrange(current => false);

        resendEmail(email);
        setTimeout(() => {
            setLoading(current => false);
            setOrange(current => true);
          }, 180000);
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
                            <label className="form__label" htmlFor="verificationCode">VERIFICATION CODE </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.verificationCode ? 'is-invalid' : ''}`}
                                    data-testid="verificationCode"
                                    type="verificationCode" 
                                    placeholder="Verification Code"
                                    {...register('verificationCode')}
                                />
                                <div className="invalid-feedback" data-testid="verificationCode-error">{errors.verificationCode?.message}</div>
                            </div>
                        </div>
                    </div>
                    <div className="signup-button">
                        <button 
                            onClick={handleSubmit(onSubmit)}
                            type="submit" 
                            data-testid="submit"
                            className="btn-orange">
                                Verify
                        </button>
                        <div className="submit-button-error">{message ? <p>{message}</p> : null}</div>
                    </div>
                    <div className="signup-button">
                        <button className={orange ? "btn-orange" : "btn-grey"} onClick={()=>handleSubmitResend()} type="submit" data-testid="submitResend" disabled={loading}>
                        {loading && (
                            <i
                            className="fa fa-refresh fa-spin"
                            />
                        )}
                        {loading && <span>Please Wait 3 Minutes Before Resending</span>}
                        {!loading && <span>Resend</span>}
                        </button>
                    </div>
                    <div className="submit-button-error">{messageResend ? <p>{messageResend}</p> : null}</div>
                </form>
            </div>
        </div>
    )       
}

export default EmailVerificationPage;
