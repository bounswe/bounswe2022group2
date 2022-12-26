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
    }, []);

    const lsBoxes = learningspaces.map(ls => (
        <LearningSpaceDetailBox title={ls.title} description={ls.description} icon_id={ls.icon_id} num_participants={ls.num_participants} url={ls._id}/>
    ));

    return (
        <div>
            <NavBar/>
            <div className="recommendedlspage-container">
                <div className="recommendedlspage-wrapper">
                    <div className="recommendedlspage-title">
                        <h1>Browsing the recommended learning spaces:</h1>
                    </div>
                </div>
                <div className="recommendedlspage-body" data-testid="recommendedlspage-body">
                    {lsBoxes}
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default PopularLearningSpacesPage;