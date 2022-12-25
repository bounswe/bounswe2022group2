import React, { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { solid } from '@fortawesome/fontawesome-svg-core/import.macro' // <-- import styles to be used
import Participants from './Participants';

export default function Event(props){

  const eventId = props.myEvent.id;
  const eventCreator = props.myEvent.eventCreator;
  const date = props.myEvent.date;
  const description = props.myEvent.description;
  const eventTitle = props.myEvent.title;
  const duration = props.myEvent.duration + " minutes";
  const participationLimit = props.myEvent.participationLimit;
  const geolocation = props.myEvent.geolocation;
  const latitude = geolocation.latitude;  
  const longitude = geolocation.longitude;  
  const participantsArray = props.myEvent.participants;
  const num_participants = props.myEvent.num_participants;

  const d = new Date(date);

  const dformat = [d.getDate(),
                    d.getMonth()+1,
                    d.getFullYear()].join('/')+' '+
                    [d.getHours(),
                    d.getMinutes()].join(':');

  const [isJoined, setIsJoined] = useState(true);

  useEffect(()=>{
    if(showEvent !== true && deleteEvent !== true){
        const ifameData=document.getElementById("iframeId")
        const lat=latitude;
        const lon=longitude;
        ifameData.src=`https://maps.google.com/maps?q=${lat},${lon}&hl=es;&output=embed`
    }
    })

  const [value, setValue] = useState("");

  const [deleteEvent, setDeleteEvent] = useState(false);

  const deleteTheEvent = () => {
        setDeleteEvent(current => !current);
  };

  const [editEvent, setEditEvent] = useState(false);

  const [showEvent, setShowEvent] = useState(true);

  const [showParticipants, setShowParticipants] = useState(true);

  const showTheParticipants = () => {
    setShowParticipants(current => !current);
  };

  const editTheEvent = () => {
      setEditEvent(current => !current);
  };

  const showTheEvent = () => {
    setShowEvent(current => !current);
  };

  const joinEvent = () => {
    setIsJoined(current => !current);
  };

  const token = localStorage.getItem("token");

  const [message, setMessage] = useState("");

  const lsid = props.my_lsid;

    return(
    <div>
        {!deleteEvent &&
        <div className='ls-box-mid'>
            <div className='event-box-right'>
            <label className='feed-title' style={{fontSize: "30px"}}>
                {eventTitle}
            </label>
                <FontAwesomeIcon icon={solid('circle-info')} onClick={showTheEvent} color="#4a07f5" style={{backgroundColor: "transparent",
                    alignSelf: "center",
                    marginLeft: "auto",
                    border: "none",
                    paddingTop: "6px",
                    fontSize: "25px",
                    cursor: "pointer",
                    outline: "none"}}/>
              </div>
              <div className='space-5'></div>
              <div className='event-box-right'>
                {!isJoined ? <button className="btn-white2" disabled>Joined</button> : <button className="btn-orange" onClick={joinEvent}>Join</button>}
                <FontAwesomeIcon icon={solid('people-group')} onClick={showTheParticipants} color="#000000" style={{backgroundColor: "transparent",
                    alignSelf: "center",
                    marginLeft: "auto",
                    border: "none",
                    paddingTop: "6px",
                    fontSize: "25px",
                    cursor: "pointer",
                    outline: "none"}}/>
               <div style={{marginLeft: "6.5px", fontSize: "20px", color: "#000000"}}>
                    {num_participants}
                    </div>
              </div>
                {!showParticipants && <div><div className='space-5'></div><div className='add-post-box-mid' style={{margin:"auto", marginBottom: "6.5px", marginTop: "6.5px"}}>
                    {participantsArray.map(participant =>	
                                    <Participants participant = {participant}/>)} </div></div>}
            {!showEvent && <div>
            <div className='space-5'></div>
                {description}
            <div className='space-5'></div>
                <div className='event-buttons-contaier'>
                        <div className='event-button-container-alt'>
                            <label className='post-owner-icon-container'>
                                <FontAwesomeIcon icon={solid('calendar-days')} color="black"/>
                            </label>
                        </div>
                        <div className='event-owner-display-item'>
                            {dformat}
                        </div>
                        <div className='event-button-container-alt'>
                            <label className='post-owner-icon-container'>
                                    <FontAwesomeIcon icon={solid('hourglass')} color="black"/>
                            </label>
                        </div>
                        <div className='event-owner-display-item'>
                            {duration}
                        </div>
                        </div>
                        <div className='space-5'></div>
                       
                        <div>
                            <iframe id="iframeId" height="230px" width="100%"></iframe>
                        </div>
            <div className='space-5'></div>
            <div className='event-buttons-contaier'>
                    <div className='event-button-container-alt'>
                        <label className='post-owner-icon-container'>
                            <FontAwesomeIcon icon={solid('user-pen')} color="black"/>
                        </label>
                    </div>
                    <div className='post-owner-display-item'>
                        {eventCreator}
                    </div>
                    <div className='event-button-container-alt'>
                        <button className='post-edit-icon-container'>
                            <FontAwesomeIcon icon={solid('edit')} color="black" onClick={editTheEvent}/>
                        </button>
                    </div>
                    <div className='event-button-container-alt'>
                        <button className='post-delete-button'>
                            <FontAwesomeIcon icon={solid('trash-can')} color="black" onClick={deleteTheEvent}/>
                        </button>
                    </div>
                </div>
                </div>}
        </div>
        }
        </div>
    );
}