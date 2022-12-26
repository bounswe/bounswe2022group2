import React from "react";
import ContactPage from "./../pages/ContactPage";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("ContactPage", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><ContactPage /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}  );

test('contact page renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPage = screen.getByTestId(/contact-page/i);
    expect(contactPage).toBeInTheDocument();
} );

test('contact page title renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageTitle = screen.getByText(/Tell Us About Any Issues/i);
    expect(contactPageTitle).toBeInTheDocument();
} );

test('contact page form renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageForm = screen.getByTestId(/contact-form/i);
    expect(contactPageForm).toBeInTheDocument();
} );

test('contact page form subject input renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormNameInput = screen.getByText(/Subject of your issue/i);
    expect(contactPageFormNameInput).toBeInTheDocument();
} );

test('contact page form content input renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormNameInput = screen.getByText(/Can you please specify the problem/i);
    expect(contactPageFormNameInput).toBeInTheDocument();
} );

test('contact page form submit button renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormSubmitButton = screen.getByText(/Submit/i);
    expect(contactPageFormSubmitButton).toBeInTheDocument();
} );

test('contact page form submit button should be clickable', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormSubmitButton = screen.getByText(/Submit Issue/i);
    fireEvent.click(contactPageFormSubmitButton);
    expect(contactPageFormSubmitButton).toBeInTheDocument();
} );

test('contact page information for users renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormNameInput = screen.getByText(/About This Page and Issue Forms/i);
    expect(contactPageFormNameInput).toBeInTheDocument();
} );


test('contact page quote renders correctly', async () => {
    render(<BrowserRouter><ContactPage /></BrowserRouter>);
    const contactPageFormNameInput = screen.getByText(/It is important for our co-learners to have a good and respectful experience in order to feel valued, motivated, and supported in their learning journey/i);
    expect(contactPageFormNameInput).toBeInTheDocument();
} );











