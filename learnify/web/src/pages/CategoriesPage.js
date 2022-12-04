import React from 'react';
import './style.css';
import Footer from '../components/Footer';
import NavBar from '../components/NavBar';
import Categories from '../components/Categories';
import illustration from '../images/categories-page-illustration.svg'

function CategoriesPage() {

    return(
        <div>
            <NavBar/>
            <div className='categories-page-content'>
                <div className='categories-banner'>
                    <div>
                        <div className='categories-heading'>Looking for some categories?</div>
                        <div className='categories-phrase'>
                            In Learnify we have tons of various learning spaces for every curiosity you have. Browse the selection of our categories below.
                        </div>
                    </div>
                    <div>
                    <img src={illustration} alt="Learnify Logo" height={400} />
                    </div>
                </div>
                <Categories/>
            </div>
            <Footer/>
        </div>
    )
}

export default CategoriesPage;