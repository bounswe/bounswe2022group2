import React, { useState } from 'react';
import './component_styles.css';

function AboutUser(props) {
    const [aboutText, setAboutText] = useState(props.bio);

      console.log(aboutText)
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
      <div className="about-user-frame">
        {isEditing ? (
          <>
            <textarea
              className="about-text-input"
              value={aboutText}
              onChange={(event) => setAboutText(event.target.value)}
            />
            <div className="space-3" />
            <button className="save-button" onClick={handleSaveButtonClick}>
              Save
            </button>
          </>
        ) : (
          <>
            <label className="navBarText2">Bio</label>
            <div className="space-3" />
            <label className="about-text">{aboutText}</label>
            <div className="space-3" />
            <EditButton onClick={handleEditButtonClick} />
          </>
        )}
      </div>
    </div>
  );
}

export default AboutUser;
