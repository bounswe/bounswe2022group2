import React from "react";
import LearningSpaceDetailsProfile from "./../components/LearningSpaceDetailsProfile";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("LearningSpaceDetailsProfile", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><LearningSpaceDetailsProfile /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
} );

test('learning space details profile renders correctly', async () => {
    render(<BrowserRouter><LearningSpaceDetailsProfile /></BrowserRouter>);
    const learningSpaceDetailsProfile = screen.getByTestId(/learning-space-details-profile/i);
    expect(learningSpaceDetailsProfile).toBeInTheDocument();
}   );

test('learning space details profile image renders correctly', async () => {
    render(<BrowserRouter><LearningSpaceDetailsProfile /></BrowserRouter>);
    const profileImage = screen.getByAltText(/ls-icon-profile/i);
    expect(profileImage).toBeInTheDocument();
}  );