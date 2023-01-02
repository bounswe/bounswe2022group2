import React, { useState } from 'react';
import './component_styles.css';

function AboutUser(props) {
  const [aboutText, setAboutText] = useState(props.bio);
  const [isEditing, setIsEditing] = useState(false);
  const [username, setUsername] = useState(localStorage.getItem("username"));
  
  function handleEditButtonClick() {
    setIsEditing(true);
  }

  async function handleSaveButtonClick() {
    setIsEditing(false);
    try {
      const response = await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}user/`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `${localStorage.getItem("token")} `,
        },
        body: JSON.stringify({
          bio: aboutText,
        }),
      });
      if (!response.ok) {
        throw new Error("Failed to update bio");
      }
      window.location.reload();
    } catch (error) {
      console.error(error);
    }
  }

  function EditButton({ onClick }) {
    if(props.userviewed === username){
    return (
      <button className="edit-button" onClick={onClick}>
        Edit
      </button>
    );}
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
            <label className="navBarText2">Biography</label>
            <div className="space-3" />
            <label className="about-text">{props.bio}</label>
            <div className="space-3" />
            <EditButton onClick={handleEditButtonClick} />
          </>
        )}
      </div>
    </div>
  );
}

export default AboutUser;
