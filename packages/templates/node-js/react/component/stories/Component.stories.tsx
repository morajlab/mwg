import React from "react";
import { ComponentStory, ComponentMeta } from "@storybook/react";
import { Component } from "../src";
import { Primary as PrimaryComposition } from "./Component.composition";

export default {
  title: "React/Components/Component",
  component: Component,
} as ComponentMeta<typeof Component>;

export const Primary: ComponentStory<typeof Component> = PrimaryComposition;
