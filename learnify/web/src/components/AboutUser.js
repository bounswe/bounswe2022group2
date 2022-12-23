import React, { useState } from 'react';
import './component_styles.css';

function AboutUser() {
    const [aboutText, setAboutText] = useState(
    "This is a text instance about the user, the general information they want to give about themselves and their interests etc."
    );
    const [isEditing, setIsEditing] = useState(false);

    function handleEditButtonClick() {
    setIsEditing(true);
    }

    function handleSaveButtonClick() {
    setIsEditing(false);
    }

    function EditButton({ onClick }) {
        return (
        <button className="edit-button" onClick={onClick}>
        Edit
        </button>
        );
        }

    return (
    <div className="about-user-container">
        {isEditing ? (
            <>
        <textarea
        className="about-text-input"
        value={aboutText}
        onChange={(event) => setAboutText(event.target.value)}
    />
    <button className="save-button" onClick={handleSaveButtonClick}>
        Save
    </button>
    </>
    ) : (
    <>
    <label className="navBarText2">About this user</label>
    <div className="space-3" />
    <label className="about-text">{aboutText}</label>
    <EditButton onClick={handleEditButtonClick} />
    </>
    )}
    </div>
    );
}

export default AboutUser;




