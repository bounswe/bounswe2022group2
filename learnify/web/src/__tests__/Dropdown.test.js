import React from "react";
import Dropdown from "./../components/Dropdown";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("Dropdown", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><Dropdown /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}   );

test('dropdown renders correctly', async () => {
    render(<BrowserRouter><Dropdown /></BrowserRouter>);
    const dropdown = screen.getByText(/Select Category/i);
    expect(dropdown).toBeInTheDocument();
});