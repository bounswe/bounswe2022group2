import React from "react";
import AboutUser from "../components/AboutUser";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("AboutUser", () => {
    test('should render page layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><AboutUser /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
});

