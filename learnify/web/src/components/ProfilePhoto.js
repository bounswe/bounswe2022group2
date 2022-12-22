import React, { useState } from 'react';
import './component_styles.css';

function ProfilePhoto() {
  const [photo, setPhoto] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleFileChange = (event) => {
    setLoading(true);
    setPhoto(event.target.files[0]);
  };

  return (
    <div className="profile-photo">
      {photo ? (
        <img src={URL.createObjectURL(photo)} alt="Profile" />
      ) : (
        <div>
          {loading ? (
            <div className="default-photo">
              <i className="fas fa-spinner fa-spin" />
            </div>
          ) : (
            <div className="default-photo">
              <i className="fas fa-user-circle" />
            </div>
          )}
          <label htmlFor="photo-input">
            <span>Upload a profile photo</span>
          </label>
          <input
            type="file"
            id="photo-input"
            accept="image/*"
            onChange={handleFileChange}
          />
        </div>
      )}
    </div>
  );
}

export default ProfilePhoto;