import logo from '../images/logo-dblue.png' 
import bell from '../images/notification-icon.svg'
import React, {useState, useEffect } from 'react'
import './component_styles.css';
import axios from 'axios'

export default function NavBar(){

    const [searchResults, setSearchResults] = useState([])

    const [searchInput, setSearchInput] = useState("");

    const handleChange = (e) => {
        e.preventDefault();
        setSearchInput(e.target.value);
    }

    useEffect(() => {
        const getSearchResults = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}learningspace?query=${searchInput}`)
            setSearchResults(res.data.learning_spaces)
        }
        getSearchResults()
    }, [searchInput])

    console.log(searchResults)

    return <nav className="nav" data-testid="navbar">
        <a href="/home"><img src={logo} alt="Learnify Logo" height={60} /></a>
        <ul>
            
                <div className="relative">
                    <input className='search-input-field' type="text" placeholder="Search learning spaces"  size={30} onChange={handleChange} value={searchInput}/>

                    <div className="search-results-container">
                        {searchResults.map(result => (
                            <ul>
                                <li className='search-result-item'><a href={`/learningspace/${result.id}`}>{result.title}</a></li>
                            </ul>
                        ))}
                    </div>
                </div>
            
            <li>
                <a href="/notifications" className='navBarText'><img src={bell} alt="Learnify Logo" height={20} /></a>
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
                <a href="/profile" className='navBarText'>Profile</a>
            </li>
        </ul>
    </nav>

}