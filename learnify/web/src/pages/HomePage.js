import React from 'react';
import './style.css'
import mockup from '../images/451-mockup.jpg'
import NavBar from './NavBar';

function HomePage() {
  return(
        
        <div className='homePageLayout'>
            
            <NavBar/>
            <img src={mockup} alt="Learnify Home" class = 'mockup' height={860} />
        </div>
    )       
}

export default HomePage;
