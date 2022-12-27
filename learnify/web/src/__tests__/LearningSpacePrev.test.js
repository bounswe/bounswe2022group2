import React from 'react';
import { render, fireEvent, waitFor } from '@testing-library/react';
import LearningSpacePrev from './../components/LearningSpacePrev';

test('renders the component correctly', () => {
    const { getByTestId } = render(<LearningSpacePrev />);
    const card = getByTestId('ls-prev-card');
    expect(card).toBeInTheDocument();
});

test('renders the component with correct props', () => {
    const { getByTestId } = render(<LearningSpacePrev icon_id={1} title="Test Title" url="/test-url" />);
    const card = getByTestId('ls-prev-card');
    expect(card).toBeInTheDocument();
});

test('renders the correct icon', () => {
  const { getByAltText } = render(<LearningSpacePrev icon_id={1} />);
  const icon = getByAltText('learning space icon');
  expect(icon).toBeInTheDocument();
});

test('renders the correct title', () => {
  const { getByText } = render(<LearningSpacePrev title="Test Title" />);
  const title = getByText('Test Title');
  expect(title).toBeInTheDocument();
});

test('ls prev box is clickable', () => {
    const { getByTestId } = render(<LearningSpacePrev url="/test-url" />);
    const card = getByTestId('ls-prev-card');
    fireEvent.click(card);
    expect(card).toBeInTheDocument();
});
