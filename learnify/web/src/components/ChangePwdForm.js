import React, { useState } from 'react';
import './component_styles.css';
import { useNavigate } from 'react-router-dom';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import 'bootstrap/dist/css/bootstrap.min.css'

export default function ChangePwdForm(props) {
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
        navigate("/home");
        
    };


    const onSubmit = (passwordData, event) => {
        event.preventDefault();
        changePassword(email, passwordData.password);
    }
    return (
        <div>
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
                                    placeholder="New Password"
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
                                    placeholder="Confirm New Password"
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
        );
    }