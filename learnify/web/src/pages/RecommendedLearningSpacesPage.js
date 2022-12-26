import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './style.css';
import LearningSpaceDetailBox from '../components/LearningSpaceDetailBox';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';

function PopularLearningSpacesPage() {

    const [learningspaces, setLearningspaces] = useState([])

    const token = localStorage.getItem('token');

    useEffect(() => {
        const getPopularLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/user/recomended`, {
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`,
                }
            });
            setLearningspaces(res.data.learning_spaces);
        }
        getPopularLearningSpaces();
    }

}

export default PopularLearningSpacesPage;