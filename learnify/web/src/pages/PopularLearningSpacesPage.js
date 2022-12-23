import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './style.css';
import LearningSpaceDetailBox from '../components/LearningSpaceDetailBox';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';

function PopularLearningSpacesPage() {

    return (
        <div>
            <NavBar/>
            <div className="popularlspage-container">
                <div className="popularlspage-wrapper">
                    <div className="popularlspage-title">
                        <h1>Browsing the current most popular learning spaces:</h1>
                    </div>
                </div>
                <div className="popularlspage-body" data-testid="popularls-body">
                    {lsBoxes}
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default PopularLearningSpacesPage;