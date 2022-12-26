import React from 'react';
import { render, cleanup } from '@testing-library/react';
import AboutPage from './AboutPage';

describe('AboutPage', () => {
  afterEach(cleanup);

  it('should render the NavBar component', () => {
    const { getByTestId } = render(<AboutPage />);
    const navBar = getByTestId('nav-bar');
    expect(navBar).toBeInTheDocument();
  });

  it('should render the Footer component', () => {
    const { getByTestId } = render(<AboutPage />);
    const footer = getByTestId('footer');
    expect(footer).toBeInTheDocument();
  });

  it('should render the Markdown editor for the main content', () => {
    const { getByTestId } = render(<AboutPage />);
    const mainEditor = getByTestId('main-editor');
    expect(mainEditor).toBeInTheDocument();
  });

  it('should render the Markdown editor for the side content', () => {
    const { getByTestId } = render(<AboutPage />);
    const sideEditor = getByTestId('side-editor');
    expect(sideEditor).toBeInTheDocument();
  });
});
