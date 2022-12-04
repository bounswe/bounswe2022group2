import React, { useState } from 'react';
import up from '../images/chevron-up-solid.svg';
import down from '../images/chevron-down-solid.svg';
import comment from '../images/comment-regular.svg';
import edit from '../images/pen-to-square-regular.svg';
import trash from '../images/trash-can-regular.svg';
import author from '../images/create2.svg';
import MDEditor from "@uiw/react-md-editor";

export default function Post(props){

    const title = props.myPost.title;
    const creator = props.myPost.creator;
    const content = props.myPost.content;
    const images = props.myPost.images;

    const [upCounter, setUpCounter] = useState(0);
    const [downCounter, setDownCounter] = useState(0);
    const [deletePost, setDeletePost] = useState(false);

    const increaseUp = () => {
        setUpCounter(count => count + 1);
    };
    const increaseDown = () => {
        setDownCounter(count => count + 1);
    };
    const deleteThePost = () => {
        setDeletePost(current => !current);
    };

    return(
    <div>
        {!deletePost &&
        <div className='ls-box-mid'>
            <label className='feed-title'>
                {title}
            </label>
            <div className='space-5'></div>
                <img
                    src={images}
                    alt="space"
                    style = {{width: "893.5px",
                    height: "600px"}}
                />
            <div className='space-5'></div>
                <MDEditor.Markdown
                    style={{ padding: 15 }}
                    source={content}
                    linkTarget="_blank"
                />
            <div className='space-5'></div>
            <div className='ls-buttons'>
                <div className='ls-button-container2'>
                    <button className='ls-button'><img src={up} alt="Learnify Logo" height={20} onClick={increaseUp}/></button>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{upCounter}</label>
                </div>
                <div className='ls-button-container2'>
                <button className='ls-button'><img src={down} alt="Learnify Logo" height={20} onClick={increaseDown}/></button>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{downCounter}</label>
                </div>
                <div className='ls-button-container2'>
                    <a href="/reply" className='navBarText'><img src={comment} alt="Learnify Logo" height={20} /></a>
                </div>
                <div className='ls-button-container'>
                    <label className="counter__output">{0}</label>
                </div>
                <div className='ls-button-container'>
                    <button className="btn-orange" data-testid="forgotPassword">Annotations</button>
                </div>
                <div className='ls-button-container-alt3'>
                    <a href="/author" className='navBarText'><img src={author} alt="Learnify Logo" height={25} /></a>
                </div>
                    {creator}
                <div className='ls-button-container-alt2'>
                    <a href="/edit" className='navBarText'><img src={edit} alt="Learnify Logo" height={20} /></a>
                </div>
                <div className='ls-button-container-alt2'>
                    <button className='ls-button'> <img src={trash} alt="Learnify Logo" height={20} onClick={deleteThePost}/> </button>
                </div>
                </div>
                
        </div>
        }
        </div>
    );
}
