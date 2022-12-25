import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'
import './component_styles.css'
import {DatePicker} from '@mui/x-date-pickers/DatePicker';
import { TimePicker } from '@mui/x-date-pickers/TimePicker';
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import TextField from '@mui/material/TextField';
import MapPicker from 'react-google-map-picker'

const DefaultZoom = 10;

const EventForm = () => {

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
    
    const [defaultLocation, setDefaultLocation] = useState({ lat: 41, lng: 29 });
    const [location, setLocation] = useState(defaultLocation);
    const [zoom, setZoom] = useState(DefaultZoom);
    const apiKey = process.env.REACT_APP_MAP_API_KEY;

    console.log(apiKey)

    const handleChangeLocation = (lat, lng) => {
        setLocation({lat:lat, lng:lng});
    }

    const handleZoomChange = (zoom) => {
        setZoom(zoom);
    }

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

    return (
        <div className="eventform-container">
            <form className="eventform">
                <div className="eventform-header">
                    Create Event
                </div>
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
                                inputFormat="DD-MM-YYYY"
                                renderInput={(params) => <TextField {...params} />}
                            />
                        </LocalizationProvider>
                    </div>
                    <div className="eventform-body-row">
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                            <TimePicker
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
                        <div className="eventform-map">
                            <MapPicker defaultLocation={defaultLocation}
                                zoom={zoom}
                                mapTypeId="roadmap"
                                style={{height:'300px'}}
                                onChangeLocation={handleChangeLocation} 
                                onChangeZoom={handleZoomChange}
                                apiKey={apiKey}/>
                        </div>
                    </div>         
                </div>
            </form>
        </div>
    )

};

export default EventForm;
