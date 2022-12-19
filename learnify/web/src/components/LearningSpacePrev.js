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

export default function LearningSpacePrev(props) {
    return (
        <div>
            <div className='learning-space-card'>
                <div>
                    <img src={props.icon} className="learning-space-icon" alt="learning space logo" height={140} />
                </div>
                <label className='learning-space-title'>
                    {props.name}
                </label>
            </div>
        </div>
    );
  }