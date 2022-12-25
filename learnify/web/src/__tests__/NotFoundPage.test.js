import React from "react";
import NotFoundPage from "./../pages/NotFoundPage";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("NotFoundPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><NotFoundPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
});

test('Not found page text renders correctly', async () => {
    render(<BrowserRouter><NotFoundPage /></BrowserRouter>);
    const heading = screen.getByText(/Oops! Something went wrong!/i);
    expect(heading).toBeInTheDocument();
}   );

test('not found page illustration renders correctly', async () => {
    render(<BrowserRouter><NotFoundPage /></BrowserRouter>);
    const illustration = screen.getByAltText(/Learnify 404 Not Found/i);
    expect(illustration).toBeInTheDocument();
}   );

test('not found page logo renders correctly', async () => {
    render(<BrowserRouter><NotFoundPage /></BrowserRouter>);
    const illustration = screen.getByAltText(/Learnify Logo/i);
    expect(illustration).toBeInTheDocument();
}   );