import React, { useState } from 'react';


const ProfilePhoto = () => {
  const [photo, setPhoto] = useState(null);

  const handlePhoto = (event) => {
    const photo = event.target.files[0];
    setPhoto(photo);
  };

  return (
    <div>
      <input type="file" onChange={handlePhoto} />
      <img src={photo} alt="Profile photo" height={333} />
    </div>
    );
}

export default ProfilePhoto
