import * as React from 'react';
import './component_styles.css';
import lslogo_1 from '../images/ls_icons/ls-icon-1.svg';
import lslogo_2 from '../images/ls_icons/ls-icon-2.svg';
import lslogo_3 from '../images/ls_icons/ls-icon-3.svg';
import lslogo_4 from '../images/ls_icons/ls-icon-4.svg';
import lslogo_5 from '../images/ls_icons/ls-icon-5.svg';
import lslogo_6 from '../images/ls_icons/ls-icon-6.svg';
import lslogo_7 from '../images/ls_icons/ls-icon-7.svg';
import lslogo_8 from '../images/ls_icons/ls-icon-8.svg';
import lslogo_9 from '../images/ls_icons/ls-icon-9.svg';
import lslogo_10 from '../images/ls_icons/ls-icon-10.svg';
import lslogo_11 from '../images/ls_icons/ls-icon-11.svg';
import lslogo_12 from '../images/ls_icons/ls-icon-12.svg';
import lslogo_13 from '../images/ls_icons/ls-icon-13.svg';
import lslogo_14 from '../images/ls_icons/ls-icon-14.svg';
import lslogo_15 from '../images/ls_icons/ls-icon-15.svg';
import lslogo_16 from '../images/ls_icons/ls-icon-16.svg';
import lslogo_17 from '../images/ls_icons/ls-icon-17.svg';
import lslogo_18 from '../images/ls_icons/ls-icon-18.svg';
import lslogo_19 from '../images/ls_icons/ls-icon-19.svg';
import lslogo_20 from '../images/ls_icons/ls-icon-20.svg';


export default function SelectIconGrid(props) {
    const [selectedIcon, setSelectedIcon] = React.useState(null);
    const [selectedIconName, setSelectedIconName] = React.useState(null);
    const [selectedIconPath, setSelectedIconPath] = React.useState(null);
    const [selectedIconId, setSelectedIconId] = React.useState(null);

    const handleIconClick = (e) => {
        setSelectedIcon(e.target.src);
        setSelectedIconName(e.target.name);
        setSelectedIconPath(e.target.src);
        setSelectedIconId(e.target.id);
        
    }

    const handleIconSubmit = () => {
        props.handleIconSubmit(selectedIcon, selectedIconName, selectedIconPath, selectedIconId);
    }

    return (
        <div className='select-icon-grid'>
            <div className='select-icon-grid-row'>
                <img src={lslogo_1}
                    name='lslogo_1'
                    id='1'
                    className= {selectedIcon === lslogo_1 ? 'select-icon-grid-img-selected' : 'select-icon-grid-img'}
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_2}
                    name='lslogo_2'
                    id='2'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_3}
                    name='lslogo_3'
                    id='3'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_4}
                    name='lslogo_4'
                    id='4'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_5}
                    name='lslogo_5'
                    id='5'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
            </div>
            <div className='select-icon-grid-row'>
                <img src={lslogo_6}
                    name='lslogo_6'
                    id='6'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_7}
                    name='lslogo_7'
                    id='7'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_8}
                    name='lslogo_8'
                    id='8'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_9}
                    name='lslogo_9'
                    id='9'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_10}
                    name='lslogo_10'
                    id='10'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
            </div>
            <div className='select-icon-grid-row'>
                <img src={lslogo_11}
                    name='lslogo_11'
                    id='11'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_12}
                    name='lslogo_12'
                    id='12'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_13}
                    name='lslogo_13'
                    id='13'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_14}
                    name='lslogo_14'
                    id='14'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_15}
                    name='lslogo_15'
                    id='15'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
            </div>
            <div className='select-icon-grid-row'>
            <img src={lslogo_16}
                    name='lslogo_16'
                    id='16'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_17}
                    name='lslogo_17'
                    id='17'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_18}
                    name='lslogo_18'
                    id='18'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_19}
                    name='lslogo_19'
                    id='19'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
                <img src={lslogo_20}
                    name='lslogo_20'
                    id='20'
                    className='select-icon-grid-img'
                    height={200}
                    onClick={handleIconClick}
                />
            </div>
        </div>
    )
}
