import React from "react";
import { render } from "@testing-library/react";
import { BasicBare } from "./bare.composition";

it("should render with the correct text", () => {
  const { getByText } = render(<BasicBare />);
  const rendered = getByText("Basic Bare Component");

  expect(rendered).toBeTruthy();
});
