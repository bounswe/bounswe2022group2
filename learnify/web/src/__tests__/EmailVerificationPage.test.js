import React from "react";
import EmailVerificationPage from './../pages/EmailVerificationPage';
import { screen, render, fireEvent } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";


describe.only("EmailVerificationPage", () => {

  test("should render page layout correctly", () => {
    const {container} = render(<BrowserRouter><EmailVerificationPage /></BrowserRouter>);
    expect(container.firstChild.classList.contains('pageLayout')).toBe(true);
  });

  test("should accept input", () => {
    render(<BrowserRouter><EmailVerificationPage /></BrowserRouter>);

    const verificationCodeInput = screen.getByTestId("verificationCode");
    const verifyButton = screen.getByTestId("submit");
    const resendButton = screen.getByTestId("submitResend");
    expect(verificationCodeInput).toBeInstanceOf(HTMLInputElement);
    expect(verifyButton).toBeInstanceOf(HTMLButtonElement);
    expect(resendButton).toBeInstanceOf(HTMLButtonElement);

  });

  test("should render correct error message when invalid verification code is entered", async () => {
    render(<BrowserRouter><EmailVerificationPage /></BrowserRouter>);

    const verificationCodeInput = screen.getByTestId("verificationCode");
    const verifyButton = screen.getByTestId("submit");
    const resendButton = screen.getByTestId("submitResend");

    fireEvent.change(verificationCodeInput, {
      target: { value: "aa" },
    });

    fireEvent.submit(verifyButton);

    fireEvent.submit(resendButton);

    await screen.findByText("Verification Code must contain exactly 4 digit number!");

  });

});
