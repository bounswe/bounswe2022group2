import React from 'react';
import './style.css'
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import illustration from '../images/categories-page-illustration.svg'
import pp from '../images/elipse.png'
import happy from '../images/happy.png'

import ProfilePhoto from '../components/ProfilePhoto';
// <img src={pp} alt="Profile photo" height={333} />




function ProfilePage() {
    return(
    <div className='profilepageLayout'>
        <NavBar />
        <div className='profilepage'>
            <div className='profile-page-left'>
            
                <div className='ls-box3'>
                    <label className='feed-title'>
                        <label className='navBarText2'> Friends</label>
                    </label>
                    <div className='space-3'/>
                    FancyFriend
                    <div className='space-3'/>
                    YourFriend
                    <div className='space-3'/>
                    myfriend
                    <div className='space-3'/>
                    FriendHandsome
                    <div className='space-3'/>
                    myfriendE
                </div>

                <div className='profilepage-friends-box'>
                    <label className='feed-title'>
                        <label className='navBarText2'> Interest Areas</label>
                    </label>
                    <div className='space-3'/>
                    Knitting
                    <div className='space-3'/>
                    Cooking
                    <div className='space-3'/>
                    Coding
                    <div className='space-3'/>
                    Reading
                    <div className='space-3'/>
                    Writing
                </div>

                <img src={illustration} alt="Categories Page Illustration" height={170} />
            </div>

            <div className='profile-page-middle'>

                <ProfilePhoto />

                <div className='space-30'/>
                <div className='profile-page-ls-box'>
                    This is the first LS
                    <div className='space-3'/>
                    This is the second LS
                    <div className='space-3'/>
                    This is the third LS
                    <div className='space-3'/>
                    This is the fourth LS
                
                </div>
            </div>

            <div className='profile-page-right'>
                <div className='profile-page-image'>
                    <img src={happy} alt="Profile photo" height={250}/>
                </div>
               
                <label className='profile-page-text'> Meet with new people and learn together, that is what matters... LEARNIFY</label>
                <div className='profilepage-friends-box'>
                <label className='navBarText2'> About this user</label>
                     <div className='space-3'/>
                     <label>
                    This is a text instance about the user, the general information they want to give about themcelf and their interests etc.
                    </label>
                </div>
            </div>
              
    
            
        </div>
        <Footer />
    </div>

            
        )       
    }
    
    export default ProfilePage;

