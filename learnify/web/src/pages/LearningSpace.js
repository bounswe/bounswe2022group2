import React from 'react';
import './style.css'
import {NavLink, useNavigate} from 'react-router-dom';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import elipse from '../images/learning-space-illustration.svg'
import FeedItem from '../components/FeedItem';

function LearningSpace() {

  return(
    <div className='learning-space-layout'>
        <NavBar />
        <div className='learning-space'>

            <div className='learning-space-left'>
                <div className='ls-box-title'>
                    <div className='space-5'></div>
                    <label>
                        Learning Space Title
                    </label>
                </div>
                <div className='ls-box-text'>
                    <div className='space-3'></div>
                    <label>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    </label>
                    <div className='space-12'></div>
                    <button className="btn-orange" data-testid="forgotPassword">JOIN</button>
                    <div className='space-8'></div>
                    <a><img src={elipse} alt="elipse" height={360} /></a>
                </div>
                
            </div>

            <div className='learning-space-middle'>
                <div className='ls-box-title'>
                    <div className='space-5'></div>
                    <label>
                        Content
                    </label>
                    <div className='space-8'></div>
                </div>
                    <div className='ls-buttons'>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Posts</button>
                        </div>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Discussion</button>
                        </div>
                        <div className='ls-button-container'>
                            <button className="btn-orange" data-testid="forgotPassword">Notes</button>
                        </div>
                        <div className='ls-button-container-alt'>
                            <button className="btn-lightBlue" data-testid="forgotPassword">Add Post</button>
                        </div>
                       
                     </div>
                     <div className='space-8'></div>
                <div className='ls-mid-entries'>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Nascetur ridiculus mus mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>scetur ridiculus mus mauris vitae ultricies leo integ</div>
                            <div>iaculis at erat pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non diam.</div>
                            <div>mauris vitae ultricies leo integer. Cursus mattis molestie a iaculis at erat pe</div>
                            <div>pellentesque adipiscing commodo. Justo eget magna fermentum iaculis eu non</div>
                    </div>
                    <div className='ls-box-mid'>
                        <label className='feed-title'>
                            Entry Title
                        </label>
                        <div className='space-5'></div>
                             <div>Ac ut consequat semper viverra</div>
                            <div>nam libero justo.</div>
                            <div>Eget sit amet tellus cras adipiscing</div>
                            <div>Pellentesque nec nam</div>
                            <div>lorem mollis</div>
                    </div>
                </div>
            </div>

            <div className='learning-space-right'>
                <div className='space-5'></div>
                <div className='ls-box'>
                    <label className='feed-title'>
                        Contributing Users
                    </label>
                    <div className='space-5'></div>
                        <div>UserB</div>
                        <div>Enes</div>
                        <div>Koray</div>
                        <div>Altay</div>
                        <div>StudentA</div>
                        <div>Gokay</div>
                </div>
                <div className='ls-box-org'>
                    <label className='feed-title'>
                        Events
                    </label>
                    <div className='space-5'></div>
                        <div>event-1</div>
                        <div>event-2</div>
                        <div>event-3</div>
                        <div>event-4</div>
                        <div>event-5</div>
                </div>
            </div>


        </div>
        <Footer />
    </div>
    )       
}

export default LearningSpace;
