import React from "react";
import SignUpForm from './../pages/SignUpForm';
import { screen, render, fireEvent } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";


describe.only("SignUpForm", () => {

  test("should render page layout correctly", () => {
    const {container} = render(<BrowserRouter><SignUpForm /></BrowserRouter>);
    expect(container.firstChild.classList.contains('pageLayout')).toBe(true);
  });

  test("should accept inputs", () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");
    expect(usernameInput).toBeInstanceOf(HTMLInputElement);
    expect(emailInput).toBeInstanceOf(HTMLInputElement);
    expect(passwordInput).toBeInstanceOf(HTMLInputElement);
    expect(confirmPasswordInput).toBeInstanceOf(HTMLInputElement);
    expect(kvkkInput).toBeInstanceOf(HTMLInputElement);
    expect(registerButton).toBeInstanceOf(HTMLButtonElement);

  });

  test("has a clickable and checkable checkbox", () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const kvkkInput = screen.getByTestId("kvkk");
    expect(kvkkInput.checked).toEqual(false);
    fireEvent.click(kvkkInput);
    expect(kvkkInput.checked).toEqual(true);
  });

  test("should render correct error message when invalid username is entered", async () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");

    fireEvent.change(usernameInput, {
      target: { value: "aa" },
    });

    fireEvent.change(emailInput, {
      target: { value: "test@test.com" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.change(confirmPasswordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.click(kvkkInput);

    fireEvent.submit(registerButton);

    await screen.findByText("Username must be at least 3 characters long!");

  });

  test("should render correct error message when invalid email is entered", async () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");

    fireEvent.change(usernameInput, {
      target: { value: "test" },
    });

    fireEvent.change(emailInput, {
      target: { value: "invalidemail" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.change(confirmPasswordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.click(kvkkInput);

    fireEvent.submit(registerButton);

    await screen.findByText("Invalid email!");

  });

  test("should render correct error message when invalid password is entered", async () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");

    fireEvent.change(usernameInput, {
      target: { value: "test" },
    });

    fireEvent.change(emailInput, {
      target: { value: "test@test.com" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "test" },
    });

    fireEvent.change(confirmPasswordInput, {
      target: { value: "test" },
    });

    fireEvent.click(kvkkInput);

    fireEvent.submit(registerButton);

    await screen.findByText("Password must be 6 to 20 characters long and contain at least one uppercase, one lowercase letter, and one number!");

  });

  test("should render correct error message when passwords entered do not match", async () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");

    fireEvent.change(usernameInput, {
      target: { value: "test" },
    });

    fireEvent.change(emailInput, {
      target: { value: "test@test.com" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.change(confirmPasswordInput, {
      target: { value: "test" },
    });

    fireEvent.click(kvkkInput);

    fireEvent.submit(registerButton);

    await screen.findByText("Passwords do not match!");

  });

  test("should render correct error message when kvkk checkbox is unchecked", async () => {
    render(<BrowserRouter><SignUpForm /></BrowserRouter>);

    const usernameInput = screen.getByTestId("username");
    const emailInput = screen.getByTestId("email");
    const passwordInput = screen.getByTestId("password");
    const confirmPasswordInput = screen.getByTestId("confirmPassword");
    const kvkkInput = screen.getByTestId("kvkk");
    const registerButton = screen.getByTestId("submit");

    fireEvent.change(usernameInput, {
      target: { value: "test" },
    });

    fireEvent.change(emailInput, {
      target: { value: "test@test.com" },
    });

    fireEvent.change(passwordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.change(confirmPasswordInput, {
      target: { value: "Testing1" },
    });

    fireEvent.submit(registerButton);

    await screen.findByText("You must agree the KVKK confirmation!");

  });

});
