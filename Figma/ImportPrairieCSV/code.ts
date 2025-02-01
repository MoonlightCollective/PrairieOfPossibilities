async function loadFonts() {

  await figma.loadFontAsync({ family: "Inter", style: "Regular" });
  console.log("Awaiting the fonts.");
};


var lightBaseMap = new Map();
var pathList = [];
var portalList = [];
var boothList = [];

function buildMaps() {

  var csvData = loadBaseData();
  console.log(`csvData() ${csvData}`);

  var rows = csvData.split("\n");
  console.log(`buildMap() found ${rows.length} base rows`);
  for (var i=0;i<rows.length;i++)
  {
    if (i > 0)
    {
      rows[i] = rows[i].trim();
      var cols = rows[i].split(",");
      // now apply 135 degree rotation
      //var theta = -Math.PI * 135 / 180;
      var theta = 0;
      var oldX = parseFloat(cols[1]);
      var oldZ = parseFloat(cols[2]);
      var newX = oldX * Math.cos(theta) - oldZ * Math.sin(theta);
      var newZ = oldZ * Math.cos(theta) + oldX * Math.sin(theta);
      cols[1] = newX.toString();
      cols[2] = newZ.toString(); 
      lightBaseMap.set(cols[0], cols);
    }
  }

  var portalData = loadPortalData();
  console.log(`portalData() ${portalData}`);
  rows = portalData.split("\n");
  console.log(`found ${rows.length} portals`);
  for (var i=0; i<rows.length; i++)
  {
    if (i > 0)
    {
      // store them as strings.   typescript doesnt' like arrays of arrays
      rows[i] = rows[i].trim();
      portalList.push(rows[i]);
    }
  }

  var boothData = loadBoothData();
  console.log(`boothData() ${boothData}`);
  rows = boothData.split("\n");
  console.log(`found ${rows.length} booths`);
  for (var i=0; i<rows.length; i++)
  {
    if (i > 0)
    {
      // store them as strings.   typescript doesnt' like arrays of arrays
      rows[i] = rows[i].trim();
      boothList.push(rows[i]);
    }
  }

  var pathData = loadPathData();
  console.log(`pathData() ${pathData}`);
  rows = pathData.split("\n");
  console.log(`buildMap() found ${rows.length} path rows`);
  for (var i=0;i<rows.length;i++)
  {
    if (i > 0)
    {
      // store them as strings.   typescript doesnt' like arrays of arrays
      rows[i] = rows[i].trim();
      pathList.push(rows[i]);
    }
  }
}

function loadPortalData()
{
  var portalData = `PortalId,x,z,Theta`;
  return portalData;
}

function loadBoothData()
{
  var boothData = `BoothId,x,z,Theta`;
  return boothData;
}

function loadBaseData()
{
  var baseData = `BaseId,x,z,DistFromCtr,Theta,ChannelStart,PathId,NearestTheta5,DistFromCenterOnTheta5,DistFromTheta5
0,-34.28234,127.5291,132.0567,344.9535,421,2,345,132.0566,-0.1072291
1,-65.89073,-126.8689,142.9591,207.4456,337,2,205,142.8289,6.100174
2,143.88,52.54463,153.1744,69.93793,484,2,70,153.1743,-0.1659542
3,-150.5133,62.12981,162.8324,292.4302,379,2,290,162.6859,6.904327
4,72.91306,-155.8112,172.0274,154.9224,295,2,155,172.0273,-0.2330428
5,54.11977,172.5422,180.8308,17.41461,463,2,15,180.6702,7.618468
6,-163.7825,-94.91487,189.2975,239.9069,358,2,240,189.2972,-0.3074591
7,192.8655,-42.40094,197.4714,102.3991,484,1,100,197.2983,8.265978
8,-118.1249,168.0198,205.3878,324.8912,400,2,325,205.3875,-0.3900602
9,-27.38288,-211.3092,213.0761,187.3836,316,2,185,212.8917,8.861877
10,168.6514,142.1392,220.5603,49.87585,43,1,50,220.5598,-0.4778982
11,-227.6664,9.415013,227.861,272.3681,169,1,270,227.6664,9.415033
12,166.5717,-165.7615,234.9958,134.8603,463,1,135,234.9951,-0.572949
13,-11.17716,241.7214,241.9797,357.3525,442,2,355,241.7757,9.932791
14,-159.4251,-191.0443,248.8258,219.8448,211,1,220,248.8249,-0.6741316
15,253.2634,34.07606,255.5455,82.33698,1,1,80,255.333,10.42036
16,-215.1871,149.7218,262.149,304.8292,127,1,305,262.1479,-0.781373
17,58.96151,-262.0949,268.6451,167.3217,274,2,165,268.4247,10.88271
18,136.7466,238.6388,275.042,29.8139,64,1,30,275.0406,-0.8933632
19,-268.0369,-85.51106,281.3466,252.3059,190,1,250,281.1188,11.31991
20,261.0493,-120.6114,287.5654,114.7981,43,0,115,287.5636,-1.013241
21,-113.3868,270.9346,293.7042,337.2906,106,1,335,293.4695,11.73862
22,-101.456,-282.0773,299.7682,199.7824,232,1,200,299.766,-1.138622
23,270.6579,142.2491,305.7621,62.27502,22,1,60,305.5211,12.13764
24,-301.3951,79.44781,311.6906,284.7673,148,1,285,311.688,-1.266134
25,171.7462,-267.1065,317.5573,147.2595,442,1,145,317.3104,12.51974
26,54.77142,318.6938,323.3661,9.751709,85,1,10,323.3631,-1.401296
27,-260.2108,-201.5207,329.1204,232.2439,358,0,230,328.868,12.88644
28,333.68,-27.64556,334.8232,94.73618,85,0,95,334.8197,-1.541864
29,-231.2106,249.9331,340.4774,317.2284,253,0,315,340.2199,13.2388
30,1.687521,-346.0818,346.0859,179.7206,253,1,180,346.0818,-1.687516
31,236.2696,260.4516,351.6509,42.21286,148,0,40,351.3887,13.57793
32,-355.6508,-32.96093,357.1749,264.7051,316,0,265,357.1702,-1.838471
33,288.8799,-219.2504,362.6601,127.1973,22,0,125,362.3934,13.90461
34,-65.88475,362.1643,368.1084,349.6895,211,0,350,368.1029,-1.994636
35,-198.9427,-316.1334,373.5218,212.1822,379,0,210,373.2509,14.22273
36,365.4273,100.1479,378.902,74.67398,106,0,75,378.8958,-2.155925
37,-341.8625,175.4387,384.2508,297.1662,274,0,295,383.9762,14.52408
38,135.4205,-365.2749,389.5696,159.6584,421,1,160,389.5627,-2.32232
39,148.8795,365.7177,394.8601,22.15067,169,0,20,394.5821,14.81811
40,-361.5755,-171.3537,400.1237,244.6433,337,0,245,400.1159,-2.490738
41,387.3686,-119.4301,405.3615,107.1351,64,0,105,405.0801,15.10217
42,-207.593,354.2273,410.575,329.6278,232,0,330,410.5663,-2.667137
43,-87.29105,-406.4985,415.7653,192.1196,400,0,190,415.4808,15.37719
44,343.1647,243.7681,420.9333,54.61182,127,0,55,420.9237,-2.851909
45,-422.8096,52.69396,426.0805,277.104,295,0,275,425.7932,15.6431
46,279.4957,-328.363,431.2078,139.5963,1,0,140,431.1971,-3.038518
47,15.90397,436.026,436.316,2.088928,190,0,0,436.026,15.90399`;
  return baseData;
}

function loadPathData()
{
  var pathData = `PathId,Host,Universe,ChannelStart,Fixture0,Fixture1,DistanceFt
0,192.168.0.220,1,1,46,33,9.126282
0,192.168.0.220,1,1,33,20,8.540823
0,192.168.0.220,1,1,20,41,10.52706
0,192.168.0.220,1,1,41,28,8.861145
0,192.168.0.220,1,1,28,36,10.97315
0,192.168.0.220,1,1,36,44,12.11127
0,192.168.0.220,1,1,44,31,9.015764
0,192.168.0.220,1,1,31,39,11.40114
0,192.168.0.220,1,1,39,47,12.53487
0,192.168.0.220,1,1,47,34,9.183673
0,192.168.0.220,1,1,34,42,11.82753
0,192.168.0.220,1,1,42,29,8.911237
0,192.168.0.220,1,1,29,37,11.11594
0,192.168.0.220,1,1,37,45,12.25274
0,192.168.0.220,1,1,45,32,9.070347
0,192.168.0.220,1,1,32,40,11.54328
0,192.168.0.220,1,1,40,27,8.813203
0,192.168.0.220,1,1,27,35,10.83008
0,192.168.0.220,1,1,35,43,11.96984
1,192.168.0.220,2,421,38,25,8.722804
1,192.168.0.220,2,421,25,12,8.456418
1,192.168.0.220,2,421,12,7,10.51096
1,192.168.0.220,2,421,7,15,8.120884
1,192.168.0.220,2,421,15,23,9.130214
1,192.168.0.220,2,421,23,10,8.500543
1,192.168.0.220,2,421,10,18,8.469753
1,192.168.0.220,2,421,18,26,9.548387
1,192.168.0.220,2,421,26,21,14.56739
1,192.168.0.220,2,421,21,16,13.19087
1,192.168.0.220,2,421,16,24,9.268465
1,192.168.0.220,2,421,24,11,8.474025
1,192.168.0.220,2,421,11,19,8.596158
1,192.168.0.220,2,421,19,14,12.61991
1,192.168.0.220,2,421,14,22,8.993604
1,192.168.0.220,2,421,22,30,10.1157
2,192.168.0.220,3,274,17,4,8.93296
2,192.168.0.220,3,274,4,9,9.552234
2,192.168.0.220,3,274,9,1,7.733861
2,192.168.0.220,3,274,1,6,8.581247
2,192.168.0.220,3,274,6,3,13.13368
2,192.168.0.220,3,274,3,8,9.227711
2,192.168.0.220,3,274,8,0,7.758987
2,192.168.0.220,3,274,0,13,9.708856
2,192.168.0.220,3,274,13,5,7.927378
2,192.168.0.220,3,274,5,2,12.48785`;
  return pathData;
}

async function importCSV() {

  const nodes: SceneNode[] = [];
  const lines: SceneNode[] = [];
  const portals: SceneNode[] = [];
  const booths: SceneNode[] = [];
  const centers: SceneNode[] = [];
  const pageNode = figma.currentPage;

  // make sure we are on the right page
  //if (pageNode.name != "Assets")
  //{
  //  console.error(`need to be on the Assets page to run`);
  //  return;
  //}

  // import the CSV data
  buildMaps();
  
  console.log(`finding node 'Wiring Plan'`);
  const planNode = pageNode.findOne(node => node.type === "FRAME" && node.name === "Base Layout") as FrameNode;
  if (planNode == null)
  {
    console.log(`planNode is null !`);
    return;
  }

  console.log(`finding node 'Map'`);
  const mapNode = planNode.findOne(node => node.type === "FRAME" && node.name === "Map") as FrameNode;

  if (mapNode == null)
  {
    console.log(`mapNode is null !`);
    return;
  }

  // first get rid of old lights & wiring path data
  console.log(`finding and deleting node 'Lights'`);
  const lightsGroup = mapNode.findOne(node => node.type === "GROUP" && node.name === "Lights") as FrameNode;
  if (lightsGroup != null)
  {
    lightsGroup.remove();
  }

  console.log(`finding and deleting node 'Wiring Paths'`);
  const pathsGroup = mapNode.findOne(node => node.type === "GROUP" && node.name === "Wiring Paths") as FrameNode;
  if (pathsGroup != null)
  {
    pathsGroup.remove();
  }

  console.log(`finding and deleting node 'Portals'`);
  const portalsGroup = mapNode.findOne(node => node.type === "GROUP" && node.name === "Portals") as FrameNode;
  if (portalsGroup != null)
  {
    portalsGroup.remove();
  }

  console.log(`finding and deleting node 'Booths'`);
  const boothsGroup = mapNode.findOne(node => node.type === "GROUP" && node.name === "Booths") as FrameNode;
  if (boothsGroup != null)
  {
    boothsGroup.remove();
  }

  console.log(`finding and deleting node 'Centers'`);
  const centersGroup = mapNode.findOne(node => node.type === "GROUP" && node.name === "Center Structure") as FrameNode;
  if (centersGroup != null)
  {
    centersGroup.remove();
  }


  // now we draw the wiring path lines

  var testLoopMax = 500;
  for (let path of pathList) {

    var cols = path.split(",");
    console.log(`path = ${path} cols.length = ${cols.length}`);

    const line = figma.createLine();
    var startNodeId = cols[4];
    var endNodeId = cols[5];

    console.log(`startNodeId = ${startNodeId} endNodeId = ${endNodeId}`);

    console.log(`(lightBaseMap.get(startNodeId) = ${lightBaseMap.get(startNodeId)} lightBaseMap.get(endNodeId) = ${lightBaseMap.get(endNodeId)}`);

    var startX = parseFloat(lightBaseMap.get(startNodeId)[1]);
    var startZ = -parseFloat(lightBaseMap.get(startNodeId)[2]);
    var endX = parseFloat(lightBaseMap.get(endNodeId)[1]);
    var endZ = -parseFloat(lightBaseMap.get(endNodeId)[2]);

    console.log(`processing path from node ${cols[4]} to ${cols[5]}`);

    var length = Math.sqrt((endX - startX)*(endX - startX) + (endZ - startZ)*(endZ - startZ));
    var rot = -Math.atan2(endZ - startZ, endX - startX) * 180 / Math.PI;

    line.resize(length,0);
    line.x = startX;
    line.y = startZ;
    line.rotation = rot;

    // add the length of the line
    var lineLength = figma.createText();
    lineLength.fontSize = 8;
    lineLength.characters = parseFloat(cols[6]).toFixed(2) + " (ft)";
    lineLength.x = ((startX + endX) / 2) + 10;
    lineLength.y = (startZ + endZ) / 2;

    // for now just put node in the main page; group later
    pageNode.appendChild(lineLength);
    lines.push(lineLength);

    // for now just put node in the main page; group later
    pageNode.appendChild(line);
    lines.push(line);

    testLoopMax -=1;
    if (testLoopMax == 0)
      break;
  }

  console.log(`done processing paths`);

  // and now we group the new lines together
  figma.currentPage.selection = lines;
  figma.viewport.scrollAndZoomIntoView(lines);
  console.log(`figma.group()`);
  const newLines = figma.group(lines,mapNode);
  newLines.name = "Wiring Paths";

  // now add new lights and group together
  console.log(`finding node 'Light Base'`);
  const base = pageNode.findOne(node => node.type === "COMPONENT" && node.name === "Light Base") as ComponentNode;
  if (base == null)
    {
      console.log(`could not find Light Base!`);
      return;
    }
  var testLoopMax = 500;
  for (let key of lightBaseMap.keys()) {
    const light = base.createInstance();
    console.log(`processing lightbase ${key}`);
    console.log(`    ${lightBaseMap.get(key)}`);
    console.log(`    ${lightBaseMap.get(key)[1]}`);
    console.log(`    ${lightBaseMap.get(key)[2]}`);

    light.x = parseFloat(lightBaseMap.get(key)[1]);
    light.y = -parseFloat(lightBaseMap.get(key)[2]);  // need to invert y because in unity, y axis runs bottom-to-top, and in figma, it runs top-to-bottom
    const id = light.findOne(node => node.type === "TEXT" && node.name === "#ID") as TextNode;
    if (id != null)
      id.characters = key;

    const univ = light.findOne(node => node.type === "TEXT" && node.name === "#Universe") as TextNode;
    if (univ != null)
      univ.characters = `P${lightBaseMap.get(key)[6]}`;

    var chanStart = parseInt(lightBaseMap.get(key)[5]);
    var chanEnd = chanStart+20;

    const range = light.findOne(node => node.type === "TEXT" && node.name === "#Range") as TextNode;
    if (range != null)
      range.characters = `${chanStart}-${chanEnd}`;


    const angle = light.findOne(node => node.type === "TEXT" && node.name === "#A") as TextNode;
    if (angle != null)
      angle.characters = `A=${parseFloat(lightBaseMap.get(key)[7]).toFixed(1)}°`;

    const radius1 = light.findOne(node => node.type === "TEXT" && node.name === "#R1") as TextNode;
    var R1I = Math.round(lightBaseMap.get(key)[8]);
    var R1F = Math.floor(R1I/12);
    R1I = R1I - (R1F*12);
    if (radius1 != null)
      radius1.characters = `R1=${R1F}'-${R1I}"`;

    const radius2 = light.findOne(node => node.type === "TEXT" && node.name === "#R2") as TextNode;
    var R2I = Math.round(lightBaseMap.get(key)[9]);
    if (radius2 != null)
      radius2.characters = `R2=${R2I}"`;

    light.name = `Light ${key}`;

    // for now just put light in the main page; group later
    pageNode.appendChild(light);
    nodes.push(light);

    testLoopMax -=1;
    if (testLoopMax == 0)
      break;
  }

  console.log(`done adding lights`);

  // and now we group the new lights together
  figma.currentPage.selection = nodes;
  figma.viewport.scrollAndZoomIntoView(nodes);
  const newLights = figma.group(nodes,mapNode);
  newLights.name = "Lights";

  // now we add the portals
  console.log(`finding node 'Portal Base'`);
  const portalBase = pageNode.findOne(node => node.type === "COMPONENT" && node.name === "Portal Base") as ComponentNode;
  for (let portal of portalList) {
    var cols = portal.split(",");
    console.log(`portal = ${portal} cols.length = ${cols.length}`);

    if (portalBase == null)
    {
      console.log(`could not find Portal Base!`);
      return;
    }
    const portalInstance = portalBase.createInstance();
    var portalId = parseInt(cols[0]);
    var portalX = parseFloat(cols[1]);
    var portalZ = parseFloat(cols[2]);
    var portalA = parseFloat(cols[3]);

    console.log(`processing portal ${portalId} (${portalX},${portalZ}) angle ${portalA}`);

    portalInstance.x = portalX;
    portalInstance.y = -portalZ;
    portalInstance.rotation = portalA;

    const id = portalInstance.findOne(node => node.type === "TEXT" && node.name === "#ID") as TextNode;
    if (id != null)
      id.characters = `Portal ${portalId}`;
    portalInstance.name = `Portal ${portalId}`;

    // for now just put node in the main page; group later
    pageNode.appendChild(portalInstance);
    portals.push(portalInstance);
  }

  // and now we group the new portals together
  if (portals.length > 0)
  {
    figma.currentPage.selection = portals;
    const newPortals = figma.group(portals,mapNode);
    newPortals.name = "Portals";  
  }
  console.log(`done processing portals`);

  // now we add the booths
  console.log(`finding node 'Booth Base'`);
  const boothBase = pageNode.findOne(node => node.type === "COMPONENT" && node.name === "Booth Base") as ComponentNode;
  for (let booth of boothList) {
    var cols = booth.split(",");
    console.log(`booth = ${booth} cols.length = ${cols.length}`);

    if (boothBase == null)
    {
      console.log(`could not find Booth Base!`);
      return;
    }
    const boothInstance = boothBase.createInstance();
    var boothId = parseInt(cols[0]);
    var boothX = parseFloat(cols[1]);
    var boothZ = parseFloat(cols[2]);
    var boothA = parseFloat(cols[3]);

    console.log(`processing booth ${boothId} (${boothX},${boothZ}) angle ${boothA}`);

    boothInstance.x = boothX;
    boothInstance.y = -boothZ;
    boothInstance.rotation = boothA;

    const id = boothInstance.findOne(node => node.type === "TEXT" && node.name === "#ID") as TextNode;
    if (id != null)
      id.characters = `Booth ${boothId}`;
    boothInstance.name = `Booth ${boothId}`;

    // for now just put node in the main page; group later
    pageNode.appendChild(boothInstance);
    booths.push(boothInstance);
  }

  // and now we group the new booths together
  if (booths.length > 0)
  {
    figma.currentPage.selection = booths;
    const newBooths = figma.group(booths,mapNode);
    newBooths.name = "Booths";
  }
  console.log(`done processing booths`);

  console.log(`adding center structure`);
  const centerBase = pageNode.findOne(node => node.type === "COMPONENT" && node.name === "Center Structure") as ComponentNode;
  if (centerBase != null)
  {
    const centerInstance = centerBase.createInstance();
    centerInstance.x = 0;
    centerInstance.y = 0;
  
    // for now just put node in the main page; group later
    pageNode.appendChild(centerInstance);
    centers.push(centerInstance);
    const newCent = figma.group(centers,mapNode);
    newCent.name = "Center Structure";
    console.log(`done adding center structure`);  
  }
}


async function exportTags() 
{

  const pageNode = figma.currentPage;

  // make sure we are on the right page
  if (pageNode.name != "Landmarks")
  {
    console.error(`need to be on the Landmarks page to run`);
    return;
  }

  var tagNode = pageNode.findOne(node => node.type === "FRAME" && node.name === "Arms / direction A") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "FRAME" && node.name === "Map") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "GROUP" && node.name === "Lights") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);

  for (let child of tagNode.children)
  {
    if (child.name.startsWith("CWArm"))
    {
      //console.log(`found child '${child.name}'`);
      // find the child lights
      var childGroup = child as FrameNode;
      var csvLightNumbers = "";
      for (let light of childGroup.children)
      {
        if (csvLightNumbers != "")
        {
          csvLightNumbers += ",";
        }
        csvLightNumbers += light.name.substring(6);
      }
      //var groupNum = child.name.substring(6);
      console.log(`${child.name},${csvLightNumbers}`);
    }
  }

  var tagNode = pageNode.findOne(node => node.type === "FRAME" && node.name === "Portal Placemen / Aisles") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "FRAME" && node.name === "Map") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "GROUP" && node.name === "Lights") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);

  for (let child of tagNode.children)
  {
    if (child.name.startsWith("Portal"))
    {
      //console.log(`found child '${child.name}'`);
      // find the child lights
      var childGroup = child as FrameNode;
      var csvLightNumbers = "";
      for (let light of childGroup.children)
      {
        if (csvLightNumbers != "")
        {
          csvLightNumbers += ",";
        }
        csvLightNumbers += light.name.substring(6);
      }
      //var groupNum = child.name.substring(6);
      console.log(`${child.name},${csvLightNumbers}`);
    }
  }

  var tagNode = pageNode.findOne(node => node.type === "FRAME" && node.name === "Arms / direction B") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "FRAME" && node.name === "Map") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);
  tagNode = tagNode.findOne(node => node.type === "GROUP" && node.name === "Lights") as FrameNode;
  console.log(`found tagNode '${tagNode.name}'`);

  console.log('exporting direction B!');
  for (let child of tagNode.children)
  {
    if (child.name.startsWith("Arm"))
    {
      //console.log(`found child '${child.name}'`);
      // find the child lights
      var childGroup = child as FrameNode;
      if (childGroup != null)
      {
        var csvLightNumbers = "";
        for (let light of childGroup.children)
        {
          if (csvLightNumbers != "")
          {
            csvLightNumbers += ",";
          }
          csvLightNumbers += light.name.substring(6);
        }
        //var groupNum = child.name.substring(6);
        console.log(`${child.name},${csvLightNumbers}`);
      }
    }
  }
  console.log('finished exporting direction B!');

}

async function numberRadials() {

  const pageNode = figma.currentPage;
  const nodes: SceneNode[] = [];

  // make sure we are on the right page
  if (pageNode.name != "Assets")
  {
    console.error(`need to be on the Assets page to run`);
    return;
  }
  
  console.log(`finding node 'Map'`);
  const mapNode = pageNode.findOne(node => node.type === "FRAME" && node.name === "Map") as FrameNode;
  if (mapNode == null)
  {
    console.log(`mapNode is null !`);
    return;
  }

  // first get rid of old numbers
  console.log(`finding and deleting node 'Numbers'`);
  const numbers = pageNode.findOne(node => node.type === "GROUP" && node.name === "Numbers") as GroupNode;
  if (numbers != null)
  {
    numbers.remove();
  }

  // now we draw the numbers
  for (let i=0; i < 360; i+=5) {
    const text = figma.createText();
    var x = 1560 * Math.cos((i-90) * Math.PI / 180);
    var y = 1560 * Math.sin((i-90) * Math.PI / 180);
    text.x = x;
    text.y = y;
    text.fontSize = 20;
    text.characters = i.toString() + "°";
    
    // for now just put node in the main page; group later
    pageNode.appendChild(text);
    nodes.push(text);
  }

  console.log(`done drawing numbers`);

  // and now we group the new lines together
  figma.currentPage.selection = nodes;
  figma.viewport.scrollAndZoomIntoView(nodes);
  console.log(`figma.group()`);
  const numberGroup = figma.group(nodes,mapNode);
  numberGroup.name = "Numbers";
}


// This file holds the main code for the plugins. It has access to the *document*.
// You can access browser APIs such as the network by creating a UI which contains
// a full browser environment (see documentation).

(async() => {
  await loadFonts();

  console.log(`figma.command = ${figma.command}`)
  console.log(`figma.currentPage.name = '${figma.currentPage.name}'`);

  if (figma.command == "import")
  {    
    await importCSV();
  }
  else if (figma.command == "export")
  {
    await exportTags();
  }
  else if (figma.command == "radials")
  {
    await numberRadials();
  }

  // Make sure to close the plugin when you're done. Otherwise the plugin will
  // keep running, which shows the cancel button at the bottom of the screen.
  figma.closePlugin();

})();


