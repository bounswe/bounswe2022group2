import React from "react";
import PopularLearningSpacesPage from "../pages/PopularLearningSpacesPage";
import { render, screen } from '@testing-library/react';
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("PopularLearningSpacesPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><PopularLearningSpacesPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}   );

test('popular learning spaces page footer renders correctly', async () => {
    render(<BrowserRouter><PopularLearningSpacesPage /></BrowserRouter>);
    const footer = screen.getByTestId(/footer/i);
    expect(footer).toBeInTheDocument();
}   );

test('popular learning spaces page navbar renders correctly', async () => {
    render(<BrowserRouter><PopularLearningSpacesPage /></BrowserRouter>);
    const navbar = screen.getByTestId(/navbar/i);
    expect(navbar).toBeInTheDocument();
}   );

test('popular learning spaces page header renders correctly', async () => {
    render(<BrowserRouter><PopularLearningSpacesPage /></BrowserRouter>);
    const header = screen.getByText(/Browsing the current most popular learning spaces:/i);
    expect(header).toBeInTheDocument();
}   );

test('popular learning spaces page body renders correctly', async () => {
    render(<BrowserRouter><PopularLearningSpacesPage /></BrowserRouter>);
    const body = screen.getByTestId(/popularls-body/i);
    expect(body).toBeInTheDocument();
}   );

