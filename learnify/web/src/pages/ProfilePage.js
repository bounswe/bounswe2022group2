import React, { useEffect, useState } from 'react';
import './style.css'
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import illustration from '../images/categories-page-illustration.svg'
import pp from '../images/elipse.png'
import happy from '../images/happy.png'
import axios from 'axios'
import UserNameProfile from '../components/UserNameProfile';

import ProfilePhoto from '../components/ProfilePhoto';
import AboutUser from '../components/AboutUser';


function ProfilePage() {
    const username = localStorage.getItem('username')
    const [profilePicture, setProfilePicture] = useState('')
    const [bio, setBio] = useState('')
    const [learningSpaces, setLearningSpaces] = useState([])


    useEffect(() => {
        const getProfile = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}user/${username}`)
            setProfilePicture(res.data.profile_picture)
            setBio(res.data.bio)
            setLearningSpaces(res.data.participated)
            console.log(res.data)
            console.log(res.data.bio)
        }
        getProfile()
    }, [])
    
    return(
    <div className='profilepageLayout'>
        <NavBar />
        <div className='profilepage'>
            <div className='profile-page-left'>
            
            <AboutUser bio={bio} />
                

                <img src={illustration} alt="Categories Page Illustration" height={170} />
            </div>

            <div className='profile-page-middle'>

                <ProfilePhoto profilePicture={profilePicture} />
                <div>
                <UserNameProfile user = {username}/>
                </div>
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
                

            </div>
              
    
            
        </div>
        <Footer />
    </div>

            
        )       
    }
    
    export default ProfilePage;

