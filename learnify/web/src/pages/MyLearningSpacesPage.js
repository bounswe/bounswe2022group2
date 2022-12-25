import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './style.css';
import LearningSpaceDetailBox from '../components/LearningSpaceDetailBox';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';

function MyLearningSpacesPage() {

    const [learningspaces, setLearningspaces] = useState([])

    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');

    useEffect(() => {
        const getOwnLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/user/participated`, {
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`,
                }
            });
            setLearningspaces(res.data.learning_spaces);
        }
        getOwnLearningSpaces();
    }, []);

    const lsBoxes = learningspaces.map(ls => (
        <LearningSpaceDetailBox title={ls.title} description={ls.description} icon_id={ls.icon_id} num_participants={ls.num_participants} url={ls.id}/>
    ));

    return (
        <div>
            <NavBar/>
            <div className="mylspage-container">
                <div className="mylspage-wrapper">
                    <div className="mylspage-title">
                        <h1>Browsing the learning spaces of:</h1>
                    </div>
                    <div className="mylspage-header" data-testid="myls-username">
                        <h1>{username}</h1>
                    </div>
                </div>
                <div className="mylspage-body" data-testid="myls-body">
                    {lsBoxes}
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default MyLearningSpacesPage;