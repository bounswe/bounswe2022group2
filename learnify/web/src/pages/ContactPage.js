import React, { useCallback, useEffect, useState } from 'react';
import './style.css'
import NavBar from '../components/NavBar';
import Footer from '../components/Footer';


function ContactPage() {
    const [name, setName] = useState("");
    const [description, setDescription] = useState("");

    return (
        <div>
            <NavBar/>
            <div className='contact-page'>
                <div className='contact-page-left'>
                    
                </div>
                <div className='contact-page-middle'>
                    <div className='contact-title'>
                        Tell Us About Any Issues
                    </div>
                    <div className='space-20' />
                    <label className='ls-box-lb-option'> Subject of your issue </label>
                    <div className='space-5' />
                    <label>
                        <span className='contact-box' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setName(e.target.textContent)}></span>
                    </label>
                    <div className='space-20' />
                    <label className='ls-box-lb-option'> Can you please specify the problem? </label>
                    <div className='space-5' />
                    <label>
                        <span className='contact-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setDescription(e.target.textContent)}></span>
                    </label>
                </div>
                <div className='contact-page-right'>
                    
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default ContactPage;