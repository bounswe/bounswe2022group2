import React from 'react';
import './style.css'
import {NavLink, useNavigate} from 'react-router-dom';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import elipse from '../images/elipse.png'
import FeedItem from '../components/FeedItem';

function LearningSpace() {

  return(
    <div className='learning-space-layout'>
        <NavBar />
        <div className='learning-space'>

            <div className='learning-space-left'>
                <div className='ls-box-title'>
                    <div className='space-30'></div>
                    <label>
                        Learning Space Title
                    </label>
                </div>
                <div className='ls-box-text'>
                    <div className='space-3'></div>
                    <label>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    </label>
                    <div className='space-3'></div>
                    <button className="btn-orange" data-testid="forgotPassword">JOIN</button>
                    <div className='space-3'></div>
                    <a><img src={elipse} alt="elipse" height={200} /></a>
                </div>
                
            </div>

            <div className='learning-space-middle'>
                <div className='ls-box-title'>
                    <div className='space-30'></div>
                    <label>
                        Learning Spaces
                    </label>
                </div>
                    <div className='ls-buttons'>
                        <button className="btn-orange" data-testid="forgotPassword">Category_A</button>
                        &nbsp
                        <button className="btn-orange" data-testid="forgotPassword">Category_B</button>
                        &nbsp
                        <button className="btn-orange" data-testid="forgotPassword">Category_C</button>
                        &nbsp
                        &nbsp
                        <button className="btn-lightBlue" data-testid="forgotPassword">Add Category</button>
                     </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Side-Box
                        </label>
                        <div className='space-5'></div>
                             <div>element element element element element element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Side-Box
                        </label>
                        <div className='space-5'></div>
                             <div>element element element element element element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Side-Box
                        </label>
                        <div className='space-5'></div>
                             <div>element element element element element element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                            <div>element</div>
                    </div>
            </div>

            <div className='learning-space-right'>
                <div className='space-50'></div>
                <div className='ls-box'>
                    <label className='feed-title'>
                        Side-Box
                    </label>
                    <div className='space-5'></div>
                        <div>element element element element element element</div>
                        <div>element</div>
                        <div>element</div>
                        <div>element</div>
                        <div>element</div>
                </div>
                <div className='ls-box-org'>
                    <label className='feed-title'>
                        Side-Box
                    </label>
                    <div className='space-5'></div>
                        <div>element element element element element element</div>
                        <div>element</div>
                        <div>element</div>
                        <div>element</div>
                        <div>element</div>
                </div>
            </div>


        </div>
        <Footer />
    </div>
    )       
}

export default LearningSpace;
