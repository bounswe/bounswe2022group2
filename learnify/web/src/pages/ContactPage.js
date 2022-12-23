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
                </div>
                <div className='contact-page-right'>
                    
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default ContactPage;