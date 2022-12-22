import React, { useState } from 'react';

function ProfilePhoto() {
  const [photo, setPhoto] = useState(null);

  const handleFileChange = (event) => {
    setPhoto(event.target.files[0]);
  };

  return (
    <div>
      {photo ? (
        <img src={URL.createObjectURL(photo)} alt="Profile" />
      ) : (
        <div>
          <label htmlFor="photo-input">
            <i className="fas fa-user-circle"></i>
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