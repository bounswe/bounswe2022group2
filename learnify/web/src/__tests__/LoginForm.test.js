import React from "react";
import { screen, render, fireEvent } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";
import LoginForm from "./../pages/LoginForm";


describe.only("LoginForm", () => {

  test("should render page layout correctly", () => {
    const {container} = render(<BrowserRouter><LoginForm /></BrowserRouter>);
    expect(container.firstChild.classList.contains('pageLayout')).toBe(true);
  });

  test("should accept inputs", () => {
    render(<BrowserRouter><LoginForm /></BrowserRouter>);

    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const loginButton = screen.getByTestId("submit");
    const forgotPasswordButton = screen.getByTestId("forgotPassword");
    expect(forgotPasswordButton).toBeInstanceOf(HTMLButtonElement);
    expect(emailInput).toBeInstanceOf(HTMLInputElement);
    expect(passwordInput).toBeInstanceOf(HTMLInputElement);
    expect(loginButton).toBeInstanceOf(HTMLButtonElement);

  });
  test("should render correct error message when wrong formatted email is entered", async () => {
    render(<BrowserRouter><LoginForm /></BrowserRouter>);

    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const loginButton = screen.getByTestId("submit");

    fireEvent.change(emailInput, {
      target: { value: "test@test" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "TestPassword" },
    });

    fireEvent.submit(loginButton);

    await screen.findByText("Invalid email!");

  });


});
