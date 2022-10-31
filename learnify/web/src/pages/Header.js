import React from 'react';
import { Link } from "react-router-dom";
import './style.css'
function Header() {
    return(
        <nav class="navbar navbar-dark bg-primary">
            <div className="row col-12 d-flex justify-content-center text-white">
                <div className='header'>
                <Link to="/" className="navigate">Sign Up</Link>


                <Link to="/login" className="navigate">Sign In</Link> 

                </div> 
            </div>
        </nav>
    )
}
export default Header;