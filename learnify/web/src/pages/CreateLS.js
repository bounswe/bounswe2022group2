import React, { useCallback, useEffect, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'
import './style.css'
import Dropdown from '../components/Dropdown';
import NavBar from '../components/NavBar';
import Footer from '../components/Footer';
import SelectIconGrid from '../components/SelectIconGrid';
import axios from 'axios'
import {useNavigate} from 'react-router-dom';

function CreateLS() {
    const navigate = useNavigate();

    const [name, setName] = useState("");
    const [description, setDescription] = useState("");
    const [icon, setIcon] = useState(null);
    const [category, setCategory] = useState("");

    const [categories, setCategories] = useState([]);
    const [message, setMessage] = useState("");

    const token = localStorage.getItem("token");


    useEffect(() => {
        const getCategory = async () => {
            const res = await axios.get(`${process.env.REACT_APP_BACKEND_BASE_URL}categories`)
            setCategories(res.data.Categories)
        }
        getCategory()   
    }, [])

    const handleCategoryChange = useCallback((value) => {
        setCategory(value);
    }, []);

    const handleIconChange = useCallback((value) => {
        setIcon(value);
    }, []);
    

    const createLS = async (name, description, category, icon) => {
        console.log(name)
        console.log(description)
        console.log(category)
        console.log(icon)
        await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}/learningspace`, {
            method: "POST",
            body: JSON.stringify({
                title: name,
                description: description,
                categories: [category],
                icon_id: icon,
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
                'Authorization': `${token}` , 
            },
        })
            .then((response) => {
                if (response.status === 200) {
                    console.log("successfull")
                    
                    response.json().then( json => {
                        console.log(json.learningSpace.id)
                        navigate(`/${json.learningSpace.id}`);
                    });
                    console.log("Learning Space created successfully!");
                } else {
                    setMessage("This Learning Space already exists!");
                }
            }
            )
            .catch((error) => {
                console.log(error);
            }
            );

    };

    const onSubmit = (event) => {
        event.preventDefault();
        createLS(name, description, category, icon);
    }

    return(
        <div>
             <NavBar />
            <div className='home'>
                    <label className='ls-box-lb-option-large'> Create Learning Space </label>
                    <div className='space-20' />
                <div className='home-container'>
                    <div className='ls-box-create'>
                    <label className='ls-box-lb-option'> Learning Space Name </label>
                    <div className='space-5' />
                    <label>
                    <span className='details-box' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setName(e.target.textContent)}></span>
                    </label>
                    </div>
                    <div className='ls-box-create'>
                    <label className='ls-box-lb-option'> Learning Space Description </label>
                    <div className='space-5' />
                    <label>
                    <span className='details-box' role='textbox' value='nameMessage' contentEditable='true' onInput={(e) => setDescription(e.target.textContent)}></span>
                    </label>
                    </div>
                    <div className='ls-box-create'>
                    <label className='ls-box-lb-option'> Select Category</label>
                    <div className='space-5' />
                    <Dropdown options={categories} onSelect={handleCategoryChange} />
                    </div>
                </div>
            
                <div className='space-20' />
                <label className='ls-box-lb-option'> Select an Icon</label>
                <SelectIconGrid onSelect={handleIconChange} />
                <div className='space-20' />
                <label>
                    <input 
                        type='submit' 
                        className='ls-create-btn' 
                        value='Create Learning Space'
                        onClick={onSubmit}                 
                     />
                </label>

                <div className='space-20' />
                <label><div className="login-button-error">{message ? <p>{message}</p> : null}</div> </label>
                <div className='space-20' />
            </div>
            <Footer />
        </div>
    )       
}

export default CreateLS;
//<input type='text' className='details-box' placeholder='Learning Space Description' />