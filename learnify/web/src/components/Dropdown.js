import * as React from 'react';
import './component_styles.css';

export default function Dropdown(props) {
    const [isActivated, setIsActivated] = React.useState(false);
    const options = props.options;
    const [selected, setSelected] = React.useState(null);


    return (
        <div className='dropdown'>
            <div>
            <button 
            className='dropdown-btn'
             onClick={(e) => setIsActivated(!isActivated)}>
                {selected ? selected : 'Select Category'}
            </button>
            </div>
            {isActivated && (
                <div className='dropdown-content'>
                    {options.map((option) => (
                        <div 
                            className='dropdown-item'
                            onClick={(e) => {
                                setSelected(option);
                                setIsActivated(false);
                                props.onSelect(option);
                            }}
                        >
                            {option}
                </div>
                    ))}
                </div>
            )}
            
        </div>
    );
  }