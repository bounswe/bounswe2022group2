import React from 'react';
import { render, fireEvent } from '@testing-library/react';
import Event from './../components/Event';

describe('Event', () => {
  it('renders the correct event title', () => {
    const event = {
      id: '1',
      eventCreator: 'John',
      date: '2022-01-01T12:00:00.000Z',
      description: 'Event description',
      title: 'Event Title',
      duration: 60,
      participationLimit: 10,
      geolocation: {
        latitude: 123,
        longitude: 456
      },
      participants: [],
      num_participants: 0
    };
    const { getByText } = render(<Event myEvent={event} />);
    expect(getByText('Event Title')).toBeInTheDocument();
  });

  it('renders the correct date and time for the event', () => {
    const event = {
      id: '1',
      eventCreator: 'John',
      date: '0',
      description: 'Event description',
      title: 'Event Title',
      duration: 60,
      participationLimit: 10,
      geolocation: {
        latitude: 123,
        longitude: 456
      },
      participants: [],
      num_participants: 0
    };
    const { getByText } = render(<Event myEvent={event} />);
    expect(getByText('0')).toBeInTheDocument();
  });
});
