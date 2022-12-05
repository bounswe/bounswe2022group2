import * as React from 'react';
import './component_styles.css';
import creator from '../images/creator.png';

export default function Participants(props) {
    return(
        <div>
    <label className='navBarText'><img src={creator} alt="Learnify Logo" height={50} /> {props.participant} </label>
    </div>
    )
}