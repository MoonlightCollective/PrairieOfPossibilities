//import {parse} from 'csv-parse/lib/sync';

// This plugin creates 5 rectangles on the screen.
const numberOfBases = 5
async function loadFonts() {

  await figma.loadFontAsync({ family: "Inter", style: "Regular" });
  console.log("Awaiting the fonts.");
};

// This file holds the main code for the plugins. It has access to the *document*.
// You can access browser APIs such as the network by creating a UI which contains
// a full browser environment (see documentation).

(async() => {
  await loadFonts();

  const nodes: SceneNode[] = [];
  const node = figma.currentPage;
  const base = node.findOne(node => node.type === "COMPONENT" && node.name === "Light Base") as ComponentNode;
  const lights = node.findOne(node => node.type === "GROUP" && node.name === "Lights") as FrameNode;

  for (let i = 0; i < numberOfBases; i++) {
    const light = base.createInstance();
    light.x = i * 150;
    const id = light.findOne(node => node.type === "TEXT" && node.name === "#ID") as TextNode;
    id.characters = i.toString();

    lights.appendChild(light);
    nodes.push(light);
  }
  figma.currentPage.selection = nodes;
  figma.viewport.scrollAndZoomIntoView(nodes);

  // Make sure to close the plugin when you're done. Otherwise the plugin will
  // keep running, which shows the cancel button at the bottom of the screen.
  figma.closePlugin();

})();
