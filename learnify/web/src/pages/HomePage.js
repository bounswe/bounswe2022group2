import React from 'react';
import './style.css'
import LearningSpacePrev from '../components/LearningSpacePrev';
import FeedItem from '../components/FeedItem';
import CreateLearningSpaeButton from '../components/CreateLearningSpaceButton';
import Footer from '../components/Footer';
import lslogo_13 from '../images/ls_icons/ls-icon-13.svg'
import lslogo_6 from '../images/ls_icons/ls-icon-6.svg'
import lslogo_20 from '../images/ls_icons/ls-icon-20.svg'
import lslogo_19 from '../images/ls_icons/ls-icon-19.svg'
import lslogo_18 from '../images/ls_icons/ls-icon-18.svg'
import lslogo_17 from '../images/ls_icons/ls-icon-17.svg'
import lslogo_16 from '../images/ls_icons/ls-icon-16.svg'


function HomePage() {

  return(
    <div className='home'>
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
                            <ul role="list" className="ls-prev-list-3">
                                <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_13} />
                                <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_6} />
                                <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_20} />
                            </ul>
                        </div>
                    </div>
                    <CreateLearningSpaeButton />
                </div>
                <div className='space-30'></div>
            </div>
            <div className='feed-box'>
                <label className='feed-title'>
                    Feed
                </label>
                <div className='space-5'></div>
                <div className='feed-list-box'>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
                    <FeedItem username="friend" action="lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mattis enim, nec ornare enim."/>
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
                    <ul role="list" className="ls-prev-list-4">
                        <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_19} />
                        <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_18} />
                        <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_17} />
                        <LearningSpacePrev name="Lorem Ipsum Dolor Sit Amet" icon={lslogo_16} />
                    </ul>
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
        <Footer />
    </div>
    )       
}

export default HomePage;
