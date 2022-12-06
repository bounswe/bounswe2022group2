import * as React from 'react';
import './component_styles.css';
import creator from '../images/creator.png';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used

export default function Participants(props) {

    return(
        <div>
            {props.creator === props.participant ? (
                <label className='navBarText'><FontAwesomeIcon icon={solid('user-astronaut')} /> {props.participant} </label>
            
            ) : (
                <label className='navBarText'><FontAwesomeIcon icon={solid('user-graduate')} /> {props.participant} </label>
            )}
        </div>
    )
}