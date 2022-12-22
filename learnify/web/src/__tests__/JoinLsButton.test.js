import React from "react";
import JoinLsButton from "./../components/JoinLsButton";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("JoinLsButton", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><JoinLsButton participants = {[ "gokay", "koray", "altay", "enes"]}/></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}   );

test('join ls button renders correctly', async () => {
    render(<BrowserRouter><JoinLsButton participants = {[ "gokay", "koray", "altay", "enes"]}/></BrowserRouter>);
    const button = screen.getByText(/Join/i);
    expect(button).toBeInTheDocument();
}  );
