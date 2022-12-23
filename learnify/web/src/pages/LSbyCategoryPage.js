import React, { useState, useEffect } from 'react';
import { useParams } from "react-router-dom"
import axios from 'axios';
import './style.css';
import LearningSpaceDetailBox from '../components/LearningSpaceDetailBox';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';

function titleCase(str) {
    if (!str) return;
    var spaceStr = str.replace(/-/g, ' ');
    var splitStr = spaceStr.toLowerCase().split(' ');
    for (var i = 0; i < splitStr.length; i++) {
        if (splitStr[i] !== 'and' ) {
            splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);
        }  
    }
    return splitStr.join(' '); 
 }

function LSbyCategoryPage() {

    const [learningspaces, setLearningspaces] = useState([])
    
    const { category } = useParams();

    const category_title = titleCase(category);

    useEffect(() => {
        const getLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/category/${category_title}`)
            setLearningspaces(res.data.learning_spaces)
            console.log(res.data.learning_spaces)
        }
        getLearningSpaces()
    }, [])

    const lsBoxes = learningspaces.map(ls => (
        <LearningSpaceDetailBox title={ls.title} description={ls.description} icon_id={ls.icon_id} num_participants={ls.num_participants} url={ls.id}/>
    ));

    return (
        <div>
            <NavBar/>
            <div className="lsbycategorypage-container">
                <div className="lsbycategorypage-wrapper">
                    <div className="lsbycategorypage-title">
                        <h1>Browsing the category:</h1>
                    </div>
                    <div className="lsbycategorypage-header">
                        <h1>{category_title}</h1>
                    </div>
                </div>
                <div className="lsbycategorypage-body">
                    {lsBoxes}
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default LSbyCategoryPage;