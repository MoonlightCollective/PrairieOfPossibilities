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
0,118.3746,43.23011,126.0213,69.93793,0,0,70,126.0213,-0.1365247
1,-123.5534,51.00112,133.6658,292.4302,0,15,290,133.5456,5.667622
2,59.71822,-127.6145,140.8962,154.9224,0,6,155,140.896,-0.1908756
3,44.22615,140.9998,147.7731,17.41461,0,19,15,147.6419,6.225745
4,-133.5403,-77.38898,154.344,239.9069,0,12,240,154.3438,-0.2506761
5,156.8994,-34.49389,160.6463,102.3991,0,2,100,160.5056,6.724507
6,-95.88045,136.3795,166.7106,324.8912,0,17,325,166.7103,-0.3166086
7,-22.17631,-171.131,172.5619,187.3836,0,8,185,172.4125,7.176883
8,136.2768,114.8539,178.2211,49.87585,21,0,50,178.2207,-0.3861428
9,-183.5492,7.590571,183.7061,272.3681,0,14,270,183.5492,7.590587
10,133.9913,-133.3396,189.032,134.8603,21,6,135,189.0315,-0.4608883
11,-8.970741,194.0047,194.212,357.3525,21,19,355,194.0483,7.972019
12,-127.6661,-152.9864,199.2573,219.8448,0,11,220,199.2565,-0.5398344
13,202.3545,27.22638,204.1779,82.33698,21,2,80,204.0081,8.325748
14,-171.5452,119.3568,208.9828,304.8292,0,16,305,208.9819,-0.6228993
15,46.89782,-208.4696,213.6796,167.3217,21,8,165,213.5042,8.656082
16,108.5231,189.3855,218.2754,29.8139,42,0,30,218.2742,-0.7089787
17,-212.2375,-67.70952,222.7764,252.3059,0,13,250,222.596,8.96336
18,206.2395,-95.28785,227.1882,114.7981,0,5,115,227.1868,-0.8004872
19,-89.37854,213.5676,231.516,337.2906,0,18,335,231.331,9.253129
20,-79.79405,-221.8507,235.7644,199.7824,0,10,200,235.7627,-0.8955099
21,212.3905,111.6256,239.9375,62.27502,42,2,60,239.7484,9.524645
22,-235.9785,62.20397,244.0393,284.7673,21,15,285,244.0373,-0.9913327
23,134.1667,-208.6615,248.0733,147.2595,0,7,145,247.8804,9.780328
24,42.69073,248.4009,252.0427,9.751709,0,20,10,252.0403,-1.092213
25,-202.3609,-156.7188,255.9506,232.2439,21,12,230,255.7543,10.02151
26,258.9126,-21.45104,259.7997,94.73618,0,4,95,259.797,-1.196376
27,-178.9998,193.4945,263.5926,317.2284,21,17,315,263.3932,10.24929
28,1.303514,-267.3285,267.3316,179.7206,0,9,180,267.3285,-1.303511
29,182.0942,200.7314,271.0192,42.21286,0,1,40,270.8171,10.46457
30,-273.4852,-25.346,274.6572,264.7051,21,14,265,274.6535,-1.413732
31,221.6405,-168.2178,278.2476,127.1973,42,6,125,278.043,10.66819
32,-50.43573,277.242,281.7923,349.6895,42,19,350,281.7882,-1.526922
33,-151.9508,-241.4602,285.293,212.1822,21,11,210,285.0861,10.86322
34,278.4825,76.32009,288.7512,74.67398,0,3,75,288.7465,-1.642972
35,-259.9381,133.3963,292.1685,297.1662,21,16,295,291.9597,11.04353
36,102.7366,-277.1151,295.5463,159.6584,42,8,160,295.541,-1.761861
37,112.693,276.8268,298.8859,22.15067,63,0,20,298.6753,11.21643
38,-273.0756,-129.4128,302.1886,244.6433,21,13,245,302.1827,-1.881106
39,291.8972,-89.99522,305.4556,107.1351,21,5,105,305.2436,11.38007
40,-156.0774,266.3234,308.688,329.6278,21,18,330,308.6815,-2.005296
41,-65.48151,-304.9355,311.887,192.1196,21,10,190,311.6736,11.53522
42,256.8464,182.4516,315.0534,54.61182,63,2,55,315.0461,-2.134536
43,-315.7457,39.35078,318.1883,277.104,42,15,275,317.9738,11.68195
44,208.2521,-244.6631,321.2927,139.5963,21,7,140,321.2847,-2.26402
45,11.82337,324.1518,324.3673,2.088928,21,20,0,324.1518,11.82339
46,-229.8174,-233.2022,327.4131,224.5812,42,12,225,327.4043,-2.393456
47,329.9998,16.87078,330.4308,87.07336,21,4,85,330.2144,11.95479
48,-257.0362,212.3725,333.4212,309.5648,42,17,310,333.4116,-2.532938
49,46.47946,-333.1584,336.3849,172.0578,21,9,170,336.168,12.079
50,192.4389,279.4768,339.3229,34.55005,21,1,35,339.3124,-2.664651
51,-333.5208,-76.7401,342.2356,257.0423,42,14,255,342.0182,12.19631
52,300.278,-170.128,345.1237,119.5345,63,6,120,345.1123,-2.803891
53,-107.3797,331.0063,347.9878,342.0267,63,19,340,347.7701,12.30693
54,-145.5919,-319.1922,350.8286,204.519,42,11,205,350.8162,-2.945314
55,325.5604,138.1171,353.6466,67.0112,21,3,65,353.4287,12.41118
56,-335.9901,119.003,356.4422,289.5034,42,16,290,356.4288,-3.089213
57,168.6658,-317.1562,359.2161,151.9957,63,8,150,358.9982,12.5092
58,90.55563,350.4584,361.9688,14.48788,84,0,15,361.9543,-3.235305
59,-305.7947,-198.7364,364.7006,236.9801,42,13,235,364.4828,12.60134
60,362.4026,-60.46555,367.4122,99.47235,42,5,100,367.3966,-3.383714
61,-228.039,291.5049,370.1039,321.9646,42,18,320,369.8863,12.68768
62,-28.96743,-371.649,372.7762,184.4568,42,10,185,372.7594,-3.534138
63,274.3438,256.2864,375.4294,46.94901,84,2,45,375.2122,12.76845
64,-378.0461,-3.686851,378.0641,269.4412,63,15,270,378.0461,-3.686817
65,283.1963,-254.3963,380.6805,131.9335,42,7,130,380.4637,12.84377
66,-37.23036,381.4665,383.279,354.4257,42,20,355,383.2597,-3.841678
67,-231.7747,-308.4938,385.86,216.9179,63,12,215,385.6439,12.91398
68,381.8083,71.38343,388.4239,79.41016,42,4,80,388.4033,-3.998641
69,-331.9147,206.6179,390.971,301.9024,63,17,300,390.7554,12.97894
70,105.856,-378.996,393.5015,164.3946,42,9,165,393.4796,-4.157674
71,179.0902,353.2072,396.016,26.88684,42,1,25,395.8012,13.03906
72,-372.9821,-140.3503,398.5145,249.3791,63,14,250,398.4911,-4.318742
73,372.1349,-149.3807,400.9975,111.8713,84,6,110,400.7836,13.09427
74,-174.5576,363.7497,403.4652,334.3644,84,19,335,403.4404,-4.475674
75,-117.7012,-388.4788,405.9179,196.8557,63,11,195,405.705,13.14497
76,351.3001,208.1891,408.3558,59.34796,42,3,60,408.3293,-4.646986
77,-402.0382,84.29102,410.7794,281.8411,63,16,280,410.5673,13.19719
78,240.9227,-335.6801,413.1886,144.3324,84,8,145,413.1606,-4.81416
79,49.38438,412.6393,415.584,6.824646,105,0,5,415.3733,13.23255
80,-316.9543,-272.4613,417.9655,229.3169,63,13,230,417.9359,-4.983144
81,420.1239,-13.27623,420.3336,91.81,63,5,90,420.1239,13.27631
82,-302.5081,295.2191,422.6884,314.3013,63,18,315,422.657,-5.154081
83,23.77347,-424.3649,425.0302,176.7936,63,10,175,424.822,13.30283
84,270.6042,330.7707,427.3593,39.28668,105,2,40,427.3261,-5.320462
85,-425.2591,-61.44729,429.6756,261.778,84,15,260,429.4687,13.33173
86,356.9838,-243.2464,431.9795,124.2703,63,7,125,431.9444,-5.501837
87,-99.44306,422.7322,434.2711,346.7625,63,20,345,434.0656,13.35652
88,-213.3451,-380.868,436.5508,209.2556,84,12,210,436.5139,-5.67171
89,416.7382,137.4444,438.8185,71.74695,63,4,70,438.6146,13.37735
90,-402.1895,181.0816,441.0747,294.2392,84,17,295,441.0359,-5.856974
91,175.1237,-407.2637,443.3194,156.7322,63,9,155,443.1168,13.40109
92,146.7009,420.7091,445.5528,19.2236,63,1,20,445.5119,-6.037273
93,-394.3144,-212.1758,447.7749,241.7158,84,14,240,447.5742,13.40753
94,436.2215,-110.4464,449.9862,104.2081,105,6,105,449.9432,-6.219527
95,-248.2531,377.946,452.1867,326.7012,105,19,325,451.9873,13.42392
96,-72.58772,-448.5409,454.3764,189.1925,84,11,190,454.3313,-6.403346
97,358.2188,283.059,456.5557,51.68475,63,3,50,456.3584,13.42286
98,-457.5057,33.41932,458.7247,274.1779,84,16,275,458.6775,-6.582161
99,316.2574,-335.2532,460.8834,136.6701,105,8,135,460.6876,13.43203
100,-6.76951,462.9825,463.032,359.1623,126,0,0,462.9825,-6.76949
101,-309.17,-347.5597,465.1707,221.6545,84,13,220,464.9768,13.43099
102,464.8634,47.65553,467.2997,84.14676,84,5,85,467.2478,-6.958677
103,-376.6672,280.1357,469.419,306.639,84,18,305,469.2269,13.42624
104,88.92577,-463.0676,471.5288,169.1295,84,10,170,471.4743,-7.163968
105,248.34,403.301,473.6291,31.62344,126,2,30,473.439,13.41827
106,-457.5554,-130.2028,475.7202,254.1157,105,15,255,475.6635,-7.34216
107,427.1993,-213.9991,477.8022,116.6079,84,7,115,477.614,13.40676
108,-171.1886,448.3018,479.875,339.1001,84,20,340,479.8158,-7.536469
109,-177.3538,-448.1192,481.939,201.5923,105,12,200,481.7529,13.39228
110,435.3239,211.5267,483.9942,64.08459,84,4,65,483.9324,-7.732469
111,-465.8399,138.6676,486.0407,286.5768,105,17,285,485.8566,13.37435
112,250.8748,-418.6676,488.0786,149.069,84,9,150,488.0142,-7.930192
113,98.2253,480.1642,490.108,11.56128,84,1,10,489.9261,13.35337
114,-398.4107,-288.8944,492.1291,234.0535,105,14,235,492.0619,-8.129477
115,490.9207,-56.3302,494.1419,96.54572,126,6,95,493.9621,13.32915
116,-325.2534,374.6621,496.1466,319.038,126,19,320,496.0767,-8.330385
117,-13.30211,-497.9655,498.1431,181.5302,105,11,180,497.9655,13.30212
118,347.5613,359.6288,500.1317,44.0224,84,3,45,500.0589,-8.532992
119,-501.1837,-30.52527,502.1125,266.5146,105,16,265,501.937,13.27196
120,391.7099,-317.2781,504.0854,129.0069,126,8,130,504.0097,-8.737282
121,-74.80706,500.4909,506.0506,351.4991,147,0,350,505.8774,13.23878
122,-284.0108,-421.201,508.0083,213.9913,105,13,215,507.9295,-8.942908
123,495.834,119.1899,509.9584,76.48352,105,5,75,509.7875,13.2027
124,-447.8238,247.9852,511.9012,298.9758,105,18,300,511.8194,-9.150429
125,163.3149,-487.1921,513.8365,161.468,105,10,160,513.6678,13.16368
126,209.4532,471.3199,515.7646,23.96021,147,2,25,515.6797,-9.359343
127,-474.5772,-206.8205,517.6855,246.4524,126,15,245,517.5192,13.12192
128,491.4539,-168.6905,519.5994,108.9447,105,7,110,519.5112,-9.570019
129,-249.3458,458.0341,521.5061,331.4369,105,20,330,521.3421,13.07733
130,-125.9951,-508.0149,523.4061,193.9291,126,12,195,523.3146,-9.781954
131,437.641,290.5329,525.299,56.42136,105,4,55,525.1373,13.02993
132,-520.8185,81.68452,527.1852,278.9136,126,17,280,527.0905,-9.995696
133,330.0306,-413.5083,529.0646,141.4058,105,9,140,528.9053,12.97981
134,36.09373,529.7091,530.9373,3.898041,105,1,5,530.8391,-10.21084
135,-385.7789,-367.4973,532.8036,226.3903,126,14,225,532.6467,12.92697
136,534.5616,10.42749,534.6633,88.88251,147,6,90,534.5616,-10.42749
137,-402.6035,354.6272,536.5165,311.3747,147,19,310,536.3621,12.87163
138,57.51748,-535.2821,538.3635,173.8669,126,11,175,538.2581,-10.64569
139,320.2574,435.0352,540.204,36.35919,105,3,35,540.0521,12.81358
140,-531.8095,-104.8054,542.0383,258.8514,126,16,260,541.9293,-10.86537
141,464.4962,-282.9028,543.8665,121.3436,147,8,120,543.7169,12.7528
142,-151.9142,524.1164,545.6885,343.8358,168,0,345,545.5759,-11.08659
143,-242.824,-490.7113,547.5045,206.3281,126,13,205,547.3574,12.68978
144,512.2092,198.464,549.3143,68.82031,126,5,70,549.1979,-11.30926
145,-513.4283,200.3068,551.1183,291.3126,126,18,290,550.9738,12.62394
146,244.0745,-496.1292,552.9164,153.8048,126,10,155,552.7961,-11.53344
147,155.6604,532.4206,554.7087,16.297,168,2,15,554.5667,12.55575
148,-475.9519,-288.3691,556.4952,238.7892,147,15,240,556.371,-11.75904
149,547.4891,-109.2148,558.2761,101.2815,126,7,100,558.1364,12.48494
150,-330.977,451.787,560.0511,323.7737,126,20,325,559.9229,-11.98602`;
  return baseData;
}

function loadPathData()
{
  var pathData = `PathId,Host,Universe,ChannelStart,Fixture0,Fixture1,DistanceFt
0,192.168.0.220,1,0,0,8,6.15226
0,192.168.0.220,1,0,8,16,6.62761
0,192.168.0.220,1,0,16,37,7.295045
0,192.168.0.220,1,0,37,58,6.407284
0,192.168.0.220,1,0,58,79,6.21464
0,192.168.0.220,1,0,79,100,6.284731
0,192.168.0.220,1,0,100,121,6.4743
0,192.168.0.220,1,0,121,142,6.720447
1,192.168.0.220,2,0,29,50,6.618496
1,192.168.0.220,2,0,50,71,6.244079
1,192.168.0.220,2,0,71,92,6.239197
1,192.168.0.220,2,0,92,113,6.392697
1,192.168.0.220,2,0,113,134,6.622258
2,192.168.0.220,3,0,5,13,6.38768
2,192.168.0.220,3,0,13,21,7.082816
2,192.168.0.220,3,0,21,42,6.968497
2,192.168.0.220,3,0,42,63,6.323317
2,192.168.0.220,3,0,63,84,6.214838
2,192.168.0.220,3,0,84,105,6.322543
2,192.168.0.220,3,0,105,126,6.529181
2,192.168.0.220,3,0,126,147,6.78384
3,192.168.0.220,4,0,34,55,6.473873
3,192.168.0.220,4,0,55,76,6.220831
3,192.168.0.220,4,0,76,97,6.265738
3,192.168.0.220,4,0,97,118,6.442326
3,192.168.0.220,4,0,118,139,6.683113
4,192.168.0.221,1,0,26,47,6.72988
4,192.168.0.221,1,0,47,68,6.267055
4,192.168.0.221,1,0,68,89,6.227266
4,192.168.0.221,1,0,89,110,6.364835
4,192.168.0.221,1,0,110,131,6.586679
5,192.168.0.221,2,0,18,39,7.151757
5,192.168.0.221,2,0,39,60,6.369963
5,192.168.0.221,2,0,60,81,6.212986
5,192.168.0.221,2,0,81,102,6.299413
5,192.168.0.221,2,0,102,123,6.495908
5,192.168.0.221,2,0,123,144,6.745635
6,192.168.0.221,3,0,2,10,6.207781
6,192.168.0.221,3,0,10,31,7.861149
6,192.168.0.221,3,0,31,52,6.555052
6,192.168.0.221,3,0,52,73,6.232676
6,192.168.0.221,3,0,73,94,6.248872
6,192.168.0.221,3,0,94,115,6.412098
6,192.168.0.221,3,0,115,136,6.646383
7,192.168.0.221,4,0,23,44,6.864134
7,192.168.0.221,4,0,44,65,6.29779
7,192.168.0.221,4,0,65,86,6.218767
7,192.168.0.221,4,0,86,107,6.338598
7,192.168.0.221,4,0,107,128,6.55189
7,192.168.0.221,4,0,128,149,6.809558
8,192.168.0.222,1,0,7,15,6.54334
8,192.168.0.222,1,0,15,36,7.374019
8,192.168.0.222,1,0,36,57,6.427992
8,192.168.0.222,1,0,57,78,6.21612
8,192.168.0.222,1,0,78,99,6.277991
8,192.168.0.222,1,0,99,120,6.463675
8,192.168.0.222,1,0,120,141,6.707943
9,192.168.0.222,2,0,28,49,6.653339
9,192.168.0.222,2,0,49,70,6.250921
9,192.168.0.222,2,0,70,91,6.234466
9,192.168.0.222,2,0,91,112,6.383721
9,192.168.0.222,2,0,112,133,6.610315
10,192.168.0.222,3,0,20,41,7.025705
10,192.168.0.222,3,0,41,62,6.337698
10,192.168.0.222,3,0,62,83,6.214097
10,192.168.0.222,3,0,83,104,6.31506
10,192.168.0.222,3,0,104,125,6.516929
10,192.168.0.222,3,0,125,146,6.771049
11,192.168.0.222,4,0,12,33,7.645515
11,192.168.0.222,4,0,33,54,6.499303
11,192.168.0.222,4,0,54,75,6.224123
11,192.168.0.222,4,0,75,96,6.259816
11,192.168.0.222,4,0,96,117,6.432104
11,192.168.0.222,4,0,117,138,6.670802
12,192.168.0.223,1,0,4,25,8.751776
12,192.168.0.223,1,0,25,46,6.771863
12,192.168.0.223,1,0,46,67,6.276418
12,192.168.0.223,1,0,67,88,6.223651
12,192.168.0.223,1,0,88,109,6.356368
12,192.168.0.223,1,0,109,130,6.574991
13,192.168.0.223,2,0,17,38,7.220996
13,192.168.0.223,2,0,38,59,6.388082
13,192.168.0.223,2,0,59,80,6.213726
13,192.168.0.223,2,0,80,101,6.291727
13,192.168.0.223,2,0,101,122,6.485041
13,192.168.0.223,2,0,122,143,6.733016
14,192.168.0.223,3,0,9,30,7.981441
14,192.168.0.223,3,0,30,51,6.585773
14,192.168.0.223,3,0,51,72,6.238009
14,192.168.0.223,3,0,72,93,6.24387
14,192.168.0.223,3,0,93,114,6.40232
14,192.168.0.223,3,0,114,135,6.634281
15,192.168.0.223,4,0,1,22,9.415155
15,192.168.0.223,4,0,22,43,6.914691
15,192.168.0.223,4,0,43,64,6.310028
15,192.168.0.223,4,0,64,85,6.216765
15,192.168.0.223,4,0,85,106,6.33024
15,192.168.0.223,4,0,106,127,6.540483
15,192.168.0.223,4,0,127,148,6.796676
16,192.168.0.224,1,0,14,35,7.458407
16,192.168.0.224,1,0,35,56,6.450166
16,192.168.0.224,1,0,56,77,6.217843
16,192.168.0.224,1,0,77,98,6.271942
16,192.168.0.224,1,0,98,119,6.453185
16,192.168.0.224,1,0,119,140,6.695494
17,192.168.0.224,2,0,6,27,8.404258
17,192.168.0.224,2,0,27,48,6.690608
17,192.168.0.224,2,0,48,69,6.258272
17,192.168.0.224,2,0,69,90,6.230883
17,192.168.0.224,2,0,90,111,6.37395
17,192.168.0.224,2,0,111,132,6.598457
18,192.168.0.224,3,0,19,40,7.086713
18,192.168.0.224,3,0,40,61,6.353358
18,192.168.0.224,3,0,61,82,6.213467
18,192.168.0.224,3,0,82,103,6.306455
18,192.168.0.224,3,0,103,124,6.506888
18,192.168.0.224,3,0,124,145,6.758318
19,192.168.0.224,4,0,3,11,6.258006
19,192.168.0.224,4,0,11,32,7.749461
19,192.168.0.224,4,0,32,53,6.526227
19,192.168.0.224,4,0,53,74,6.227742
19,192.168.0.224,4,0,74,95,6.254191
19,192.168.0.224,4,0,95,116,6.422522
19,192.168.0.224,4,0,116,137,6.658554
20,192.168.0.225,1,0,24,45,6.816533
20,192.168.0.225,1,0,45,66,6.286693
20,192.168.0.225,1,0,66,87,6.221196
20,192.168.0.225,1,0,87,108,6.347149
20,192.168.0.225,1,0,108,129,6.563394
20,192.168.0.225,1,0,129,150,6.822486`;
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
  if (lines.length > 0)
  {
    figma.viewport.scrollAndZoomIntoView(lines);
    console.log(`figma.group()`);
    const newLines = figma.group(lines,mapNode);
    newLines.name = "Wiring Paths";
  }

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


