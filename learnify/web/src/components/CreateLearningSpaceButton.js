import * as React from 'react';
import './component_styles.css';
import add_button_icon from '../images/add-btn.svg';
import ls_create_illustration from '../images/create-ls.png';
import {useNavigate } from 'react-router-dom';


export default function CreateLearningSpaceButton() {
    const navigate = useNavigate();
    const onClick = () => {
        navigate('/create-ls', {replace: true});
        
    }

    return (
        <div>
            <div className='create-ls-btn' onClick={onClick}>
                <div className='ls-button-left'>
                    <label className='create-ls-btn-label'> {"Create New"} <br></br> Learning <br></br> Space</label>
                    <img src={add_button_icon} className="add-button-icon" alt="add button" height={50} />               
                </div>
                <img src={ls_create_illustration} className='ls-create-illustration' alt='button illustration' height={240} />
            </div>
        </div>
    );
} 