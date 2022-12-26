import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'
import './component_styles.css'
import {DatePicker} from '@mui/x-date-pickers/DatePicker';
import { TimePicker } from '@mui/x-date-pickers/TimePicker';
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import TextField from '@mui/material/TextField';
// import MapPicker from 'react-google-map-picker'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'	
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro'
import MapContainer from './MapPicker'

// const DefaultZoom = 10;

const EventForm = (lsid) => {

    const token = localStorage.getItem('token');

    const [open, setOpen] = useState(false);

    const [eventTitle, setEventTitle] = useState('');
    const [eventTitleError, setEventTitleError] = useState(false);

    const [eventDescription, setEventDescription] = useState('');
    const [eventDescriptionError, setEventDescriptionError] = useState(false);

    const [dateValue, setDateValue] = useState(null);

    const [timeValue, setTimeValue] = useState(null);

    const [eventDuration, setEventDuration] = useState('');
    const [durationError, setDurationError] = useState(false);
    
    const [plimitValue, setPlimitValue] = useState('');
    const [plimitError, setPlimitError] = useState(false);

    const [selectedLocation, setSelectedLocation] = useState({ lat: 41, lng: 29 });

    const handleSelectedLocationChange = (location) => {
        setSelectedLocation(location);
        setGeolocation({accuracy: 1, longitude: location.lng, latitude: location.lat});
    }

    // console.log(selectedLocation);
    
    // const [defaultLocation, setDefaultLocation] = useState({ lat: 41, lng: 29 });
    // const [location, setLocation] = useState(defaultLocation);
    const [geolocation, setGeolocation] = useState({accuracy: 1, longitude: 29, latitude: 41});
    // const [zoom, setZoom] = useState(DefaultZoom);
    // const apiKey = process.env.REACT_APP_MAP_API_KEY;

    const toggle = () => {
        setOpen(!open);
      };

    // const handleChangeLocation = (lat, lng) => {
    //     setLocation({lat:lat, lng:lng});
    //     setGeolocation({accuracy: 1, longitude: lng, latitude: lat});
    // }

    // const handleZoomChange = (zoom) => {
    //     setZoom(zoom);
    // }

    const handleEventTitleChange = (event) => {
        setEventTitle(event.target.value);
        if (event.target.value.length < 3) {
            setEventTitleError(true);
        } else {
            setEventTitleError(false);
        }
    };

    const handleEventDescriptionChange = (event) => {
        setEventDescription(event.target.value);
        if (event.target.value.length < 3) {
            setEventDescriptionError(true);
        } else {
            setEventDescriptionError(false);
        }
    };

    const handleDurationChange = (event) => {
        setEventDuration(event.target.value);
        if (event.target.value === '0' || event.target.value < 0) {
            setDurationError(true);
        } else {
            setDurationError(false);
        }
    };

    const handlePlimitValueChange = (event) => {
        setPlimitValue(event.target.value);
        if (event.target.value === '0' || event.target.value < 0) {
            setPlimitError(true);
        } else {
            setPlimitError(false);
        }
    };

    // if (timeValue && dateValue) {
    //     console.log(`${dateValue.format('DD-MM-YYYY')} ${timeValue.format('HH:mm')}`)
    // }

    // console.log(geolocation)

    const handleCreateEvent = () => {
        if (eventTitle.length < 3) {
            setEventTitleError(true);
        } else {
            setEventTitleError(false);
        }
        if (eventDescription.length < 3) {
            setEventDescriptionError(true);
        } else {
            setEventDescriptionError(false);
        }
        if (eventDuration === '0' || eventDuration < 0) {
            setDurationError(true);
        } else {
            setDurationError(false);
        }
        if (plimitValue === '0' || plimitValue < 0) {
            setPlimitError(true);
        } else {
            setPlimitError(false);
        }
        if (eventTitle.length >= 3 && eventDescription.length >= 3 && eventDuration > 0 && plimitValue > 0) {
            const event = {
                lsId: lsid.lsid,
                title: eventTitle,
                description: eventDescription,
                geolocation: geolocation,
                date: `${dateValue.format('MM-DD-YYYY')} ${timeValue.format('HH:mm')}`,
                duration: eventDuration,
                participationLimit: plimitValue,
            }
            fetch(`${process.env.REACT_APP_BACKEND_BASE_URL}events`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': `${token}`
                },
                body: JSON.stringify(event)
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                window.location.reload();
            })
            .catch(error => {
                console.log(error);
            })
        }
    }


    return (
        <div className="eventform-container">
            <div className="eventform-header" onClick={toggle}>
                <div className='eventform-icon'> <FontAwesomeIcon icon={solid('calendar-plus') } /> </div>
                Create Event
            </div>
            {open && <form className="eventform">
                <div className="eventform-body">
                    <div className="eventform-body-row">
                        <TextField
                            required
                            label="Event Title"
                            type="text"
                            value={eventTitle}
                            error={eventTitleError}
                            helperText={eventTitleError ? 'Event title must be at least 3 characters long' : ''}
                            onChange={handleEventTitleChange}
                        />
                    </div>
                    <div className="eventform-body-row">
                        <TextField
                            required
                            label="Event Description"
                            type="text"
                            multiline
                            maxRows={6}
                            value={eventDescription}
                            error={eventDescriptionError}
                            helperText={eventDescriptionError ? 'Event description must be at least 3 characters long' : ''}
                            onChange={handleEventDescriptionChange}
                        />
                    </div>
                    <div className="eventform-body-row">
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                            <DatePicker
                                required
                                label="Event Date"
                                disablePast
                                value={dateValue}
                                onChange={(newDateValue) => {
                                    setDateValue(newDateValue);
                                }}
                                views={['year', 'month', 'day']}
                                inputFormat="MM-DD-YYYY"
                                format="MM-DD-YYYY"
                                renderInput={(params) => <TextField {...params} />}
                            />
                        </LocalizationProvider>
                    </div>
                    <div className="eventform-body-row">
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                            <TimePicker
                                required
                                label="Event Time"
                                value={timeValue}
                                ampm={false}
                                disablePast
                                onChange={(newTimeValue) => {
                                    setTimeValue(newTimeValue);
                                }}
                                renderInput={(params) => <TextField {...params} />}
                            />
                        </LocalizationProvider>
                    </div>
                    <div className="eventform-body-row">
                        <TextField
                            required
                            label="Event Duration in Minutes"
                            type="number"
                            value={eventDuration}
                            onChange={handleDurationChange}
                            error={durationError}
                            helperText={durationError ? (eventDuration < 0 ? 'Duration cannot be negative.' : 'Duration cannot be 0.') : ''}
                            InputLabelProps={{
                                shrink: true,
                            }}
                        />
                    </div>
                    <div className="eventform-body-row">
                        <TextField
                            required
                            label="Participation Limit"
                            type="number"
                            value={plimitValue}
                            onChange={handlePlimitValueChange}
                            error={plimitError}
                            helperText={plimitError ? (plimitValue < 0 ? 'Participation limit cannot be negative.' : 'Participation limit cannot be 0.') : ''}
                            InputLabelProps={{
                                shrink: true,
                            }}
                        />
                    </div>
                    <div className="eventform-body-row">
                        <MapContainer onSelectedLocationChange={handleSelectedLocationChange} />
                        {/* <div className="eventform-map">
                            <MapContainer onSelectedLocationChange={handleSelectedLocationChange} />
                        </div> */}
                    </div>
                    <button className='eventform-button' onClick={handleCreateEvent}  type="submit">
                        Create Event
                    </button>
                </div>
            </form>}
        </div>
    )

};

export default EventForm;
