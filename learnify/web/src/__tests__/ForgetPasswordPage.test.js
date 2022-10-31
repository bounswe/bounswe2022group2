import React from "react";
import { screen, render, fireEvent } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";
import ForgetPassword from "./../pages/ForgetPassword";


describe.only("ForgetPassword", () => {

  test("should render page layout correctly", () => {
    const {container} = render(<BrowserRouter><ForgetPassword /></BrowserRouter>);
    expect(container.firstChild.classList.contains('pageLayout')).toBe(true);
  });

  test("should accept input", () => {
    render(<BrowserRouter><ForgetPassword /></BrowserRouter>);

    const emailInput = screen.getByTestId("email");
    const sendButton = screen.getByTestId("submit");
    expect(emailInput).toBeInstanceOf(HTMLInputElement);
    expect(sendButton).toBeInstanceOf(HTMLButtonElement);

  });


});
