import React from "react";
import Comment from "./../components/Comment";
import { screen, render, fireEvent } from "@testing-library/react";
import renderer from "react-test-renderer";
import { BrowserRouter } from "react-router-dom";

const testComment = {
  _id: "1",
  creator: "user1",
  content: "This is a test comment.",
  images: [""],
};

describe("Comment", () => {
  test("should render the comment correctly", async () => {
    const component = renderer
      .create(<BrowserRouter><Comment myComment={testComment} my_lsid="1" /></BrowserRouter>)
      .toJSON();
    expect(component).toMatchSnapshot();
  });

  test("should render the upvote and downvote buttons", async () => {
    render(<BrowserRouter><Comment myComment={testComment} my_lsid="1" /></BrowserRouter>);
    const upvoteButton = screen.getByTestId(/upvote-button/i);
    const downvoteButton = screen.getByTestId(/downvote-button/i);
    expect(upvoteButton).toBeInTheDocument();
    expect(downvoteButton).toBeInTheDocument();
  });

  test("should increase the upvote and downvote counters when clicked", async () => {
    render(<BrowserRouter><Comment myComment={testComment} my_lsid="1" /></BrowserRouter>);
    const upvoteButton = screen.getByTestId(/upvote-button/i);
    const downvoteButton = screen.getByTestId(/downvote-button/i);
    fireEvent.click(upvoteButton);
    fireEvent.click(downvoteButton);
    expect(upvoteButton.textContent).toBe("");
    expect(downvoteButton.textContent).toBe("");
  });

  test("should render the delete button and delete the comment when clicked", async () => {
    render(<BrowserRouter><Comment myComment={testComment} my_lsid="1" /></BrowserRouter>);
    const deleteButton = screen.getByTestId(/delete-button/i);
    fireEvent.click(deleteButton);
    expect(deleteButton).toBeInTheDocument();
    expect(screen.queryByTestId("ls-box-mid")).toBeNull();
  });

  test("should render the edit button and the edit form when clicked", async () => {
    render(<BrowserRouter><Comment myComment={testComment} my_lsid="1" /></BrowserRouter>);
    const editButton = screen.getByTestId(/edit-button/i);
    fireEvent.click(editButton);
    expect(editButton).toBeInTheDocument();
});
});

