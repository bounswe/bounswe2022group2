import React from "react";
import LSbyCategoryPage from "./../pages/LSbyCategoryPage";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("LSbyCategoryPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><LSbyCategoryPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}   );

test('ls by category page heading renders correctly', async () => {
    render(<BrowserRouter><LSbyCategoryPage /></BrowserRouter>);
    const heading = screen.getByText(/Browsing the category:/i);
    expect(heading).toBeInTheDocument();
}   );

test('ls by category page category header renders correctly', async () => {
    render(<BrowserRouter><LSbyCategoryPage /></BrowserRouter>);
    const header = screen.getByText(/Category/i);
    expect(header).toBeInTheDocument();
}   );

test('ls by category page footer renders correctly', async () => {        
    render(<BrowserRouter><LSbyCategoryPage /></BrowserRouter>);
    const footer = screen.getByTestId(/footer/i);
    expect(footer).toBeInTheDocument();
}   );

test('ls by category page navbar renders correctly', async () => {        
    render(<BrowserRouter><LSbyCategoryPage /></BrowserRouter>);
    const navbar = screen.getByTestId(/navbar/i);
    expect(navbar).toBeInTheDocument();
}   ); 
