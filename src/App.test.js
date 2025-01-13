import { render, screen } from '@testing-library/react';
import App from './App';

test('renders mailto link', () => {
  render(<App />);
  const linkElement = screen.getByText(/GuayaKO@c71qu3.link/i);
  expect(linkElement).toBeInTheDocument();
});
