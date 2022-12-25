import React from 'react';

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
  

    return(
    <div>

    </div>
    );
}