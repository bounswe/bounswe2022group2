import * as React from 'react';
import './component_styles.css';

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