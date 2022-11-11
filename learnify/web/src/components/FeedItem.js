import * as React from 'react';
import './component_styles.css';

export default function FeedItem(props) {
    return (
        <div>
            <li> <span className='feed-item-username'>{props.username} <span className='feed-item-action'>{props.action}</span> </span> </li>
        </div>
    );
}