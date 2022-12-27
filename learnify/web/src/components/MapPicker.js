import React, { useState } from 'react';
import { Map, GoogleApiWrapper, Marker } from 'google-maps-react';
import './component_styles.css';

const MapContainer = ({ google, onSelectedLocationChange }) => {
  const [selectedLocation, setSelectedLocation] = useState(null);

  const mapStyles = {
    width: '231px',
    height: '300px',
    borderRadius: '12px',
    zIndex: '5',
    overflow: 'hidden',
    boxShadow: '0px 2px 5px 1px rgba(120,120,120,0.52)'
  };

  const onMapClick = (mapProps, map, event) => {
    const clickedLocation = {
      lat: event.latLng.lat(),
      lng: event.latLng.lng()
    };
    setSelectedLocation(clickedLocation);
    onSelectedLocationChange(clickedLocation);
  }

  return (
    <div className='eventform-map'>
            <Map
                google={google}
                zoom={10}
                className='map'
                initialCenter={{ lat: 41, lng: 29 }}
                onClick={onMapClick}
                >
                {selectedLocation && (
                    <Marker position={selectedLocation} />
                )}
            </Map>
    </div>
  );
}

export default GoogleApiWrapper({
  apiKey: process.env.REACT_APP_MAP_API_KEY
})(MapContainer);
