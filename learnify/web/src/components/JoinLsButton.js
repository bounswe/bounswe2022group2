import * as React from 'react';
import { useEffect } from 'react';
import './component_styles.css';

export default function JoinLsButton(props) {
    const [isClicked, setIsClicked] = React.useState(false);
    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');
    const isJoined = true ? props.participants.some((participant) => participant === username) : false;


    const joinLs = async () => {
        setIsClicked(true);
        const response = await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace/enroll`, {
            method: 'POST',
            body: JSON.stringify({
                title: props.title,
            }),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${token}`
            }
        });
        window.location.reload();
        /*
        const data = await response.json();
        if (data.success) {
            setIsJoined(true);
        }*/
    }



    return (
        <div>
            {isJoined ? <button className="btn-white2" disabled>Joined</button> : <button className="btn-orange" onClick={joinLs}>Join</button>}
            
        </div>
    );
}

// <button className={isClicked ? "btn-white2" :"btn-orange"} onClick={joinLs} >{isClicked ? 'Joined': 'Join'}</button>