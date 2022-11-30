import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import Dropdown from '../components/Dropdown';
import NavBar from '../components/NavBar';
import SelectIconGrid from '../components/SelectIconGrid';

function CreateLS() {

    return(
        <div>
             <NavBar />
            <div className='home'>
                    <label className='ls-box-lb-option-large'> Create Learning Space </label>
                    <div className='space-20' />
                <div className='home-container'>
                    <div className='ls-box'>
                    <label className='ls-box-lb-option'> Learning Space Name </label>
                    <div className='space-5' />
                    <label>
                    <span className='details-box' role='textbox' contentEditable></span>
                    </label>
                    </div>
                    <div className='ls-box'>
                    <label className='ls-box-lb-option'> Learning Space Description </label>
                    <div className='space-5' />
                    <label>
                    <span className='details-box' role='textbox' contentEditable></span>
                    </label>
                    </div>
                    <div className='ls-box'>
                    <label className='ls-box-lb-option'> Select Category</label>
                    <div className='space-5' />
                    <Dropdown/>
                    </div>
                </div>
            
                <div className='space-20' />
                <label className='ls-box-lb-option'> Select an Icon</label>
                <SelectIconGrid/>
                <div className='space-20' />
                <label>
                    <input type='submit' className='ls-create-btn' value='Create Learning Space' />
                </label>

            </div>
        </div>
    )       
}

export default CreateLS;
//<input type='text' className='details-box' placeholder='Learning Space Description' />