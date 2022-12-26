import logo from '../images/logo-dblue.png' 
import bell from '../images/notification-icon.svg'
import React, {useState, useEffect } from 'react'
import './component_styles.css';
import axios from 'axios'

export default function NavBar(){

    const [searchLsResults, setSearchLsResults] = useState([])

    const [searchLsInput, setSearchLsInput] = useState("");
    

    const currentUser = localStorage.getItem('username')

    const handleSearchLsChange = (e) => {
        e.preventDefault();
        setSearchLsInput(e.target.value);
    }

    useEffect(() => {
        const getSearchLsResults = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace?query=${searchLsInput}`)
            setSearchLsResults(res.data.learning_spaces)
        }
        getSearchLsResults()
    }, [searchLsInput])

    console.log(searchLsResults)

    return <nav className="nav" data-testid="navbar">
        <a href="/home"><img src={logo} alt="Learnify Logo Navbar" height={60} /></a>
        <ul>
            
                <div className="ls-search">
                    <input className='search-input-field' type="text" placeholder="Search learning spaces"  size={30} onChange={handleSearchLsChange} value={searchLsInput}/>

                    <div className="search-results-container">
                        {searchLsResults.map(result => (
                            <ul>
                                <li className='search-result-item'><a href={`/learningspace/${result.id}`}>{result.title}</a></li>
                            </ul>
                        ))}
                    </div>
                </div>
            
            <li>
                <a href="/notifications" className='navBarText'><img src={bell} alt="Notifications Icon" height={20} /></a>
            </li>
            <li>
                <a href="/home" className='navBarText'>Home</a>
            </li>
            <li>
                <a href="/categories" className='navBarText'>Categories</a>
            </li>
            <li>
                <a href="/about" className='navBarText'>About</a>
            </li>
            <li>
                <a href="/contact" className='navBarText'>Contact</a>
            </li>
            <li>
                <a href={`/profile/${currentUser}`} className='navBarText'>Profile</a>
            </li>
        </ul>
    </nav>

}