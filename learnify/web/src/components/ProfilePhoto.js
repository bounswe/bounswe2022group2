import React, { useState } from 'react';

function ProfilePhoto(props) {
  const [photo, setPhoto] = useState(props.profilePicture);
  
  const [loading, setLoading] = useState(false);

  const handleFileChange = async (event) => {
    setLoading(true);
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onloadend = async () => {
      setPhoto(reader.result);
      setLoading(false);
      // Send the file as a base64 string to the server to save the photo in the database
      try {
        const response = await fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}user/`, {
          method: 'PUT',
          body: JSON.stringify({ profile_picture: reader.result.split(',')[1] }),
          headers: { 'Content-Type': 'application/json',
          'Authorization': `${localStorage.getItem('token')} `},
        });
        window.location.reload();
        if (!response.ok) {
          throw new Error('Failed to update profile photo');
        }
      } catch (error) {
        console.error(error);
      }
      console.log("step 2")
    };
    reader.readAsDataURL(file);
  };

  return (
    <div className="profile-frame">
      <div className="profile-photo">
        {props.profilePicture ? (
          <div>
            <img src={`data:image/jpeg;base64,${props.profilePicture}`} alt="Profile" />
            <label htmlFor="photo-input">
              <span>Change profile photo</span>
            </label>
            
            <input
              type="file"
              id="photo-input"
              accept="image/*"
              onChange={handleFileChange}
            />
          </div>
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
