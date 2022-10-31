import React, {useState} from 'react';
import {NavLink, useNavigate} from 'react-router-dom';
import { yupResolver } from '@hookform/resolvers/yup'
import { useForm } from "react-hook-form";
import 'bootstrap/dist/css/bootstrap.min.css'
import * as Yup from 'yup'
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function LoginForm() {

    const formSchema = Yup.object().shape({
        email: Yup.string().email("Invalid email!")
            .required("Email is required!"),
        password: Yup.string()
            .required("Password is required!")
    })
    const formOptions = { resolver: yupResolver(formSchema) }

    const { register, handleSubmit, formState } = useForm(
        formOptions,
        {defaultValues: {
            email: "",
            password: "",
        }});
    const { errors } = formState

    const navigate = useNavigate();

    const [message, setMessage] = useState("");

    const loginUser = async (email, password) => {
        await fetch("http://3.75.151.200:3000/auth/login", {
            method: "POST",
            body: JSON.stringify({
                email: email,
                password: password
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
            .then((response) => {
                console.log(response.status);
                console.log(response.statusText);
                if (response.ok) {
                    console.log("successfull")
                    navigate('/home-page',{replace: true});
                    return response.json();
                } else {
                    response.json().then( json => {
                        setMessage(json.resultMessage)
                    });
                    throw Error(response.statusText);
                }
            })
            .catch((error) => {
                console.log(error.message);
            })
    };

    const onSubmit = (registerData, event) => {
        event.preventDefault();
        loginUser(registerData.email, registerData.password);
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
                    <NavLink to="/" activeclassname="welcome-navigation-item-active" className="welcome-navigation-item">
                        Sign Up
                    </NavLink>
                    <div className='space-8'/>
                    <NavLink to="/login" activeclassname="welcome-navigation-item-active" className="welcome-navigation-item">
                        Login
                    </NavLink>
                </div>
                <div className='space-20'/>
                <form onSubmit={handleSubmit(onSubmit)}>
                <div className="form-body">
                <div className="email">
                        <label className="form__label" htmlFor="email">E-MAIL </label>
                            <div className='space-3'></div>
                            <div>
                                <input 
                                    className={`form-control ${errors.email ? 'is-invalid' : ''}`}
                                    data-testid="email"
                                    type="email" 
                                    placeholder="Email"
                                    {...register('email')}
                                />
                                <div className="invalid-feedback">{errors.email?.message}</div>
                            </div>
                </div>
                    <div className="password">
                            <label className="form__label" htmlFor="password">PASSWORD </label>
                            <div className='space-3'></div>
                            <div>
                                <input
                                    className={`form-control ${errors.password ? 'is-invalid' : ''}`}
                                    data-testid="password"
                                    type="password" 
                                    placeholder="Password"
                                    {...register('password')}
                                />
                                <div className="invalid-feedback">{errors.password?.message}</div>
                            </div>
                        </div>
                
                    <div className="login-button">
                        <button onClick={()=>handleSubmit(onSubmit)} type="submit" data-testid="submit" className="btn-orange">Login</button>

                    </div>
                    <div className="login-button">
                        <NavLink to="/forget-password" >
                            <button className="btn-white" data-testid="forgotPassword">Forgot Password</button>
                        </NavLink>
                    </div>
                    </div>
                    <div className="login-button-error">{message ? <p>{message}</p> : null}</div>
                </form>
            </div>
        </div>
       
    )       
}

export default LoginForm;
