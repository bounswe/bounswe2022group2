import React from "react";
import Footer from "./../components/Footer";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("Footer", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><Footer /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}    );

test('footer renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const footer = screen.getByTestId(/footer/i);
    expect(footer).toBeInTheDocument();
}  );

test('footer renders all links correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const homeLink = screen.getByText(/home/i);
    const categoriesLink = screen.getByText(/categories/i);
    const notificationsLink = screen.getByText(/notifications/i);
    const profileLink = screen.getByText(/profile/i);
    const contactLink = screen.getByText(/contact/i);
    const aboutLink = screen.getByText(/about/i);
    const myLearningSpacesLink = screen.getByText(/my learning spaces/i);
    const popularLearningSpacesLink = screen.getByText(/popular learning spaces/i);
    const recommendedLearningSpacesLink = screen.getByText(/recommended learning spaces/i);
    expect(homeLink).toBeInTheDocument();
    expect(categoriesLink).toBeInTheDocument();
    expect(notificationsLink).toBeInTheDocument();
    expect(profileLink).toBeInTheDocument();
    expect(contactLink).toBeInTheDocument();
    expect(aboutLink).toBeInTheDocument();
    expect(myLearningSpacesLink).toBeInTheDocument();
    expect(popularLearningSpacesLink).toBeInTheDocument();
    expect(recommendedLearningSpacesLink).toBeInTheDocument();
} );

test('footer home link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const homeLink = screen.getByText(/home/i);
    expect(homeLink).toBeInTheDocument();
} );

test('footer home link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const homeLink = screen.getByText(/home/i);
    fireEvent.click(homeLink);
    expect(homeLink).toBeInTheDocument();
} );

test('footer categories link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const categoriesLink = screen.getByText(/categories/i);
    expect(categoriesLink).toBeInTheDocument();
} );

test('footer categories link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const categoriesLink = screen.getByText(/categories/i);
    fireEvent.click(categoriesLink);
    expect(categoriesLink).toBeInTheDocument();
}   );

test('footer notifications link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const notificationsLink = screen.getByText(/notifications/i);
    expect(notificationsLink).toBeInTheDocument();
} );

test('footer notifications link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const notificationsLink = screen.getByText(/notifications/i);
    fireEvent.click(notificationsLink);
    expect(notificationsLink).toBeInTheDocument();
} );

test('footer profile link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const profileLink = screen.getByText(/profile/i);
    expect(profileLink).toBeInTheDocument();
}   );

test('footer profile link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const profileLink = screen.getByText(/profile/i);
    fireEvent.click(profileLink);
    expect(profileLink).toBeInTheDocument();
} );

test('footer contact link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const contactLink = screen.getByText(/contact/i);
    expect(contactLink).toBeInTheDocument();
} );

test('footer contact link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const contactLink = screen.getByText(/contact/i);
    fireEvent.click(contactLink);
    expect(contactLink).toBeInTheDocument();
}   );

test('footer about link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const aboutLink = screen.getByText(/about/i);
    expect(aboutLink).toBeInTheDocument();
}   );

test('footer about link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const aboutLink = screen.getByText(/about/i);
    fireEvent.click(aboutLink);
    expect(aboutLink).toBeInTheDocument();
}  );

test('footer my learning spaces link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const myLearningSpacesLink = screen.getByText(/my learning spaces/i);
    expect(myLearningSpacesLink).toBeInTheDocument();
} );

test('footer my learning spaces link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const myLearningSpacesLink = screen.getByText(/my learning spaces/i);
    fireEvent.click(myLearningSpacesLink);
    expect(myLearningSpacesLink).toBeInTheDocument();
} );

test('footer popular learning spaces link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const popularLearningSpacesLink = screen.getByText(/popular learning spaces/i);
    expect(popularLearningSpacesLink).toBeInTheDocument();
} );

test('footer popular learning spaces link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const popularLearningSpacesLink = screen.getByText(/popular learning spaces/i);
    fireEvent.click(popularLearningSpacesLink);
    expect(popularLearningSpacesLink).toBeInTheDocument();
} );

test('footer recommended learning spaces link renders correctly', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const recommendedLearningSpacesLink = screen.getByText(/recommended learning spaces/i);
    expect(recommendedLearningSpacesLink).toBeInTheDocument();
}   );

test('footer recommended learning spaces link should be clickable', async () => {
    render(<BrowserRouter><Footer /></BrowserRouter>);
    const recommendedLearningSpacesLink = screen.getByText(/recommended learning spaces/i);
    fireEvent.click(recommendedLearningSpacesLink);
    expect(recommendedLearningSpacesLink).toBeInTheDocument();
} );

