import React, { useState, useEffect } from 'react';

import axios from 'axios';

function MyLearningSpacesPage() {

    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');

    return (
        <div>
            <NavBar/>
            <div className="mylspage-container">
                <div className="mylspage-wrapper">
                    <div className="mylspage-title">
                        <h1>Browsing the learning spaces of:</h1>
                    </div>
                    <div className="mylspage-header">
                        <h1>{username}</h1>
                    </div>
                </div>
                <div className="mylspage-body">
                    {lsBoxes}
                </div>
            </div>
            <Footer/>
        </div>
    )

}

export default MyLearningSpacesPage;