import React, { useState } from 'react';

function ProfilePhoto(props) {
  const [photo, setPhoto] = useState(props.profilePicture || null);
  const [loading, setLoading] = useState(false);

  const handleFileChange = (event) => {
    setLoading(true);
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onloadend = () => {
      setPhoto(reader.result);
      setLoading(false);

      // Send the data URL to the server to save the photo in the database
      
    };
    reader.readAsDataURL(file);
  };

  return (
    <div className="profile-frame">
      <div className="profile-photo">
        {photo ? (
          <img src={photo} alt="Profile" /> 
        ) : (
          <div>
            {loading ? (
              <div className="default-photo">
                <i className="fas fa-spinner fa-spin" />
              </div>
            ) : (
              <div className="default-photo">
                <i className="fas fa-user-circle" />
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
        )}
      </div>
    </div>
  );
}

export default ProfilePhoto;
