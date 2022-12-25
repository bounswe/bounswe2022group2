import React, { useState, useEffect } from 'react';

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
        
        </div>
    );
}