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
                <label className='ls-box-label'> Create a Learning Space </label>

                <div className='space-20' />
                <label className='ls-box-label'> Select Category</label>
                <Dropdown/>
                <label className='ls-box-label'> Select an Icon</label>
                <SelectIconGrid/>

            </div>
        </div>
    )       
}

export default CreateLS;
