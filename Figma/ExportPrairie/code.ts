async function loadFonts() {

  await figma.loadFontAsync({ family: "Inter", style: "Regular" });
  console.log("Awaiting the fonts.");
};

async function exportFixtures() {
  // write out a JSON file for use with Unity that exports locations for all light bases in the current 
  // figma drawing

  // steps:
  // go through all folders
  // if it finds a light base, export coordinates

  const pageNode = figma.currentPage;
  const lights = pageNode.findAll(node => node.name === "Light Base" && node.type === "INSTANCE");
  const portals = pageNode.findAll(node => node.name === "Portal" && node.type === "INSTANCE");
  console.log(`Found ${lights.length} lights and ${portals.length} bases`);

  const fixtureFile = {
    label: "Prairie Layout",
    comment: "Exported from Figma",
    children: [],
    outputs: [],
    wirePaths: [],
    portals: [],
    booths: []
  }

  var counter = 0;
  for (let light of lights)
    {
      const lightNode = light as InstanceNode;
      const fixture = {
        id: counter,
        x: lightNode.x,
        z: -lightNode.y
      }
      fixtureFile.children.push(fixture);
      counter++;
      //console.log(`${light.x},${light.y}`);
    }

    var counter = 0;
    for (let portal of portals)
      {
        // cast portal to instance node
        const portalNode = portal as InstanceNode;
        
        const fixture = {
          portalId: `Portal${counter}`,
          x: portalNode.x,
          z: -portalNode.y,
          rotation: {
            rotX: 0,
            rotY: portalNode.rotation,
            rotZ: 0
          }
        }
        fixtureFile.portals.push(fixture);
        counter++;
      }
    const jsonData = JSON.stringify(fixtureFile, null, 2);
    figma.ui.postMessage (jsonData);
}

// This file holds the main code for the plugins. It has access to the *document*.
// You can access browser APIs such as the network by creating a UI which contains
// a full browser environment (see documentation).

(async() => {
  await loadFonts();

//  figma.showUI(__html__, { width: 300, height: 200 });
figma.showUI(__html__);
console.log(`figma.command = ${figma.command}`)
  console.log(`figma.currentPage.name = '${figma.currentPage.name}'`);

  if (figma.command == "export")
  {
    await exportFixtures();
  }

  // Make sure to close the plugin when you're done. Otherwise the plugin will
  // keep running, which shows the cancel button at the bottom of the screen.
  //figma.closePlugin();

})();


