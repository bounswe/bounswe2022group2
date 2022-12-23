import React, { useCallback, useEffect, useState } from 'react';
import './style.css'
import NavBar from '../components/NavBar';
import Footer from '../components/Footer';
import people from '../images/leutee.png';

function ContactPage() {
    const [name, setName] = useState("");
    const [description, setDescription] = useState("");
    const onSubmit = (event) => {
        event.preventDefault();
        console.log(name)
        console.log(description)
    }
    return (
        <div>
            <NavBar/>
            <div className='contact-page'>
                <div className='contact-page-left'>
                    <div className='space-20' />
                    <div className='space-10' />
                    <div className='contact-title2'>
                        About this page and issue forms:
                    </div>
                    <div className='space-10' />
                    <div className='box-contact'>
                        <div className='contact-text2'>
                            This page is for reporting any issues you may have with either the website, or the Learning Spaces themselves. 
                        </div>
                        <div className='contact-text2'>
                            You can report about:
                        </div>
                        <div className='space-3' />
                        <div className='contact-text2'>
                            - Learning spaces: Participants may have issues with the learning spaces themselves, such as technical issues with the platform or difficulty accessing certain resources. Creating an issue can help bring these problems to the attention of the team responsible for managing the learning space, so that they can be addressed and resolved.
                        </div>
                        <div className='space-3' />
                        <div className='contact-text2'>
                            - Comments or posts: Participants may have concerns about comments or posts made by other users in the learning space. These could be inappropriate or offensive comments, or posts that are not relevant to the topic being discussed.
                        </div>
                        <div className='space-3' />
                        <div className='contact-text2'>
                            - UI: Participants may have suggestions or issues with the user interface (UI) of the learning space. They may find certain features confusing or hard to use, or have suggestions for improvements that could make the learning space more user-friendly.                         </div>
                    </div>
                </div>
                <div className='contact-page-middle'>
                    <div className='space-20' />
                    <div className='space-10' />
                    <div className='contact-title'>
                        Tell Us About Any Issues
                    </div>
                    <div className='space-20' />
                    <label className='ls-box-lb-option'> Subject of your issue: </label>
                    <div className='space-12' />
                    <label>
                        <span className='contact-box' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setName(e.target.textContent)}></span>
                    </label>
                    <div className='space-40' />
                    <label className='ls-box-lb-option'> Can you please specify the problem? </label>
                    <div className='space-12' />
                    <label>
                        <span className='contact-box2' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setDescription(e.target.textContent)}></span>
                    </label>
                    <div className='space-5' />
                    <label>
                        <input 
                            type='submit' 
                            className='ls-create-btn' 
                            value='Submit Issue'
                            onClick={onSubmit}                 
                        />
                    </label>
                </div>
                <div className='contact-page-right'>
                    <div className='space-100' />
                    <div className='left-aligned-img'>
                        <img src={people} alt="Contact Page Illustration" height={250} />
                    </div>
                    <div className='contact-text2'>
                      "It is important for our co-learners to have a good and respectful experience in order to feel valued, motivated, and supported in their learning journey."
                    </div>
                    <div className='space-8' />
                    <div className='contact-text3'>
                        - Team Learnify.
                    </div>
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default ContactPage;