import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './style.css';
import LearningSpaceDetailBox from '../components/LearningSpaceDetailBox';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';

function PopularLearningSpacesPage() {

    const [learningspaces, setLearningspaces] = useState([])

    const token = localStorage.getItem('token');

}

export default PopularLearningSpacesPage;