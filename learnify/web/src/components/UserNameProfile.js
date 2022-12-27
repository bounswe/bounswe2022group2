import * as React from 'react';
import './component_styles.css';
import creator from '../images/creator.png';

export default function Participants(props) {

    return(
        <div>
            <label className='user-name-text'> {props.user} </label>
        </div>
    )
}