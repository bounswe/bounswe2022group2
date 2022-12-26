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

