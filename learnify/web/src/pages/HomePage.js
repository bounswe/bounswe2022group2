import React from 'react';
import { useState, useEffect } from 'react';
import './style.css'
import LearningSpacePrev from '../components/LearningSpacePrev';
import FeedItem from '../components/FeedItem';
import CreateLearningSpaceButton from '../components/CreateLearningSpaceButton';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import axios from 'axios';
import lslogo_13 from '../images/ls_icons/ls-icon-13.svg'
import lslogo_6 from '../images/ls_icons/ls-icon-6.svg'
import lslogo_20 from '../images/ls_icons/ls-icon-20.svg'
import lslogo_19 from '../images/ls_icons/ls-icon-19.svg'
import lslogo_18 from '../images/ls_icons/ls-icon-18.svg'
import lslogo_17 from '../images/ls_icons/ls-icon-17.svg'
import lslogo_16 from '../images/ls_icons/ls-icon-16.svg'


function HomePage() {

    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');

    const [myLearningSpaces, setMyLearningSpaces] = React.useState([]);
    const [popularLearningSpaces, setPopularLearningSpaces] = React.useState([]);

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

    console.log(popularLearningSpaces.slice(0, 10))

    const popularLearningSpacesList = popularLearningSpaces.slice(0, 10).map(ls => (
        <div className='lsprev-container'>
            <LearningSpacePrev title={ls.title} icon_id={ls.icon_id} url={ls._id} />
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
                                <button className='ls-box-button'>
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
                        <FeedItem username="bahri" action="created a learning space about github templates."/>
                        <FeedItem username="onur" action="joined a learning space about creating an endpoint at 06:48."/>
                        <FeedItem username="batuhan" action="commented its not magic its years of engineering."/>
                        <FeedItem username="egemen" action="followed ecenur"/>
                        <FeedItem username="gokay" action="followed altay"/>
                        <FeedItem username="ecenur" action="created a learning space about how to present."/>
                        <FeedItem username="enes" action="followed koray."/>
                        <FeedItem username="ezgi" action="joined a learning space about mobile development."/>
                        <FeedItem username="hasancan" action="followed batuhan."/>
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
                        <button className='ls-box-button'>
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
                        <button className='ls-box-button'>
                            view all
                        </button>
                    </div>
                    <div className='space-12'></div>
                    <div>
                        <ul role="list" className="ls-prev-list-4">
                            <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_19} />
                            <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_18} />
                            <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_17} />
                            <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_16} />
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <Footer />
    </div>
    )       
}

export default HomePage;
