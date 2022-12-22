import React from "react";
import CategoriesPage from "./../pages/CategoriesPage";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("CategoriesPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><CategoriesPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
});

test('categories page text renders correctly', async () => {
    render(<BrowserRouter><CategoriesPage /></BrowserRouter>);
    const heading = screen.getByText(/Looking for some categories?/i);
    expect(heading).toBeInTheDocument();
    const phrase = screen.getByText(/In Learnify we have tons of various learning spaces for every curiosity you have. Browse the selection of our categories below./i);
    expect(phrase).toBeInTheDocument();
}   );

test('categories illustration renders correctly', async () => {
    render(<BrowserRouter><CategoriesPage /></BrowserRouter>);
    const illustration = screen.getByAltText(/Categories Page Illustration/i);
    expect(illustration).toBeInTheDocument();
}   );

test('footer renders correctly', async () => {
    render(<BrowserRouter><CategoriesPage /></BrowserRouter>);
    const footer = screen.getByTestId(/footer/i);
    expect(footer).toBeInTheDocument();
}   );

test('navbar renders correctly', async () => {
    render(<BrowserRouter><CategoriesPage /></BrowserRouter>);
    const navbar = screen.getByTestId(/navbar/i);
    expect(navbar).toBeInTheDocument();
}   );