import React from "react";
import { Styles } from "./Component.styles";
import type { ComponentType } from "./Component.types";

export const Component: ComponentType = ({ ...rest }) => {
  const { root } = Styles();

  return (
    <div className={root} {...rest}>
      Template Component
    </div>
  );
};

export default Component;
