import * as React from 'react';
import './component_styles.css';

export default function Footer() {

    const year = new Date().getFullYear();

    const currentUser = localStorage.getItem('username')

    return (
        <div className='footer-parent-layout' data-testid="footer">
            <div className='footer-container'>
                <div className='footer-row'>
                    <div className='footer-column-l'>
                        <div className='footer-item-bold'>Learnify</div>
                        <div className='footer-item-reg'>is a learning space for everyone, where learning is <br></br> achieved through collaboration.</div>
                    </div>
                    <div className='footer-column-r'>
                        <a href="/home" className='footer-item-bold'>Home</a>
                        <a href="/categories" className='footer-item-bold'>Categories</a>
                        <a href="/notifications" className='footer-item-bold'>Notifications</a>
                    </div>
                    <div className='footer-column-r'>
                        <a href={`/profile/${currentUser}`} className='footer-item-bold'>Profile</a>
                        <a href="/contact" className='footer-item-bold'>Contact</a>
                        <a href="/about" className='footer-item-bold'>About</a>
                    </div>
                    <div className='footer-column-r'>
                        <a href={`/${currentUser}/learningspaces`} className='footer-item-bold'>My Learning Spaces</a>
                        <a href="/popular-learning-spaces" className='footer-item-bold'>Popular Learning Spaces</a>
                        <a href="/recommended-learning-spaces" className='footer-item-bold'>Recommended Learning Spaces</a>
                    </div>
                    <div className='footer-column-r'>
                        {year} © Learnify Team. All rights reserved.
                    </div>
                </div>
            </div>
        </div>
    );
}