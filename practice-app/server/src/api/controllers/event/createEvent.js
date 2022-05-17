import { Event } from '../../../models/index.js';
import { validateEvent } from '../../validators/event.validator.js';
import axios from 'axios';
import { apiKeyGeo } from '../../../config/index.js';
import mongoose from 'mongoose';

async function getCoordinates(address) {

    const http_formatted_address = address.replace(/\s/g, '+');

    var url = "https://maps.googleapis.com/maps/api/geocode/json?";

    var params = {
        address: http_formatted_address,
        key: apiKeyGeo
    };

    Object.keys(params).forEach(function (url_key) { url += "&" + url_key + "=" + params[url_key]; });

    const http_res = await axios.get(url);

    var res = http_res.data;

    if (res.status == "ZERO_RESULTS" || res.status == "INVALID_REQUEST") {
        throw new Error("Invalid address");
    }

    if (res.status == "OVER_DAILY_LIMIT" || res.status == "OVER_QUERY_LIMIT" || res.status == "REQUEST_DENIED" || res.status == "UNKNOWN_ERROR") {
        throw new Error("Cannot generate request for now");
    }

    if (res.status == "OK") {
        const formatted_address = res.results[0].formatted_address;
        const longitude = res.results[0].geometry.location.lng;
        const latitude = res.results[0].geometry.location.lat;

        return [formatted_address, longitude, latitude];
    }

}

async function createEvent(title, date, location, host_id, lesson_id) {

    const { error } = validateEvent({ "title": title, "date": date, "location": location , "host_id": host_id, "lesson_id": lesson_id});

    if (error) {
        throw new Error(error.details[0].message);
    }

    try {
        const apicall_res1 = await getCoordinates(location);
        const full_address = apicall_res1[0];

        let event = new Event({
            title: title,
            date: date,
            location: full_address,
            host_id: host_id,
            lesson_id: lesson_id,
        });
    
        event = await event.save().catch((err) => {
            return err;
        });
    
        return {
            resultMessage: "Event successfully created.", event: event.toJSON()
        };
    } catch (err) {
        if (err.message == "Invalid address") {
            throw new Error("Invalid address");
        } else {
            throw new Error("Cannot generate request for now");
        }
    }

}

export {createEvent}; 