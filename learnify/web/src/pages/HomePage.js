import React from 'react';
import './style.css'
import logo from '../images/logo-dblue.png'
import illustration from '../images/learn-illustration.png'

function HomePage() {

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
                  This is home page.
            </div>
        </div>
    )       
}

export default HomePage;
