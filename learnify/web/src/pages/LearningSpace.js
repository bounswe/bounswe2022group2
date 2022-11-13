import React from 'react';
import './style.css'
import LearningSpacePrev from '../components/LearningSpacePrev';
import CreateLearningSpaceButton from '../components/CreateLearningSpaceButton';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';


function LearningSpace() {

  return(
    <div className='home'>
        <NavBar />
        <div className='home-content'>
            
        </div>
        <Footer />
    </div>
    )       
}

export default LearningSpace;
