import SelectIconGrid from '../components/SelectIconGrid';
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from 'react-test-renderer';
import { BrowserRouter } from "react-router-dom";

describe("SelectIconGrid", () => {
    test('should render component layout correctly', async () => {
        const component = renderer.create(<BrowserRouter><SelectIconGrid /></BrowserRouter>).toJSON();
        expect(component).toMatchSnapshot();
    });
}  );

