import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'
import './component_styles.css'
import {DatePicker} from '@mui/x-date-pickers/DatePicker';
import { TimePicker } from '@mui/x-date-pickers/TimePicker';
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import TextField from '@mui/material/TextField';

const EventForm = () => {

    const [dateValue, setDateValue] = useState(null);
    const [timeValue, setTimeValue] = useState(null);
    const [eventDuration, setEventDuration] = useState('');


    const handleDurationChange = (event) => {
        setEventDuration(event.target.value);
    };

    return (
        <div className="eventform-container">
            <form className="eventform">
                <div className="eventform-header">
                    Create Event
                </div>
                <div className="eventform-body">
                    <div className="eventform-body-row">
                        <input type="text" className='eventform-input' placeholder="Event Title" />
                    </div>
                    <div className="eventform-body-row">
                        <textarea className='eventform-input' placeholder="Event Description" />
                    </div>
                    <div className="eventform-body-row">
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                            <DatePicker
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
                            InputLabelProps={{
                                shrink: true,
                            }}
                        />
                    </div>
                </div>
            </form>
        </div>
    )

//   const [event, setEvent] = useState({
//     title: '',
//     description: '',
//     duration: '',
//     date: '',
//     location: {
//       longitude: '',
//       latitude: '',
//       accuracy: ''
//     }
//   });

//   const handleChange = event => {
//     const { name, value } = event.target;
//     setEvent({ ...event, [name]: value });
//   };

//   const handleLocationChange = event => {
//     const { name, value } = event.target;
//     setEvent({
//       ...event,
//       location: {
//         ...event.location,
//         [name]: value
//       }
//     });
//   };

//   const handleSubmit = event => {
//     event.preventDefault();
//     // submit the form data to the server here
//   };

//   return (
//     <form onSubmit={handleSubmit}>
//       <label htmlFor="title">Event Title:</label>
//       <input
//         type="text"
//         name="title"
//         value={event.title}
//         onChange={handleChange}
//       />
//       <br />
//       <label htmlFor="description">Event Description:</label>
//       <textarea
//         name="description"
//         value={event.description}
//         onChange={handleChange}
//       />
//       <br />
//       <label htmlFor="duration">Duration:</label>
//       <select name="duration" value={event.duration} onChange={handleChange}>
//         <option value="30min">30 minutes</option>
//         <option value="1hr">1 hour</option>
//         <option value="2hr">2 hours</option>
//         <option value="4hr">4 hours</option>
//         <option value="8hr">8 hours</option>
//       </select>
//       <br />
//       <label htmlFor="date">Date:</label>
//       <input
//         type="date"
//         name="date"
//         value={event.date}
//         onChange={handleChange}
//       />
//       <br />
//       <label htmlFor="longitude">Longitude:</label>
//       <input
//         type="text"
//         name="longitude"
//         value={event.location.longitude}
//         onChange={handleLocationChange}
//       />
//       <br />
//       <label htmlFor="latitude">Latitude:</label>
//       <input
//         type="text"
//         name="latitude"
//         value={event.location.latitude}
//         onChange={handleLocationChange}
//       />
//       <br />
//       <label htmlFor="accuracy">Accuracy:</label>
//       <input
//         type="text"
//         name="accuracy"
//         value={event.location.accuracy}
//         onChange={handleLocationChange}
//       />
//       <br />
//       <button type="submit">Create Event</button>
//     </form>
//   );
};

export default EventForm;
