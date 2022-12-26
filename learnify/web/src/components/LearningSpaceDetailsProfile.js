import * as React from 'react';
import './component_styles.css';
import lslogo_1 from '../images/ls_icons/ls-icon-1.svg'
import lslogo_2 from '../images/ls_icons/ls-icon-2.svg'
import lslogo_3 from '../images/ls_icons/ls-icon-3.svg'
import lslogo_4 from '../images/ls_icons/ls-icon-4.svg'
import lslogo_5 from '../images/ls_icons/ls-icon-5.svg'
import lslogo_6 from '../images/ls_icons/ls-icon-6.svg'
import lslogo_7 from '../images/ls_icons/ls-icon-7.svg'
import lslogo_8 from '../images/ls_icons/ls-icon-8.svg'
import lslogo_9 from '../images/ls_icons/ls-icon-9.svg'
import lslogo_10 from '../images/ls_icons/ls-icon-10.svg'
import lslogo_11 from '../images/ls_icons/ls-icon-11.svg'
import lslogo_12 from '../images/ls_icons/ls-icon-12.svg'
import lslogo_13 from '../images/ls_icons/ls-icon-13.svg'
import lslogo_14 from '../images/ls_icons/ls-icon-14.svg'
import lslogo_15 from '../images/ls_icons/ls-icon-15.svg'
import lslogo_16 from '../images/ls_icons/ls-icon-16.svg'
import lslogo_17 from '../images/ls_icons/ls-icon-17.svg'
import lslogo_18 from '../images/ls_icons/ls-icon-18.svg'
import lslogo_19 from '../images/ls_icons/ls-icon-19.svg'
import lslogo_20 from '../images/ls_icons/ls-icon-20.svg'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used

function LearningSpaceDetailsProfile(props) {

    const icons = [
        lslogo_1,
        lslogo_2,
        lslogo_3,
        lslogo_4,
        lslogo_5,
        lslogo_6,
        lslogo_7,
        lslogo_8,
        lslogo_9,
        lslogo_10,
        lslogo_11,
        lslogo_12,
        lslogo_13,
        lslogo_14,
        lslogo_15,
        lslogo_16,
        lslogo_17,
        lslogo_18,
        lslogo_19,
        lslogo_20
    ]


    return (
        <div className="ls-detail-box-container-profile" data-testid="learning-space-details-profile" onClick={(e) => {
            e.preventDefault();
            window.location.href='/learningspace/'+props.url;
            }}>
            <div className="ls-detail-box-icon">
                <img src={icons[props.icon_id - 1]} className="ls-detail-box-icon" alt="ls-icon-profile" height={240}/>
            </div>
            <div className="ls-detail-box-info">
                <div className="ls-detail-box-title">{props.title}</div>
                <div className="ls-detail-box-description">{props.description}</div>
                <div className="ls-detail-box-participants-container">
                    <FontAwesomeIcon className="ls-detail-box-p-icon" icon={solid('users-rectangle')} />
                    <div className="ls-detail-box-participants">{props.num_participants}</div>
                </div>
            </div>
        </div>
    )
}

export default LearningSpaceDetailsProfile;