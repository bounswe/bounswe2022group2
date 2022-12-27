import * as React from 'react';
import { Link } from 'react-router-dom';
import './component_styles.css';
import creator from '../images/creator.png';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used

export default function Participants(props) {
    const profileLink = `/profile/${props.participant}`;

    return(
        <div>
            {props.creator === props.participant ? (
                <Link to={profileLink} className='contributorsText'>
                    <FontAwesomeIcon icon={solid('user-astronaut')} /> {props.participant}
                </Link>
            
            ) : (
                <Link to={profileLink} className='contributorsText'>
                    <FontAwesomeIcon icon={solid('user-graduate')} /> {props.participant}
                </Link>
            )}
        </div>
    )
}
