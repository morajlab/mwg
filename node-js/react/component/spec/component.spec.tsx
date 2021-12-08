import React from "react";
import { render } from "@testing-library/react";
import { Primary } from "../stories/Component.composition";

it("should render with the correct text", () => {
  const { getByText } = render(<Primary />);
  const rendered = getByText("Template Component");

  expect(rendered).toBeTruthy();
});
