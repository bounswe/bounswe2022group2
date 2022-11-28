import React, { useState, useEffect } from 'react';
import './component_styles.css';
import axios from 'axios'
import CategoryButton from './CategoryButton';

const Categories = () => {

    const [categories, setCategories] = useState([])

    useEffect(() => {
        const getCategory = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}categories`)
            setCategories(res.data)
            console.log(categories)
        }
        getCategory()
    }, [])
    return (
        <>
            <div className="category-wrapper">
                {categories.map(category =>
                    <CategoryButton key={Math.random()} name={category} url={category.replace(/\s+/g, '')}/>
                )}
            </div>
        </>
    )
}

export default Categories