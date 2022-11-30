import * as React from 'react';
import './component_styles.css';

export default function Dropdown(props) {
    const [isActivated, setIsActivated] = React.useState(false);
    const options = [    "Math and Logic",
    "Physical Sciences and Engineering",
    "Social Sciences",
    "Programming",
    "Visual Arts",
    "Music",
    "Gastronomy and Culinary",
    "Business",
    "Sports",
    "Performance Arts",
    "Information Technologies",
    "Personal Development",
    "Language Learning",
    "Home Economics",
    "Parenting",
    "Lifestyle"];
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