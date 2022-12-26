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

});
