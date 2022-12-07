import React from "react";
import NavBar from "./../components/NavBar";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("NavBar", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><NavBar /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}   );

test('navbar renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const navbar = screen.getByTestId(/navbar/i);
    expect(navbar).toBeInTheDocument();
}   );

test('navbar logo renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const logo = screen.getByAltText(/Learnify Logo Navbar/i);
    expect(logo).toBeInTheDocument();
}   );

test('navbar search input renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const searchInput = screen.getByPlaceholderText(/Search learning spaces/i);
    expect(searchInput).toBeInTheDocument();
}   );

test('navbar search bar should accept input', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const searchInput = screen.getByPlaceholderText(/Search learning spaces/i);
    fireEvent.change(searchInput, { target: { value: 'test' } });
    expect(searchInput.value).toBe('test');
}   );

test('navbar notifications icon renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const notificationIcon = screen.getByAltText(/Notifications Icon/i);
    expect(notificationIcon).toBeInTheDocument();
}   );

test('navbar notifications icon should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const notificationIcon = screen.getByAltText(/Notifications Icon/i);
    fireEvent.click(notificationIcon);
    expect(notificationIcon).toBeInTheDocument();
}   );

test('navbar home button renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const homeButton = screen.getByText(/Home/i);
    expect(homeButton).toBeInTheDocument();
}   );

test('navbar home button should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const homeButton = screen.getByText(/Home/i);
    fireEvent.click(homeButton);
    expect(homeButton).toBeInTheDocument();
}   );

test('navbar home button href should be correct', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const homeButton = screen.getByText(/Home/i);
    expect(homeButton.href).toBe('http://localhost/home');
}   );

test('navbar categories button renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const categoriesButton = screen.getByText(/Categories/i);
    expect(categoriesButton).toBeInTheDocument();
}   );

test('navbar categories button should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const categoriesButton = screen.getByText(/Categories/i);
    fireEvent.click(categoriesButton);
    expect(categoriesButton).toBeInTheDocument();
}   );

test('navbar categories button href should be correct', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const categoriesButton = screen.getByText(/Categories/i);
    expect(categoriesButton.href).toBe('http://localhost/categories');
}   );

test('navbar about button renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const aboutButton = screen.getByText(/About/i);
    expect(aboutButton).toBeInTheDocument();
}   );

test('navbar about button should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const aboutButton = screen.getByText(/About/i);
    fireEvent.click(aboutButton);
    expect(aboutButton).toBeInTheDocument();
}   );

test('navbar about button href should be correct', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const aboutButton = screen.getByText(/About/i);
    expect(aboutButton.href).toBe('http://localhost/about');
}   );

test('navbar contact button renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const contactButton = screen.getByText(/Contact/i);
    expect(contactButton).toBeInTheDocument();
}   );

test('navbar contact button should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const contactButton = screen.getByText(/Contact/i);
    fireEvent.click(contactButton);
    expect(contactButton).toBeInTheDocument();
}   );

test('navbar contact button href should be correct', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const contactButton = screen.getByText(/Contact/i);
    expect(contactButton.href).toBe('http://localhost/contact');
}   );

test('navbar profile button renders correctly', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const profileButton = screen.getByText(/Profile/i);
    expect(profileButton).toBeInTheDocument();
}   );

test('navbar profile button should be clickable', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const profileButton = screen.getByText(/Profile/i);
    fireEvent.click(profileButton);
    expect(profileButton).toBeInTheDocument();
}   );

test('navbar profile button href should be correct', async () => {
    render(<BrowserRouter><NavBar /></BrowserRouter>);
    const profileButton = screen.getByText(/Profile/i);
    expect(profileButton.href).toBe('http://localhost/profile');
}   );