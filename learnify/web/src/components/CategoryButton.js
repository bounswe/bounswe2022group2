import * as React from 'react';
import './component_styles.css';

export default function CategoryButton(props) {
    return (
        <div>
            <base href="/categories/" />
            <button className='category-button'
                onClick={(e) => {
                    e.preventDefault();
                    window.location.href=props.url;
                    }}>
            {props.name}
        </button>
        </div>
    );
}