import React from "react";
import MyLearningSpacesPage from "./../pages/MyLearningSpacesPage";
import { render, waitFor, screen, fireEvent } from '@testing-library/react';
import axiosMock from 'axios';
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("MyLearningSpacesPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
});

test('my learning spaces page footer renders correctly', async () => {
    render(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>);
    const footer = screen.getByTestId(/footer/i);
    expect(footer).toBeInTheDocument();
}  );

test('my learning spaces page navbar renders correctly', async () => {
    render(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>);
    const navbar = screen.getByTestId(/navbar/i);
    expect(navbar).toBeInTheDocument();
}  );

test('my learning spaces page header renders correctly', async () => {
    render(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>);
    const header = screen.getByText(/Browsing the learning spaces of:/i);
    expect(header).toBeInTheDocument();
}  );

test('my learning spaces page username header renders correctly', async () => {
    render(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>);
    const username = screen.getByTestId(/myls-username/i);
    expect(username).toBeInTheDocument();
}  );

test('my learning spaces page body renders correctly', async () => {
    render(<BrowserRouter><MyLearningSpacesPage /></BrowserRouter>);
    const body = screen.getByTestId(/myls-body/i);
    expect(body).toBeInTheDocument();
}  );