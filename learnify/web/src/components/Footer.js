import * as React from 'react';
import './component_styles.css';

export default function Footer() {

    const year = new Date().getFullYear();

    return (
        <div className='footer-parent-layout'>
            <div className='footer-container'>
                <div className='footer-row'>
                    <div className='footer-column-l'>
                        <div className='footer-item-bold'>Learnify</div>
                        <div className='footer-item-reg'>is a learning space for everyone, where learning is <br></br> achieved through collaboration.</div>
                    </div>
                    <div className='footer-column-r'>
                        <div className='footer-item-bold'>Home</div>
                        <div className='footer-item-bold'>Categories</div>
                        <div className='footer-item-bold'>Notifications</div>
                    </div>
                    <div className='footer-column-r'>
                        <div className='footer-item-bold'>Profile</div>
                        <div className='footer-item-bold'>Contact</div>
                        <div className='footer-item-bold'>About</div>
                    </div>
                    <div className='footer-column-r'>
                        <div className='footer-item-bold'>My Learning Spaces</div>
                        <div className='footer-item-bold'>Popular Learning Spaces</div>
                        <div className='footer-item-bold'>Recommended Learning Spaces</div>
                    </div>
                    <div className='footer-column-r'>
                        {year} © Learnify Team. All rights reserved.
                    </div>
                </div>
            </div>
        </div>
    );
}