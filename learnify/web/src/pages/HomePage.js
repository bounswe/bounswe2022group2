import React from 'react';
import { useState, useEffect } from 'react';
import './style.css'
import LearningSpacePrev from '../components/LearningSpacePrev';
import FeedItem from '../components/FeedItem';
import CreateLearningSpaceButton from '../components/CreateLearningSpaceButton';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import axios from 'axios';


function HomePage() {

    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');

    const [myLearningSpaces, setMyLearningSpaces] = React.useState([]);
    const [popularLearningSpaces, setPopularLearningSpaces] = React.useState([]);
    const [recommendedLearningSpaces, setRecommendedLearningSpaces] = React.useState([]);

    useEffect(() => {
        const getOwnLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/user/participated`, {
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`,
                }
            });
            setMyLearningSpaces(res.data.learning_spaces);
        }
        getOwnLearningSpaces();
    }, []);

    const ownLearningSpaces = myLearningSpaces.map(ls => (
        <div className='lsprev-container'>
            <LearningSpacePrev title={ls.title} icon_id={ls.icon_id} url={ls.id} />
        </div>
    ));

    useEffect(() => {
        const getPopularLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace`, {
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`,
                }
            });
            setPopularLearningSpaces(res.data.learning_spaces);
        }
        getPopularLearningSpaces();
    }, []);

    const popularLearningSpacesList = popularLearningSpaces.slice(0, 10).map(ls => (
        <div className='lsprev-container'>
            <LearningSpacePrev title={ls.title} icon_id={ls.icon_id} url={ls._id} />
        </div>
    ));

    useEffect(() => {
        const getRecommendedLearningSpaces = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/user/recomended`, {
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`,
                }
            });
            setRecommendedLearningSpaces(res.data.learning_spaces);
        }
        getRecommendedLearningSpaces();
    }, []);

    const recommendedLearningSpacesList = recommendedLearningSpaces.map(ls => (
        <div className='lsprev-container'>
            <LearningSpacePrev title={ls.title} icon_id={ls.icon_id} url={ls.id} />
        </div>
    ));

  return(
    <div className='home'>
        <NavBar />
        <div className='home-content'>
            <div className='space-8'></div>
            <div className='home-layout'>
                <div className='home-upper-left'>
                    <div className='home-main'>
                        <div className='ls-box-layout-3'>
                            <div className='ls-box-header-layout'>
                                <div className='ls-box-label'>
                                    <label>
                                        My Learning Spaces
                                    </label>
                                </div>
                                <button className='ls-box-button' onClick={(e) => {
                                    e.preventDefault();
                                    window.location.href=`/${username}/learningspaces`;
                                    }}>
                                    view all
                                </button>
                            </div>
                            <div className='space-12'></div>
                            <div>
                                <div className="ls-prev-list-3">
                                    {ownLearningSpaces}
                                </div>
                            </div>
                        </div>
                        <CreateLearningSpaceButton />
                    </div>
                    <div className='space-30'></div>
                </div>
                <div className='feed-box'>
                    <label className='feed-title'>
                        Feed
                    </label>
                    <div className='space-5'></div>
                    <div className='feed-list-box'>
                        <FeedItem username="ecenur.sezar" action="created a learning space about How to Score a Free Kick in Football."/>
                        <FeedItem username="ezgidogu" action="commented on How to Swim."/>
                        <FeedItem username="altay" action="created a learning space about Michelangelo."/>
                        <FeedItem username="ecenur.sezar" action="commented on Music Theory."/>
                    </div>
                </div>
            </div>
            <div className='space-8'></div>
            <div className='home-layout'>
                <div className='ls-box-layout-4'>
                    <div className='ls-box-header-layout'>
                        <div className='ls-box-label'>
                            <label>
                                Popular Learning Spaces
                            </label>
                        </div>
                        <button className='ls-box-button' onClick={(e) => {
                            e.preventDefault();
                            window.location.href=`/popular`;
                            }}>
                            view all
                        </button>
                    </div>
                    <div className='space-12'></div>
                    <div>
                        <div className="ls-prev-list-4">
                            {popularLearningSpacesList}
                        </div>
                    </div>
                </div>
                <div className='ls-box-layout-4'>
                    <div className='ls-box-header-layout'>
                        <div className='ls-box-label'>
                            <label>
                                Recommended Learning Spaces
                            </label>
                        </div>
                        <button className='ls-box-button' onClick={(e) => {
                            e.preventDefault();
                            window.location.href=`/recommended`;
                            }}>
                            view all
                        </button>
                    </div>
                    <div className='space-12'></div>
                    <div>
                        <div className="ls-prev-list-4">
                            {recommendedLearningSpacesList}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
    )       
}

export default HomePage;
