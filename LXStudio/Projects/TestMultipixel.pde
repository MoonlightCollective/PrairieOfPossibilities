{
  "version": "0.2.1",
  "timestamp": 1623130389449,
  "model": {
    "id": 2,
    "class": "heronarts.lx.structure.LXStructure",
    "internal": {
      "modulationColor": 0
    },
    "parameters": {
      "label": "LX",
      "syncModelFile": false
    },
    "children": {},
    "output": {
      "id": 3,
      "class": "heronarts.lx.structure.LXStructure$Output",
      "internal": {
        "modulationColor": 0
      },
      "parameters": {
        "label": "Output",
        "enabled": true,
        "brightness": 1.0,
        "fps": 0.0,
        "gamma": 1.0,
        "gammaMode": 1
      },
      "children": {}
    },
    "fixtures": [
      {
        "jsonFixtureType": "ChildTest",
        "jsonParameters": {},
        "id": 457,
        "class": "heronarts.lx.structure.JsonFixture",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Child Test 1",
          "x": 0.0,
          "y": 0.0,
          "z": 0.0,
          "yaw": 0.0,
          "pitch": 0.0,
          "roll": 0.0,
          "selected": true,
          "enabled": true,
          "brightness": 1.0,
          "identify": false,
          "mute": false,
          "solo": false,
          "fixtureType": "ChildTest",
          "scale": 1.0
        },
        "children": {}
      }
    ]
  },
  "engine": {
    "id": 1,
    "class": "heronarts.lx.LXEngine",
    "internal": {
      "modulationColor": 0
    },
    "parameters": {
      "label": "Engine",
      "multithreaded": true,
      "channelMultithreaded": false,
      "networkMultithreaded": false,
      "framesPerSecond": 60.0,
      "speed": 1.0
    },
    "children": {
      "palette": {
        "id": 5,
        "class": "heronarts.lx.color.LXPalette",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Color Palette",
          "transitionEnabled": false,
          "transitionTimeSecs": 5.0,
          "transitionMode": 1,
          "autoCycleEnabled": false,
          "autoCycleMode": 0,
          "autoCycleTimeSecs": 60.0,
          "autoCycleCursor": -1,
          "triggerSwatchCycle": false
        },
        "children": {
          "swatch": {
            "id": 6,
            "class": "heronarts.lx.color.LXSwatch",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Swatch",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "colors": [
              {
                "id": 7,
                "class": "heronarts.lx.color.LXDynamicColor",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "LX",
                  "mode": 0,
                  "period": 30.0,
                  "primary/brightness": 100.0,
                  "primary/saturation": 100.0,
                  "primary/hue": 0.0,
                  "secondary/brightness": 100.0,
                  "secondary/saturation": 100.0,
                  "secondary/hue": 120.0
                },
                "children": {}
              }
            ]
          }
        },
        "swatches": []
      },
      "tempo": {
        "id": 9,
        "class": "heronarts.lx.Tempo",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Tempo",
          "clockSource": 0,
          "period": 500.0,
          "bpm": 120.0,
          "tap": false,
          "nudgeUp": false,
          "nudgeDown": false,
          "beatsPerMeasure": 4,
          "trigger": false,
          "enabled": false
        },
        "children": {
          "nudge": {
            "id": 10,
            "class": "heronarts.lx.modulator.LinearEnvelope",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LENV",
              "running": false,
              "trigger": false,
              "loop": false,
              "tempoSync": false,
              "tempoMultiplier": 5,
              "tempoLock": true
            },
            "children": {},
            "basis": 0.0
          }
        }
      },
      "clips": {
        "id": 11,
        "class": "heronarts.lx.clip.LXClipEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "LX",
          "focusedClip": 0.0
        },
        "children": {}
      },
      "mixer": {
        "id": 12,
        "class": "heronarts.lx.mixer.LXMixerEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Mixer",
          "scene-1": false,
          "scene-2": false,
          "scene-3": false,
          "scene-4": false,
          "scene-5": false,
          "crossfader": 0.0,
          "crossfaderBlendMode": 0,
          "focusedChannel": 1,
          "cueA": false,
          "cueB": false,
          "viewCondensed": false
        },
        "children": {
          "master": {
            "id": 20,
            "class": "heronarts.lx.mixer.LXMasterBus",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Master",
              "arm": false,
              "selected": false
            },
            "children": {},
            "effects": [],
            "clips": []
          }
        },
        "channels": [
          {
            "id": 300,
            "class": "heronarts.lx.mixer.LXChannel",
            "internal": {
              "modulationColor": 0,
              "controlsExpanded": true
            },
            "parameters": {
              "label": "Channel-2",
              "arm": false,
              "selected": false,
              "enabled": true,
              "cue": false,
              "fader": 0.0,
              "crossfadeGroup": 1,
              "blendMode": 0,
              "midiMonitor": false,
              "midiChannel": 16,
              "autoCycleEnabled": false,
              "autoCycleMode": 0,
              "autoCycleTimeSecs": 60.0,
              "transitionEnabled": false,
              "transitionTimeSecs": 5.0,
              "transitionBlendMode": 0,
              "focusedPattern": 1,
              "triggerPatternCycle": false
            },
            "children": {},
            "effects": [
              {
                "id": 648,
                "class": "heronarts.lx.effect.color.ColorizeEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Colorize",
                  "enabled": false,
                  "source": 0,
                  "gradientHue": 0.0,
                  "gradientSaturation": 0.0,
                  "gradientBrightness": 0.0,
                  "colorMode": 0,
                  "blendMode": 0,
                  "color1/brightness": 56.666683197021484,
                  "color1/saturation": 100.0,
                  "color1/hue": 228.0,
                  "color2/brightness": 100.0,
                  "color2/saturation": 76.66666412353516,
                  "color2/hue": 264.0,
                  "paletteIndex": 1,
                  "paletteStops": 5
                },
                "children": {
                  "modulation": {
                    "id": 649,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              },
              {
                "id": 651,
                "class": "heronarts.lx.effect.HueSaturationEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Hue + Saturation",
                  "enabled": true,
                  "hue": 39.2727367579937,
                  "saturation": 100.0,
                  "brightness": 0.0
                },
                "children": {
                  "modulation": {
                    "id": 652,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ],
            "clips": [
              {
                "id": 647,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-1",
                  "running": false,
                  "trigger": false,
                  "length": 175583.0,
                  "loop": false
                },
                "children": {},
                "index": 0,
                "parameterLanes": [
                  {
                    "laneType": "midiNote",
                    "events": []
                  },
                  {
                    "laneType": "pattern",
                    "events": [
                      {
                        "cursor": 0.0,
                        "patternIndex": 0
                      }
                    ]
                  },
                  {
                    "laneType": "parameter",
                    "events": [
                      {
                        "cursor": 153055.0,
                        "normalized": 0.7015094286203385
                      },
                      {
                        "cursor": 153152.0,
                        "normalized": 0.6920754662156106
                      },
                      {
                        "cursor": 153184.0,
                        "normalized": 0.6826415038108826
                      },
                      {
                        "cursor": 153856.0,
                        "normalized": 0.6732075414061547
                      },
                      {
                        "cursor": 154303.0,
                        "normalized": 0.6637735790014268
                      },
                      {
                        "cursor": 154848.0,
                        "normalized": 0.6543396165966988
                      },
                      {
                        "cursor": 154912.0,
                        "normalized": 0.6449056541919709
                      },
                      {
                        "cursor": 155263.0,
                        "normalized": 0.6354716917872429
                      },
                      {
                        "cursor": 155456.0,
                        "normalized": 0.626037729382515
                      },
                      {
                        "cursor": 155519.0,
                        "normalized": 0.6166037669777871
                      },
                      {
                        "cursor": 155615.0,
                        "normalized": 0.6071698045730591
                      },
                      {
                        "cursor": 155679.0,
                        "normalized": 0.5977358421683312
                      },
                      {
                        "cursor": 155776.0,
                        "normalized": 0.5883018797636033
                      },
                      {
                        "cursor": 155871.0,
                        "normalized": 0.5788679173588753
                      },
                      {
                        "cursor": 155935.0,
                        "normalized": 0.5694339549541474
                      },
                      {
                        "cursor": 156063.0,
                        "normalized": 0.5599999925494195
                      },
                      {
                        "cursor": 156192.0,
                        "normalized": 0.5505660301446915
                      }
                    ],
                    "path": "/pattern/1/motionSpeed",
                    "componentId": 312,
                    "parameterPath": "motionSpeed"
                  },
                  {
                    "laneType": "parameter",
                    "events": [
                      {
                        "cursor": 163871.0,
                        "normalized": 0.9857142856344581
                      },
                      {
                        "cursor": 163903.0,
                        "normalized": 0.9714285712689161
                      },
                      {
                        "cursor": 163903.0,
                        "normalized": 0.9571428569033742
                      },
                      {
                        "cursor": 163937.0,
                        "normalized": 0.9428571425378323
                      },
                      {
                        "cursor": 163968.0,
                        "normalized": 0.9285714281722903
                      },
                      {
                        "cursor": 163968.0,
                        "normalized": 0.9142857138067484
                      },
                      {
                        "cursor": 164000.0,
                        "normalized": 0.8999999994412065
                      },
                      {
                        "cursor": 164031.0,
                        "normalized": 0.8857142850756645
                      },
                      {
                        "cursor": 164064.0,
                        "normalized": 0.8714285707101226
                      },
                      {
                        "cursor": 164096.0,
                        "normalized": 0.8571428563445807
                      },
                      {
                        "cursor": 164127.0,
                        "normalized": 0.8428571419790387
                      },
                      {
                        "cursor": 164224.0,
                        "normalized": 0.8285714276134968
                      },
                      {
                        "cursor": 164287.0,
                        "normalized": 0.8142857132479548
                      },
                      {
                        "cursor": 164383.0,
                        "normalized": 0.7999999988824129
                      },
                      {
                        "cursor": 164448.0,
                        "normalized": 0.785714284516871
                      },
                      {
                        "cursor": 164511.0,
                        "normalized": 0.771428570151329
                      },
                      {
                        "cursor": 164608.0,
                        "normalized": 0.7571428557857871
                      },
                      {
                        "cursor": 164736.0,
                        "normalized": 0.7428571414202452
                      },
                      {
                        "cursor": 164767.0,
                        "normalized": 0.7285714270547032
                      },
                      {
                        "cursor": 164864.0,
                        "normalized": 0.7142857126891613
                      },
                      {
                        "cursor": 165024.0,
                        "normalized": 0.6999999983236194
                      },
                      {
                        "cursor": 165151.0,
                        "normalized": 0.6857142839580774
                      },
                      {
                        "cursor": 165408.0,
                        "normalized": 0.6714285695925355
                      },
                      {
                        "cursor": 165471.0,
                        "normalized": 0.6571428552269936
                      },
                      {
                        "cursor": 165856.0,
                        "normalized": 0.6428571408614516
                      },
                      {
                        "cursor": 165887.0,
                        "normalized": 0.6285714264959097
                      },
                      {
                        "cursor": 165920.0,
                        "normalized": 0.6142857121303678
                      },
                      {
                        "cursor": 166016.0,
                        "normalized": 0.5999999977648258
                      },
                      {
                        "cursor": 166047.0,
                        "normalized": 0.5857142833992839
                      },
                      {
                        "cursor": 166111.0,
                        "normalized": 0.571428569033742
                      },
                      {
                        "cursor": 166111.0,
                        "normalized": 0.5571428546682
                      },
                      {
                        "cursor": 166144.0,
                        "normalized": 0.5428571403026581
                      },
                      {
                        "cursor": 166240.0,
                        "normalized": 0.5285714259371161
                      },
                      {
                        "cursor": 166400.0,
                        "normalized": 0.5142857115715742
                      },
                      {
                        "cursor": 166400.0,
                        "normalized": 0.4999999972060323
                      },
                      {
                        "cursor": 166463.0,
                        "normalized": 0.48571428284049034
                      },
                      {
                        "cursor": 166496.0,
                        "normalized": 0.4714285684749484
                      },
                      {
                        "cursor": 166592.0,
                        "normalized": 0.45714285410940647
                      },
                      {
                        "cursor": 166655.0,
                        "normalized": 0.44285713974386454
                      },
                      {
                        "cursor": 166687.0,
                        "normalized": 0.4285714253783226
                      },
                      {
                        "cursor": 166720.0,
                        "normalized": 0.41428571101278067
                      },
                      {
                        "cursor": 168287.0,
                        "normalized": 0.39999999664723873
                      },
                      {
                        "cursor": 168447.0,
                        "normalized": 0.3857142822816968
                      },
                      {
                        "cursor": 168479.0,
                        "normalized": 0.37142856791615486
                      },
                      {
                        "cursor": 168639.0,
                        "normalized": 0.3571428535506129
                      },
                      {
                        "cursor": 168927.0,
                        "normalized": 0.342857139185071
                      },
                      {
                        "cursor": 169024.0,
                        "normalized": 0.32857142481952906
                      },
                      {
                        "cursor": 169055.0,
                        "normalized": 0.3142857104539871
                      },
                      {
                        "cursor": 169119.0,
                        "normalized": 0.2999999960884452
                      },
                      {
                        "cursor": 169375.0,
                        "normalized": 0.28571428172290325
                      },
                      {
                        "cursor": 169375.0,
                        "normalized": 0.2714285673573613
                      },
                      {
                        "cursor": 169375.0,
                        "normalized": 0.2571428529918194
                      },
                      {
                        "cursor": 169471.0,
                        "normalized": 0.24285713862627745
                      },
                      {
                        "cursor": 169503.0,
                        "normalized": 0.2285714242607355
                      },
                      {
                        "cursor": 169600.0,
                        "normalized": 0.21428570989519358
                      },
                      {
                        "cursor": 169600.0,
                        "normalized": 0.19999999552965164
                      },
                      {
                        "cursor": 169728.0,
                        "normalized": 0.1857142811641097
                      },
                      {
                        "cursor": 169759.0,
                        "normalized": 0.17142856679856777
                      },
                      {
                        "cursor": 169823.0,
                        "normalized": 0.15714285243302584
                      },
                      {
                        "cursor": 169823.0,
                        "normalized": 0.1428571380674839
                      },
                      {
                        "cursor": 169823.0,
                        "normalized": 0.12857142370194197
                      },
                      {
                        "cursor": 169855.0,
                        "normalized": 0.11428570933640003
                      },
                      {
                        "cursor": 169951.0,
                        "normalized": 0.08571428060531616
                      },
                      {
                        "cursor": 170016.0,
                        "normalized": 0.07142856623977423
                      },
                      {
                        "cursor": 170143.0,
                        "normalized": 0.05714285187423229
                      },
                      {
                        "cursor": 170176.0,
                        "normalized": 0.04285713750869036
                      },
                      {
                        "cursor": 170432.0,
                        "normalized": 0.028571423143148422
                      },
                      {
                        "cursor": 170463.0,
                        "normalized": 0.014285708777606487
                      },
                      {
                        "cursor": 170527.0,
                        "normalized": 0.0
                      }
                    ],
                    "path": "/fader",
                    "componentId": 300,
                    "parameterPath": "fader"
                  }
                ]
              }
            ],
            "patternIndex": 1,
            "patterns": [
              {
                "id": 312,
                "class": "heronarts.lx.pattern.texture.NoisePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Noise",
                  "midpoint": 19.999999552965164,
                  "contrast": 76.0499973267317,
                  "xOffset": 0.04761906713247299,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "scale": 0.19999999552965164,
                  "minScale": 1.0,
                  "maxScale": 10.0,
                  "xScale": 1.0,
                  "yScale": 1.0,
                  "zScale": 1.0,
                  "motion": true,
                  "motionSpeed": 0.30867923319339763,
                  "motionSpeedRange": 128.0,
                  "xMotion": 1.0,
                  "yMotion": 0.0,
                  "zMotion": 0.0,
                  "algorithm": 1,
                  "seed": 0,
                  "octaves": 3,
                  "lacunarity": 0.6800000742077827,
                  "gain": 0.5400000102818012,
                  "ridgeOffset": 0.9,
                  "xMode": 0,
                  "yMode": 0,
                  "zMode": 0
                },
                "children": {
                  "modulation": {
                    "id": 313,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              },
              {
                "id": 321,
                "class": "heronarts.lx.pattern.texture.SparklePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Sparkle",
                  "density": 275.56000697553185,
                  "speed": 0.10999999940395355,
                  "variation": 66.99999887496233,
                  "duration": 21.00000143051147,
                  "sharp": 0.019999977201223373,
                  "waveshape": 1,
                  "minInterval": 13.27799981702119,
                  "maxInterval": 23.460999611727892,
                  "baseLevel": 32.0000008046627,
                  "minLevel": 86.00000031292439,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 322,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ]
          },
          {
            "id": 330,
            "class": "heronarts.lx.mixer.LXChannel",
            "internal": {
              "modulationColor": 0,
              "controlsExpanded": true
            },
            "parameters": {
              "label": "Channel-3",
              "arm": false,
              "selected": true,
              "enabled": true,
              "cue": false,
              "fader": 1.0,
              "crossfadeGroup": 0,
              "blendMode": 0,
              "midiMonitor": false,
              "midiChannel": 16,
              "autoCycleEnabled": false,
              "autoCycleMode": 0,
              "autoCycleTimeSecs": 60.0,
              "transitionEnabled": false,
              "transitionTimeSecs": 5.0,
              "transitionBlendMode": 0,
              "focusedPattern": 0,
              "triggerPatternCycle": false
            },
            "children": {},
            "effects": [
              {
                "id": 472,
                "class": "heronarts.lx.effect.BlurEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Blur",
                  "enabled": false,
                  "level": 0.29000001586973667,
                  "decay": 3.5685465713808484,
                  "mode": 0
                },
                "children": {
                  "modulation": {
                    "id": 473,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              },
              {
                "id": 832,
                "class": "heronarts.lx.effect.color.ColorizeEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Colorize",
                  "enabled": true,
                  "source": 0,
                  "gradientHue": 0.0,
                  "gradientSaturation": 0.0,
                  "gradientBrightness": 0.0,
                  "colorMode": 0,
                  "blendMode": 1,
                  "color1/brightness": 100.0,
                  "color1/saturation": 100.0,
                  "color1/hue": 0.0,
                  "color2/brightness": 100.0,
                  "color2/saturation": 100.0,
                  "color2/hue": 279.0,
                  "paletteIndex": 1,
                  "paletteStops": 5
                },
                "children": {
                  "modulation": {
                    "id": 833,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ],
            "clips": [
              {
                "id": 627,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-1",
                  "running": false,
                  "trigger": false,
                  "length": 177663.0,
                  "loop": false
                },
                "children": {},
                "index": 0,
                "parameterLanes": [
                  {
                    "laneType": "midiNote",
                    "events": []
                  },
                  {
                    "laneType": "pattern",
                    "events": [
                      {
                        "cursor": 0.0,
                        "patternIndex": 0
                      }
                    ]
                  }
                ]
              }
            ],
            "patternIndex": 0,
            "patterns": [
              {
                "id": 826,
                "class": "heronarts.lx.pattern.texture.NoisePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Noise",
                  "midpoint": 62.99999859184027,
                  "contrast": 54.449997565895345,
                  "xOffset": 0.571428582072258,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "scale": 0.26000000536441803,
                  "minScale": 1.0,
                  "maxScale": 10.0,
                  "xScale": 1.0,
                  "yScale": 1.0,
                  "zScale": 1.0,
                  "motion": true,
                  "motionSpeed": 0.264150932431221,
                  "motionSpeedRange": 128.0,
                  "xMotion": 0.5238095335662365,
                  "yMotion": 0.0,
                  "zMotion": -0.04761906713247299,
                  "algorithm": 0,
                  "seed": 0,
                  "octaves": 3,
                  "lacunarity": 2.0,
                  "gain": 0.5,
                  "ridgeOffset": 0.9,
                  "xMode": 0,
                  "yMode": 0,
                  "zMode": 0
                },
                "children": {
                  "modulation": {
                    "id": 827,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              },
              {
                "id": 835,
                "class": "LXStudio$PlanePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Plane",
                  "axis": 0,
                  "pos": 0.48000001162290573,
                  "width": 1.0
                },
                "children": {
                  "modulation": {
                    "id": 836,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ]
          },
          {
            "id": 589,
            "class": "heronarts.lx.mixer.LXChannel",
            "internal": {
              "modulationColor": 0,
              "controlsExpanded": true
            },
            "parameters": {
              "label": "Channel-3",
              "arm": false,
              "selected": false,
              "enabled": true,
              "cue": false,
              "fader": 0.0,
              "crossfadeGroup": 1,
              "blendMode": 0,
              "midiMonitor": false,
              "midiChannel": 16,
              "autoCycleEnabled": false,
              "autoCycleMode": 0,
              "autoCycleTimeSecs": 60.0,
              "transitionEnabled": false,
              "transitionTimeSecs": 5.0,
              "transitionBlendMode": 0,
              "focusedPattern": 0,
              "triggerPatternCycle": false
            },
            "children": {},
            "effects": [
              {
                "id": 658,
                "class": "heronarts.lx.effect.SparkleEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Sparkle",
                  "enabled": true,
                  "amount": 0.41000001318752766,
                  "density": 50.0,
                  "speed": 0.5099999979138374,
                  "variation": 25.0,
                  "duration": 83.00000037997961,
                  "sharp": 0.0,
                  "waveshape": 1,
                  "minInterval": 3.3959999464452264,
                  "maxInterval": 1.0,
                  "minLevel": 75.0,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 659,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ],
            "clips": [
              {
                "id": 637,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-1",
                  "running": false,
                  "trigger": false,
                  "length": 152607.0,
                  "loop": false
                },
                "children": {},
                "index": 0,
                "parameterLanes": [
                  {
                    "laneType": "midiNote",
                    "events": []
                  },
                  {
                    "laneType": "pattern",
                    "events": [
                      {
                        "cursor": 0.0,
                        "patternIndex": 0
                      }
                    ]
                  },
                  {
                    "laneType": "parameter",
                    "events": [
                      {
                        "cursor": 51136.0,
                        "normalized": 0.014285714365541935
                      },
                      {
                        "cursor": 51136.0,
                        "normalized": 0.057142858393490314
                      },
                      {
                        "cursor": 51167.0,
                        "normalized": 0.08571428712457418
                      },
                      {
                        "cursor": 51167.0,
                        "normalized": 0.10000000149011612
                      },
                      {
                        "cursor": 51167.0,
                        "normalized": 0.1428571455180645
                      },
                      {
                        "cursor": 51200.0,
                        "normalized": 0.15714285988360643
                      },
                      {
                        "cursor": 51200.0,
                        "normalized": 0.17142857424914837
                      },
                      {
                        "cursor": 51231.0,
                        "normalized": 0.20000000298023224
                      },
                      {
                        "cursor": 51231.0,
                        "normalized": 0.2285714317113161
                      },
                      {
                        "cursor": 51231.0,
                        "normalized": 0.24285714607685804
                      },
                      {
                        "cursor": 51263.0,
                        "normalized": 0.2714285748079419
                      },
                      {
                        "cursor": 51296.0,
                        "normalized": 0.3000000035390258
                      },
                      {
                        "cursor": 51296.0,
                        "normalized": 0.3142857179045677
                      },
                      {
                        "cursor": 51328.0,
                        "normalized": 0.3428571466356516
                      },
                      {
                        "cursor": 51360.0,
                        "normalized": 0.3571428610011935
                      },
                      {
                        "cursor": 51360.0,
                        "normalized": 0.37142857536673546
                      },
                      {
                        "cursor": 51392.0,
                        "normalized": 0.40000000409781933
                      },
                      {
                        "cursor": 51423.0,
                        "normalized": 0.41428571846336126
                      },
                      {
                        "cursor": 51488.0,
                        "normalized": 0.4285714328289032
                      },
                      {
                        "cursor": 51488.0,
                        "normalized": 0.44285714719444513
                      },
                      {
                        "cursor": 51519.0,
                        "normalized": 0.45714286155998707
                      },
                      {
                        "cursor": 51552.0,
                        "normalized": 0.471428575925529
                      },
                      {
                        "cursor": 51583.0,
                        "normalized": 0.48571429029107094
                      },
                      {
                        "cursor": 51583.0,
                        "normalized": 0.5000000046566129
                      },
                      {
                        "cursor": 51615.0,
                        "normalized": 0.5142857190221548
                      },
                      {
                        "cursor": 51615.0,
                        "normalized": 0.5285714333876967
                      },
                      {
                        "cursor": 51648.0,
                        "normalized": 0.5428571477532387
                      },
                      {
                        "cursor": 51679.0,
                        "normalized": 0.5571428621187806
                      },
                      {
                        "cursor": 51711.0,
                        "normalized": 0.5857142908498645
                      },
                      {
                        "cursor": 51711.0,
                        "normalized": 0.6000000052154064
                      },
                      {
                        "cursor": 51711.0,
                        "normalized": 0.6285714339464903
                      },
                      {
                        "cursor": 51743.0,
                        "normalized": 0.6428571483120322
                      },
                      {
                        "cursor": 51743.0,
                        "normalized": 0.6571428626775742
                      },
                      {
                        "cursor": 51775.0,
                        "normalized": 0.685714291408658
                      },
                      {
                        "cursor": 51807.0,
                        "normalized": 0.7000000057742
                      },
                      {
                        "cursor": 51840.0,
                        "normalized": 0.7142857201397419
                      },
                      {
                        "cursor": 51872.0,
                        "normalized": 0.7285714345052838
                      },
                      {
                        "cursor": 51872.0,
                        "normalized": 0.7428571488708258
                      },
                      {
                        "cursor": 51904.0,
                        "normalized": 0.7571428632363677
                      },
                      {
                        "cursor": 51904.0,
                        "normalized": 0.7714285776019096
                      },
                      {
                        "cursor": 51904.0,
                        "normalized": 0.7857142919674516
                      },
                      {
                        "cursor": 51937.0,
                        "normalized": 0.8000000063329935
                      },
                      {
                        "cursor": 51937.0,
                        "normalized": 0.8142857206985354
                      },
                      {
                        "cursor": 51967.0,
                        "normalized": 0.8285714350640774
                      },
                      {
                        "cursor": 51967.0,
                        "normalized": 0.8428571494296193
                      },
                      {
                        "cursor": 52000.0,
                        "normalized": 0.8571428637951612
                      },
                      {
                        "cursor": 52032.0,
                        "normalized": 0.8714285781607032
                      },
                      {
                        "cursor": 52064.0,
                        "normalized": 0.8857142925262451
                      },
                      {
                        "cursor": 52064.0,
                        "normalized": 0.900000006891787
                      },
                      {
                        "cursor": 52096.0,
                        "normalized": 0.914285721257329
                      },
                      {
                        "cursor": 52096.0,
                        "normalized": 0.9285714356228709
                      },
                      {
                        "cursor": 52192.0,
                        "normalized": 0.9428571499884129
                      },
                      {
                        "cursor": 52223.0,
                        "normalized": 0.9571428643539548
                      },
                      {
                        "cursor": 52223.0,
                        "normalized": 0.9714285787194967
                      },
                      {
                        "cursor": 52255.0,
                        "normalized": 0.9857142930850387
                      },
                      {
                        "cursor": 52320.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 58783.0,
                        "normalized": 0.9857142856344581
                      },
                      {
                        "cursor": 58815.0,
                        "normalized": 0.9714285712689161
                      },
                      {
                        "cursor": 58815.0,
                        "normalized": 0.9428571425378323
                      },
                      {
                        "cursor": 58847.0,
                        "normalized": 0.9285714281722903
                      },
                      {
                        "cursor": 58847.0,
                        "normalized": 0.8999999994412065
                      },
                      {
                        "cursor": 58879.0,
                        "normalized": 0.8571428554132581
                      },
                      {
                        "cursor": 58879.0,
                        "normalized": 0.8285714266821742
                      },
                      {
                        "cursor": 58879.0,
                        "normalized": 0.7857142826542258
                      },
                      {
                        "cursor": 58912.0,
                        "normalized": 0.757142853923142
                      },
                      {
                        "cursor": 58943.0,
                        "normalized": 0.6999999964609742
                      },
                      {
                        "cursor": 58943.0,
                        "normalized": 0.6714285677298903
                      },
                      {
                        "cursor": 58943.0,
                        "normalized": 0.6428571389988065
                      },
                      {
                        "cursor": 58976.0,
                        "normalized": 0.6142857102677226
                      },
                      {
                        "cursor": 58976.0,
                        "normalized": 0.5857142815366387
                      },
                      {
                        "cursor": 59008.0,
                        "normalized": 0.5714285671710968
                      },
                      {
                        "cursor": 59008.0,
                        "normalized": 0.5285714231431484
                      },
                      {
                        "cursor": 59008.0,
                        "normalized": 0.49999999441206455
                      },
                      {
                        "cursor": 59008.0,
                        "normalized": 0.4714285656809807
                      },
                      {
                        "cursor": 59071.0,
                        "normalized": 0.45714285131543875
                      },
                      {
                        "cursor": 59071.0,
                        "normalized": 0.4428571369498968
                      },
                      {
                        "cursor": 59071.0,
                        "normalized": 0.4285714225843549
                      },
                      {
                        "cursor": 59104.0,
                        "normalized": 0.41428570821881294
                      },
                      {
                        "cursor": 59135.0,
                        "normalized": 0.399999993853271
                      },
                      {
                        "cursor": 59135.0,
                        "normalized": 0.3857142794877291
                      },
                      {
                        "cursor": 59135.0,
                        "normalized": 0.37142856512218714
                      },
                      {
                        "cursor": 59168.0,
                        "normalized": 0.3571428507566452
                      },
                      {
                        "cursor": 59199.0,
                        "normalized": 0.34285713639110327
                      },
                      {
                        "cursor": 59199.0,
                        "normalized": 0.32857142202556133
                      },
                      {
                        "cursor": 59231.0,
                        "normalized": 0.3142857076600194
                      },
                      {
                        "cursor": 59263.0,
                        "normalized": 0.29999999329447746
                      },
                      {
                        "cursor": 59263.0,
                        "normalized": 0.28571427892893553
                      },
                      {
                        "cursor": 59263.0,
                        "normalized": 0.25714285019785166
                      },
                      {
                        "cursor": 59295.0,
                        "normalized": 0.2285714214667678
                      },
                      {
                        "cursor": 59295.0,
                        "normalized": 0.21428570710122585
                      },
                      {
                        "cursor": 59327.0,
                        "normalized": 0.19999999273568392
                      },
                      {
                        "cursor": 59359.0,
                        "normalized": 0.18571427837014198
                      },
                      {
                        "cursor": 59359.0,
                        "normalized": 0.1571428496390581
                      },
                      {
                        "cursor": 59391.0,
                        "normalized": 0.14285713527351618
                      },
                      {
                        "cursor": 59391.0,
                        "normalized": 0.12857142090797424
                      },
                      {
                        "cursor": 59391.0,
                        "normalized": 0.09999999217689037
                      },
                      {
                        "cursor": 59423.0,
                        "normalized": 0.08571427781134844
                      },
                      {
                        "cursor": 59423.0,
                        "normalized": 0.05714284908026457
                      },
                      {
                        "cursor": 59455.0,
                        "normalized": 0.04285713471472263
                      },
                      {
                        "cursor": 59455.0,
                        "normalized": 0.0285714203491807
                      },
                      {
                        "cursor": 59455.0,
                        "normalized": 0.014285705983638763
                      },
                      {
                        "cursor": 59488.0,
                        "normalized": 0.0
                      },
                      {
                        "cursor": 60319.0,
                        "normalized": 0.04285714402794838
                      },
                      {
                        "cursor": 60319.0,
                        "normalized": 0.10000000149011612
                      },
                      {
                        "cursor": 60352.0,
                        "normalized": 0.11428571585565805
                      },
                      {
                        "cursor": 60352.0,
                        "normalized": 0.15714285988360643
                      },
                      {
                        "cursor": 60352.0,
                        "normalized": 0.17142857424914837
                      },
                      {
                        "cursor": 60383.0,
                        "normalized": 0.1857142886146903
                      },
                      {
                        "cursor": 60383.0,
                        "normalized": 0.20000000298023224
                      },
                      {
                        "cursor": 60383.0,
                        "normalized": 0.21428571734577417
                      },
                      {
                        "cursor": 60416.0,
                        "normalized": 0.2285714317113161
                      },
                      {
                        "cursor": 60416.0,
                        "normalized": 0.24285714607685804
                      },
                      {
                        "cursor": 60416.0,
                        "normalized": 0.2857142901048064
                      },
                      {
                        "cursor": 60448.0,
                        "normalized": 0.30000000447034836
                      },
                      {
                        "cursor": 60448.0,
                        "normalized": 0.3142857188358903
                      },
                      {
                        "cursor": 60448.0,
                        "normalized": 0.34285714756697416
                      },
                      {
                        "cursor": 60448.0,
                        "normalized": 0.37142857629805803
                      },
                      {
                        "cursor": 60479.0,
                        "normalized": 0.38571429066359997
                      },
                      {
                        "cursor": 60479.0,
                        "normalized": 0.4000000050291419
                      },
                      {
                        "cursor": 60511.0,
                        "normalized": 0.41428571939468384
                      },
                      {
                        "cursor": 60511.0,
                        "normalized": 0.4285714337602258
                      },
                      {
                        "cursor": 60544.0,
                        "normalized": 0.4428571481257677
                      },
                      {
                        "cursor": 60575.0,
                        "normalized": 0.45714286249130964
                      },
                      {
                        "cursor": 60575.0,
                        "normalized": 0.4714285768568516
                      },
                      {
                        "cursor": 60575.0,
                        "normalized": 0.4857142912223935
                      },
                      {
                        "cursor": 60607.0,
                        "normalized": 0.5142857199534774
                      },
                      {
                        "cursor": 60607.0,
                        "normalized": 0.5285714343190193
                      },
                      {
                        "cursor": 60639.0,
                        "normalized": 0.5428571486845613
                      },
                      {
                        "cursor": 60639.0,
                        "normalized": 0.5714285774156451
                      },
                      {
                        "cursor": 60672.0,
                        "normalized": 0.5857142917811871
                      },
                      {
                        "cursor": 60672.0,
                        "normalized": 0.6142857205122709
                      },
                      {
                        "cursor": 60672.0,
                        "normalized": 0.6285714348778129
                      },
                      {
                        "cursor": 60703.0,
                        "normalized": 0.6428571492433548
                      },
                      {
                        "cursor": 60703.0,
                        "normalized": 0.6571428636088967
                      },
                      {
                        "cursor": 60703.0,
                        "normalized": 0.6857142923399806
                      },
                      {
                        "cursor": 60736.0,
                        "normalized": 0.7142857210710645
                      },
                      {
                        "cursor": 60736.0,
                        "normalized": 0.7428571498021483
                      },
                      {
                        "cursor": 60767.0,
                        "normalized": 0.7714285785332322
                      },
                      {
                        "cursor": 60800.0,
                        "normalized": 0.8000000072643161
                      },
                      {
                        "cursor": 60800.0,
                        "normalized": 0.814285721629858
                      },
                      {
                        "cursor": 60831.0,
                        "normalized": 0.8285714359954
                      },
                      {
                        "cursor": 60831.0,
                        "normalized": 0.8428571503609419
                      },
                      {
                        "cursor": 60831.0,
                        "normalized": 0.8571428647264838
                      },
                      {
                        "cursor": 60863.0,
                        "normalized": 0.8714285790920258
                      },
                      {
                        "cursor": 60896.0,
                        "normalized": 0.8857142934575677
                      },
                      {
                        "cursor": 60896.0,
                        "normalized": 0.9000000078231096
                      },
                      {
                        "cursor": 60927.0,
                        "normalized": 0.9142857221886516
                      },
                      {
                        "cursor": 60927.0,
                        "normalized": 0.9285714365541935
                      },
                      {
                        "cursor": 60992.0,
                        "normalized": 0.9428571509197354
                      },
                      {
                        "cursor": 60992.0,
                        "normalized": 0.9571428652852774
                      },
                      {
                        "cursor": 60992.0,
                        "normalized": 0.9714285796508193
                      },
                      {
                        "cursor": 60992.0,
                        "normalized": 0.9857142940163612
                      },
                      {
                        "cursor": 61024.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 68960.0,
                        "normalized": 0.9857142856344581
                      },
                      {
                        "cursor": 68960.0,
                        "normalized": 0.9571428569033742
                      },
                      {
                        "cursor": 68992.0,
                        "normalized": 0.9428571425378323
                      },
                      {
                        "cursor": 68992.0,
                        "normalized": 0.9285714281722903
                      },
                      {
                        "cursor": 68992.0,
                        "normalized": 0.9142857138067484
                      },
                      {
                        "cursor": 69024.0,
                        "normalized": 0.8857142850756645
                      },
                      {
                        "cursor": 69024.0,
                        "normalized": 0.8571428563445807
                      },
                      {
                        "cursor": 69024.0,
                        "normalized": 0.8428571419790387
                      },
                      {
                        "cursor": 69056.0,
                        "normalized": 0.8285714276134968
                      },
                      {
                        "cursor": 69056.0,
                        "normalized": 0.7857142835855484
                      },
                      {
                        "cursor": 69056.0,
                        "normalized": 0.7571428548544645
                      },
                      {
                        "cursor": 69087.0,
                        "normalized": 0.6999999973922968
                      },
                      {
                        "cursor": 69119.0,
                        "normalized": 0.6857142830267549
                      },
                      {
                        "cursor": 69119.0,
                        "normalized": 0.657142854295671
                      },
                      {
                        "cursor": 69119.0,
                        "normalized": 0.642857139930129
                      },
                      {
                        "cursor": 69119.0,
                        "normalized": 0.6285714255645871
                      },
                      {
                        "cursor": 69119.0,
                        "normalized": 0.6142857111990452
                      },
                      {
                        "cursor": 69151.0,
                        "normalized": 0.5857142824679613
                      },
                      {
                        "cursor": 69151.0,
                        "normalized": 0.5714285681024194
                      },
                      {
                        "cursor": 69151.0,
                        "normalized": 0.5571428537368774
                      },
                      {
                        "cursor": 69184.0,
                        "normalized": 0.5285714250057936
                      },
                      {
                        "cursor": 69248.0,
                        "normalized": 0.5142857106402516
                      },
                      {
                        "cursor": 69248.0,
                        "normalized": 0.4999999962747097
                      },
                      {
                        "cursor": 69248.0,
                        "normalized": 0.48571428190916777
                      },
                      {
                        "cursor": 69280.0,
                        "normalized": 0.47142856754362583
                      },
                      {
                        "cursor": 69313.0,
                        "normalized": 0.4571428531780839
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.44285713881254196
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.428571424447
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.4142857100814581
                      },
                      {
                        "cursor": 69376.0,
                        "normalized": 0.3857142813503742
                      },
                      {
                        "cursor": 69376.0,
                        "normalized": 0.3714285669848323
                      },
                      {
                        "cursor": 69407.0,
                        "normalized": 0.3285714229568839
                      },
                      {
                        "cursor": 69407.0,
                        "normalized": 0.314285708591342
                      },
                      {
                        "cursor": 69440.0,
                        "normalized": 0.2857142798602581
                      },
                      {
                        "cursor": 69440.0,
                        "normalized": 0.24285713583230972
                      },
                      {
                        "cursor": 69440.0,
                        "normalized": 0.2285714214667678
                      },
                      {
                        "cursor": 69440.0,
                        "normalized": 0.19999999273568392
                      },
                      {
                        "cursor": 69471.0,
                        "normalized": 0.17142856400460005
                      },
                      {
                        "cursor": 69503.0,
                        "normalized": 0.1571428496390581
                      },
                      {
                        "cursor": 69503.0,
                        "normalized": 0.12857142090797424
                      },
                      {
                        "cursor": 69503.0,
                        "normalized": 0.11428570654243231
                      },
                      {
                        "cursor": 69503.0,
                        "normalized": 0.08571427781134844
                      },
                      {
                        "cursor": 69535.0,
                        "normalized": 0.0714285634458065
                      },
                      {
                        "cursor": 69535.0,
                        "normalized": 0.05714284908026457
                      },
                      {
                        "cursor": 69567.0,
                        "normalized": 0.04285713471472263
                      },
                      {
                        "cursor": 69567.0,
                        "normalized": 0.014285705983638763
                      },
                      {
                        "cursor": 69567.0,
                        "normalized": 0.0
                      },
                      {
                        "cursor": 110303.0,
                        "normalized": 0.014285714365541935
                      },
                      {
                        "cursor": 110303.0,
                        "normalized": 0.02857142873108387
                      },
                      {
                        "cursor": 110335.0,
                        "normalized": 0.042857143096625805
                      },
                      {
                        "cursor": 110368.0,
                        "normalized": 0.05714285746216774
                      },
                      {
                        "cursor": 110432.0,
                        "normalized": 0.07142857182770967
                      },
                      {
                        "cursor": 110496.0,
                        "normalized": 0.08571428619325161
                      },
                      {
                        "cursor": 110496.0,
                        "normalized": 0.10000000055879354
                      },
                      {
                        "cursor": 110528.0,
                        "normalized": 0.11428571492433548
                      },
                      {
                        "cursor": 110528.0,
                        "normalized": 0.12857142928987741
                      },
                      {
                        "cursor": 110559.0,
                        "normalized": 0.15714285802096128
                      },
                      {
                        "cursor": 110592.0,
                        "normalized": 0.17142857238650322
                      },
                      {
                        "cursor": 110655.0,
                        "normalized": 0.18571428675204515
                      },
                      {
                        "cursor": 110687.0,
                        "normalized": 0.2000000011175871
                      },
                      {
                        "cursor": 110720.0,
                        "normalized": 0.21428571548312902
                      },
                      {
                        "cursor": 110720.0,
                        "normalized": 0.22857142984867096
                      },
                      {
                        "cursor": 110752.0,
                        "normalized": 0.2428571442142129
                      },
                      {
                        "cursor": 110783.0,
                        "normalized": 0.25714285857975483
                      },
                      {
                        "cursor": 110783.0,
                        "normalized": 0.27142857294529676
                      },
                      {
                        "cursor": 110816.0,
                        "normalized": 0.2857142873108387
                      },
                      {
                        "cursor": 110816.0,
                        "normalized": 0.30000000167638063
                      },
                      {
                        "cursor": 110847.0,
                        "normalized": 0.31428571604192257
                      },
                      {
                        "cursor": 110847.0,
                        "normalized": 0.3285714304074645
                      },
                      {
                        "cursor": 110879.0,
                        "normalized": 0.34285714477300644
                      },
                      {
                        "cursor": 110912.0,
                        "normalized": 0.3571428591385484
                      },
                      {
                        "cursor": 110912.0,
                        "normalized": 0.3714285735040903
                      },
                      {
                        "cursor": 110976.0,
                        "normalized": 0.38571428786963224
                      },
                      {
                        "cursor": 110976.0,
                        "normalized": 0.4000000022351742
                      },
                      {
                        "cursor": 111009.0,
                        "normalized": 0.4142857166007161
                      },
                      {
                        "cursor": 111009.0,
                        "normalized": 0.42857143096625805
                      },
                      {
                        "cursor": 111039.0,
                        "normalized": 0.4571428596973419
                      },
                      {
                        "cursor": 111071.0,
                        "normalized": 0.47142857406288385
                      },
                      {
                        "cursor": 111103.0,
                        "normalized": 0.4857142884284258
                      },
                      {
                        "cursor": 111136.0,
                        "normalized": 0.5000000027939677
                      },
                      {
                        "cursor": 111168.0,
                        "normalized": 0.5142857171595097
                      },
                      {
                        "cursor": 111199.0,
                        "normalized": 0.5285714315250516
                      },
                      {
                        "cursor": 111232.0,
                        "normalized": 0.5428571458905935
                      },
                      {
                        "cursor": 111296.0,
                        "normalized": 0.5714285746216774
                      },
                      {
                        "cursor": 111327.0,
                        "normalized": 0.5857142889872193
                      },
                      {
                        "cursor": 111327.0,
                        "normalized": 0.6000000033527613
                      },
                      {
                        "cursor": 111392.0,
                        "normalized": 0.6142857177183032
                      },
                      {
                        "cursor": 111392.0,
                        "normalized": 0.6285714320838451
                      },
                      {
                        "cursor": 111423.0,
                        "normalized": 0.6428571464493871
                      },
                      {
                        "cursor": 111456.0,
                        "normalized": 0.657142860814929
                      },
                      {
                        "cursor": 111456.0,
                        "normalized": 0.6714285751804709
                      },
                      {
                        "cursor": 111456.0,
                        "normalized": 0.7000000039115548
                      },
                      {
                        "cursor": 111488.0,
                        "normalized": 0.7142857182770967
                      },
                      {
                        "cursor": 111488.0,
                        "normalized": 0.7285714326426387
                      },
                      {
                        "cursor": 111519.0,
                        "normalized": 0.7428571470081806
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.7571428613737226
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.7714285757392645
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.7857142901048064
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.8000000044703484
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.8142857188358903
                      },
                      {
                        "cursor": 111551.0,
                        "normalized": 0.8285714332014322
                      },
                      {
                        "cursor": 111583.0,
                        "normalized": 0.8428571475669742
                      },
                      {
                        "cursor": 111583.0,
                        "normalized": 0.8571428619325161
                      },
                      {
                        "cursor": 111583.0,
                        "normalized": 0.8857142906636
                      },
                      {
                        "cursor": 111615.0,
                        "normalized": 0.9000000050291419
                      },
                      {
                        "cursor": 111615.0,
                        "normalized": 0.9142857193946838
                      },
                      {
                        "cursor": 111680.0,
                        "normalized": 0.9428571481257677
                      },
                      {
                        "cursor": 111680.0,
                        "normalized": 0.9571428624913096
                      },
                      {
                        "cursor": 111712.0,
                        "normalized": 0.9714285768568516
                      },
                      {
                        "cursor": 111712.0,
                        "normalized": 0.9857142912223935
                      },
                      {
                        "cursor": 111712.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 119264.0,
                        "normalized": 0.9714285712689161
                      },
                      {
                        "cursor": 119264.0,
                        "normalized": 0.9571428569033742
                      },
                      {
                        "cursor": 119295.0,
                        "normalized": 0.9428571425378323
                      },
                      {
                        "cursor": 119295.0,
                        "normalized": 0.9285714281722903
                      },
                      {
                        "cursor": 119327.0,
                        "normalized": 0.9142857138067484
                      },
                      {
                        "cursor": 119327.0,
                        "normalized": 0.8857142850756645
                      },
                      {
                        "cursor": 119360.0,
                        "normalized": 0.8714285707101226
                      },
                      {
                        "cursor": 119360.0,
                        "normalized": 0.8571428563445807
                      },
                      {
                        "cursor": 119360.0,
                        "normalized": 0.8428571419790387
                      },
                      {
                        "cursor": 119392.0,
                        "normalized": 0.8285714276134968
                      },
                      {
                        "cursor": 119392.0,
                        "normalized": 0.8142857132479548
                      },
                      {
                        "cursor": 119424.0,
                        "normalized": 0.7999999988824129
                      },
                      {
                        "cursor": 119424.0,
                        "normalized": 0.785714284516871
                      },
                      {
                        "cursor": 119456.0,
                        "normalized": 0.771428570151329
                      },
                      {
                        "cursor": 119488.0,
                        "normalized": 0.7571428557857871
                      },
                      {
                        "cursor": 119488.0,
                        "normalized": 0.7285714270547032
                      },
                      {
                        "cursor": 119488.0,
                        "normalized": 0.7142857126891613
                      },
                      {
                        "cursor": 119519.0,
                        "normalized": 0.6999999983236194
                      },
                      {
                        "cursor": 119551.0,
                        "normalized": 0.6714285695925355
                      },
                      {
                        "cursor": 119551.0,
                        "normalized": 0.6428571408614516
                      },
                      {
                        "cursor": 119551.0,
                        "normalized": 0.6142857121303678
                      },
                      {
                        "cursor": 119584.0,
                        "normalized": 0.5999999977648258
                      },
                      {
                        "cursor": 119584.0,
                        "normalized": 0.571428569033742
                      },
                      {
                        "cursor": 119616.0,
                        "normalized": 0.5428571403026581
                      },
                      {
                        "cursor": 119648.0,
                        "normalized": 0.5285714259371161
                      },
                      {
                        "cursor": 119648.0,
                        "normalized": 0.4999999972060323
                      },
                      {
                        "cursor": 119648.0,
                        "normalized": 0.4714285684749484
                      },
                      {
                        "cursor": 119679.0,
                        "normalized": 0.428571424447
                      },
                      {
                        "cursor": 119712.0,
                        "normalized": 0.4142857100814581
                      },
                      {
                        "cursor": 119712.0,
                        "normalized": 0.3857142813503742
                      },
                      {
                        "cursor": 119712.0,
                        "normalized": 0.3714285669848323
                      },
                      {
                        "cursor": 119744.0,
                        "normalized": 0.35714285261929035
                      },
                      {
                        "cursor": 119744.0,
                        "normalized": 0.3285714238882065
                      },
                      {
                        "cursor": 119744.0,
                        "normalized": 0.2999999951571226
                      },
                      {
                        "cursor": 119776.0,
                        "normalized": 0.25714285112917423
                      },
                      {
                        "cursor": 119807.0,
                        "normalized": 0.2428571367636323
                      },
                      {
                        "cursor": 119807.0,
                        "normalized": 0.22857142239809036
                      },
                      {
                        "cursor": 119807.0,
                        "normalized": 0.1999999936670065
                      },
                      {
                        "cursor": 119840.0,
                        "normalized": 0.18571427930146456
                      },
                      {
                        "cursor": 119871.0,
                        "normalized": 0.17142856493592262
                      },
                      {
                        "cursor": 119871.0,
                        "normalized": 0.14285713620483875
                      },
                      {
                        "cursor": 119904.0,
                        "normalized": 0.12857142183929682
                      },
                      {
                        "cursor": 119904.0,
                        "normalized": 0.11428570747375488
                      },
                      {
                        "cursor": 119904.0,
                        "normalized": 0.08571427874267101
                      },
                      {
                        "cursor": 119935.0,
                        "normalized": 0.07142856437712908
                      },
                      {
                        "cursor": 119935.0,
                        "normalized": 0.05714285001158714
                      },
                      {
                        "cursor": 119935.0,
                        "normalized": 0.04285713564604521
                      },
                      {
                        "cursor": 119967.0,
                        "normalized": 0.028571421280503273
                      },
                      {
                        "cursor": 119999.0,
                        "normalized": 0.014285706914961338
                      },
                      {
                        "cursor": 119999.0,
                        "normalized": 0.0
                      },
                      {
                        "cursor": 121567.0,
                        "normalized": 0.02857142873108387
                      },
                      {
                        "cursor": 121567.0,
                        "normalized": 0.05714285746216774
                      },
                      {
                        "cursor": 121599.0,
                        "normalized": 0.1428571455180645
                      },
                      {
                        "cursor": 121599.0,
                        "normalized": 0.20000000298023224
                      },
                      {
                        "cursor": 121599.0,
                        "normalized": 0.3285714387893677
                      },
                      {
                        "cursor": 121631.0,
                        "normalized": 0.41428572684526443
                      },
                      {
                        "cursor": 121631.0,
                        "normalized": 0.48571430146694183
                      },
                      {
                        "cursor": 121631.0,
                        "normalized": 0.5714285895228386
                      },
                      {
                        "cursor": 121664.0,
                        "normalized": 0.7142857387661934
                      },
                      {
                        "cursor": 121664.0,
                        "normalized": 0.7714285962283611
                      },
                      {
                        "cursor": 121664.0,
                        "normalized": 0.8285714536905289
                      },
                      {
                        "cursor": 121664.0,
                        "normalized": 0.928571455180645
                      },
                      {
                        "cursor": 121695.0,
                        "normalized": 0.9857143126428127
                      },
                      {
                        "cursor": 121727.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 129728.0,
                        "normalized": 0.9857142856344581
                      },
                      {
                        "cursor": 129759.0,
                        "normalized": 0.9714285712689161
                      },
                      {
                        "cursor": 129759.0,
                        "normalized": 0.9571428569033742
                      },
                      {
                        "cursor": 129792.0,
                        "normalized": 0.9428571425378323
                      },
                      {
                        "cursor": 129792.0,
                        "normalized": 0.9142857138067484
                      },
                      {
                        "cursor": 129792.0,
                        "normalized": 0.8999999994412065
                      },
                      {
                        "cursor": 129823.0,
                        "normalized": 0.8857142850756645
                      },
                      {
                        "cursor": 129823.0,
                        "normalized": 0.8714285707101226
                      },
                      {
                        "cursor": 129823.0,
                        "normalized": 0.8428571419790387
                      },
                      {
                        "cursor": 129855.0,
                        "normalized": 0.8285714276134968
                      },
                      {
                        "cursor": 129887.0,
                        "normalized": 0.7999999988824129
                      },
                      {
                        "cursor": 129887.0,
                        "normalized": 0.785714284516871
                      },
                      {
                        "cursor": 129919.0,
                        "normalized": 0.771428570151329
                      },
                      {
                        "cursor": 129919.0,
                        "normalized": 0.7571428557857871
                      },
                      {
                        "cursor": 129919.0,
                        "normalized": 0.7428571414202452
                      },
                      {
                        "cursor": 129919.0,
                        "normalized": 0.7285714270547032
                      },
                      {
                        "cursor": 129952.0,
                        "normalized": 0.7142857126891613
                      },
                      {
                        "cursor": 129952.0,
                        "normalized": 0.6857142839580774
                      },
                      {
                        "cursor": 129984.0,
                        "normalized": 0.6714285695925355
                      },
                      {
                        "cursor": 129984.0,
                        "normalized": 0.6571428552269936
                      },
                      {
                        "cursor": 129984.0,
                        "normalized": 0.6428571408614516
                      },
                      {
                        "cursor": 129984.0,
                        "normalized": 0.6285714264959097
                      },
                      {
                        "cursor": 130015.0,
                        "normalized": 0.6142857121303678
                      },
                      {
                        "cursor": 130015.0,
                        "normalized": 0.5857142833992839
                      },
                      {
                        "cursor": 130047.0,
                        "normalized": 0.5571428546682
                      },
                      {
                        "cursor": 130047.0,
                        "normalized": 0.5428571403026581
                      },
                      {
                        "cursor": 130047.0,
                        "normalized": 0.5285714259371161
                      },
                      {
                        "cursor": 130079.0,
                        "normalized": 0.4999999972060323
                      },
                      {
                        "cursor": 130079.0,
                        "normalized": 0.4714285684749484
                      },
                      {
                        "cursor": 130111.0,
                        "normalized": 0.45714285410940647
                      },
                      {
                        "cursor": 130111.0,
                        "normalized": 0.44285713974386454
                      },
                      {
                        "cursor": 130143.0,
                        "normalized": 0.4285714253783226
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.41428571101278067
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.39999999664723873
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.37142856791615486
                      },
                      {
                        "cursor": 130208.0,
                        "normalized": 0.3571428535506129
                      },
                      {
                        "cursor": 130208.0,
                        "normalized": 0.342857139185071
                      },
                      {
                        "cursor": 130239.0,
                        "normalized": 0.32857142481952906
                      },
                      {
                        "cursor": 130239.0,
                        "normalized": 0.2999999960884452
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.28571428172290325
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.2571428529918194
                      },
                      {
                        "cursor": 130303.0,
                        "normalized": 0.2285714242607355
                      },
                      {
                        "cursor": 130303.0,
                        "normalized": 0.21428570989519358
                      },
                      {
                        "cursor": 130303.0,
                        "normalized": 0.19999999552965164
                      },
                      {
                        "cursor": 130336.0,
                        "normalized": 0.17142856679856777
                      },
                      {
                        "cursor": 130367.0,
                        "normalized": 0.15714285243302584
                      },
                      {
                        "cursor": 130367.0,
                        "normalized": 0.1428571380674839
                      },
                      {
                        "cursor": 130400.0,
                        "normalized": 0.12857142370194197
                      },
                      {
                        "cursor": 130400.0,
                        "normalized": 0.11428570933640003
                      },
                      {
                        "cursor": 130432.0,
                        "normalized": 0.0999999949708581
                      },
                      {
                        "cursor": 130463.0,
                        "normalized": 0.08571428060531616
                      },
                      {
                        "cursor": 130463.0,
                        "normalized": 0.07142856623977423
                      },
                      {
                        "cursor": 130463.0,
                        "normalized": 0.05714285187423229
                      },
                      {
                        "cursor": 130495.0,
                        "normalized": 0.04285713750869036
                      },
                      {
                        "cursor": 130495.0,
                        "normalized": 0.028571423143148422
                      },
                      {
                        "cursor": 130528.0,
                        "normalized": 0.0
                      }
                    ],
                    "path": "/fader",
                    "componentId": 589,
                    "parameterPath": "fader"
                  }
                ]
              }
            ],
            "patternIndex": 0,
            "patterns": [
              {
                "id": 631,
                "class": "heronarts.lx.pattern.color.GradientPattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": true,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Gradient",
                  "xAmount": 1.0,
                  "yAmount": 0.0,
                  "zAmount": 0.0,
                  "xOffset": 0.0,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "colorMode": 0,
                  "blendMode": 1,
                  "gradient": 0.619047611951828,
                  "fixedColor/brightness": 100.0,
                  "fixedColor/saturation": 100.0,
                  "fixedColor/hue": 96.00000762939453,
                  "xMode": 0,
                  "yMode": 0,
                  "zMode": 0,
                  "paletteIndex": 1,
                  "paletteStops": 5,
                  "gradientRange": 360.0
                },
                "children": {
                  "modulation": {
                    "id": 632,
                    "class": "heronarts.lx.modulation.LXModulationEngine",
                    "internal": {
                      "modulationColor": 0
                    },
                    "parameters": {
                      "label": "Modulation"
                    },
                    "children": {},
                    "modulators": [],
                    "modulations": [],
                    "triggers": []
                  }
                },
                "deviceVersion": -1
              }
            ]
          }
        ]
      },
      "modulation": {
        "id": 21,
        "class": "heronarts.lx.modulation.LXModulationEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Modulation"
        },
        "children": {},
        "modulators": [
          {
            "id": 34,
            "class": "heronarts.lx.modulator.VariableLFO",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LFO",
              "running": false,
              "trigger": false,
              "loop": false,
              "tempoSync": false,
              "tempoMultiplier": 5,
              "tempoLock": true,
              "clockMode": 0,
              "periodFast": 810.3668079480674,
              "periodSlow": 10000.0,
              "wave": 3,
              "skew": 0.0,
              "shape": 0.0,
              "bias": 0.0,
              "phase": 0.0,
              "exp": 0.0
            },
            "children": {},
            "basis": 1.0
          },
          {
            "id": 253,
            "class": "heronarts.lx.modulator.MultiStageEnvelope",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Env",
              "running": false,
              "trigger": false,
              "loop": false,
              "tempoSync": false,
              "tempoMultiplier": 5,
              "tempoLock": true,
              "period": 463.09830083280417
            },
            "children": {},
            "basis": 1.0,
            "stages": [
              {
                "basis": 0.0,
                "value": 0.0,
                "shape": 1.0
              },
              {
                "basis": 1.0,
                "value": 1.0,
                "shape": 1.0
              }
            ]
          },
          {
            "id": 258,
            "class": "heronarts.lx.audio.BandGate",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Beat",
              "running": false,
              "trigger": false,
              "gain": 15.359999120235443,
              "range": 36.0,
              "attack": 22.999999709427353,
              "release": 31.056226618204697,
              "slope": 2.1000000536441803,
              "threshold": 0.4655172433704138,
              "floor": 0.5107665793188515,
              "decay": 304.0000021457672,
              "minFreq": 120.0,
              "maxFreq": 1337.302734375,
              "gate": false,
              "average": 0.0,
              "tap": false
            },
            "children": {}
          }
        ],
        "modulations": [],
        "triggers": [
          {
            "source": {
              "componentId": 258,
              "parameterPath": "gate",
              "path": "/modulation/modulator/3/gate"
            },
            "target": {
              "componentId": 253,
              "parameterPath": "trigger",
              "path": "/modulation/modulator/2/trigger"
            },
            "id": 557,
            "class": "heronarts.lx.modulation.LXTriggerModulation",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LX",
              "enabled": true
            },
            "children": {}
          }
        ]
      },
      "output": {
        "id": 22,
        "class": "heronarts.lx.LXEngine$Output",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Output",
          "enabled": true,
          "brightness": 1.0,
          "fps": 0.0,
          "gamma": 1.0,
          "gammaMode": 1
        },
        "children": {}
      },
      "snapshots": {
        "id": 24,
        "class": "heronarts.lx.snapshot.LXSnapshotEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Snapshots",
          "recallMixer": true,
          "recallModulation": true,
          "recallPattern": true,
          "recallEffect": true,
          "channelMode": 0,
          "missingChannelMode": 0,
          "transitionEnabled": false,
          "transitionTimeSecs": 5.0,
          "autoCycleEnabled": false,
          "autoCycleMode": 0,
          "autoCycleTimeSecs": 65.0,
          "autoCycleCursor": -1,
          "triggerSnapshotCycle": false
        },
        "children": {},
        "snapshots": [
          {
            "id": 558,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-1",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/mode",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 29922.494971874057,
                "normalizedValue": 0.8400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 463.09830083280417,
                "normalizedValue": 0.19151134703645523
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.579001292251178,
                "normalizedValue": 0.579001292251178
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          },
          {
            "id": 560,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-2",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/mode",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 29922.494971874057,
                "normalizedValue": 0.8400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 463.09830083280417,
                "normalizedValue": 0.19151134703645523
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.28576031428310267,
                "normalizedValue": 0.28576031428310267
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          },
          {
            "id": 564,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-3",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 2,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/mode",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 29922.494971874057,
                "normalizedValue": 0.8400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 463.09830083280417,
                "normalizedValue": 0.19151134703645523
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          },
          {
            "id": 565,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-4",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 1
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/density",
                "value": 12.959999688863755,
                "normalizedValue": 0.17999999783933163
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/speed",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/variation",
                "value": 59.99999921768904,
                "normalizedValue": 0.5999999921768904
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/duration",
                "value": 9.000001475214958,
                "normalizedValue": 0.09000001475214958
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/waveshape",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minInterval",
                "value": 16.573999651893974,
                "normalizedValue": 0.2750250359247742
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxInterval",
                "value": 8.18799983933568,
                "normalizedValue": 0.13502503905401803
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/baseLevel",
                "value": 53.000001050531864,
                "normalizedValue": 0.5300000105053186
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minLevel",
                "value": 81.99999984353781,
                "normalizedValue": 0.8199999984353781
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxLevel",
                "value": 82.00000040233135,
                "normalizedValue": 0.8200000040233135
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/mode",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 29922.494971874057,
                "normalizedValue": 0.8400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 1060.6892448477588,
                "normalizedValue": 0.3115113443542462
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          },
          {
            "id": 657,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-5",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 1
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/density",
                "value": 275.56000697553185,
                "normalizedValue": 0.830000010505319
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/speed",
                "value": 0.10999999940395355,
                "normalizedValue": 0.10999999940395355
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/variation",
                "value": 66.99999887496233,
                "normalizedValue": 0.6699999887496233
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/duration",
                "value": 21.00000143051147,
                "normalizedValue": 0.21000001430511472
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/sharp",
                "value": 0.019999977201223373,
                "normalizedValue": 0.5099999886006117
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/waveshape",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minInterval",
                "value": 13.27799981702119,
                "normalizedValue": 0.21999999694526196
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxInterval",
                "value": 23.460999611727892,
                "normalizedValue": 0.38999999351799486
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/baseLevel",
                "value": 32.0000008046627,
                "normalizedValue": 0.320000008046627
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minLevel",
                "value": 86.00000031292439,
                "normalizedValue": 0.8600000031292439
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxLevel",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/hue",
                "value": 39.2727367579937,
                "normalizedValue": 0.5545454677194357
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/brightness",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/3",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/crossfadeGroup",
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/3",
                "activePatternIndex": 3
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xAmount",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yAmount",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zAmount",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/gradient",
                "value": 0.428571417927742,
                "normalizedValue": 0.714285708963871
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/brightness",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/hue",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/gradientRange",
                "value": 360.0,
                "normalizedValue": 0.1
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 810.3668079480674,
                "normalizedValue": 0.330000014975667
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 3,
                "normalizedValue": 0.75
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 463.09830083280417,
                "normalizedValue": 0.19151134703645523
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          },
          {
            "id": 661,
            "class": "heronarts.lx.snapshot.LXSnapshot",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Snapshot-6",
              "recall": false,
              "autoCycleEligible": true
            },
            "children": {},
            "views": [
              {
                "scope": "OUTPUT",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/output/brightness",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/crossfader",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/crossfadeGroup",
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 1
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/density",
                "value": 275.56000697553185,
                "normalizedValue": 0.830000010505319
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/speed",
                "value": 0.10999999940395355,
                "normalizedValue": 0.10999999940395355
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/variation",
                "value": 66.99999887496233,
                "normalizedValue": 0.6699999887496233
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/duration",
                "value": 21.00000143051147,
                "normalizedValue": 0.21000001430511472
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/sharp",
                "value": 0.019999977201223373,
                "normalizedValue": 0.5099999886006117
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/waveshape",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minInterval",
                "value": 13.27799981702119,
                "normalizedValue": 0.21999999694526196
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxInterval",
                "value": 23.460999611727892,
                "normalizedValue": 0.38999999351799486
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/baseLevel",
                "value": 32.0000008046627,
                "normalizedValue": 0.320000008046627
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/minLevel",
                "value": 86.00000031292439,
                "normalizedValue": 0.8600000031292439
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/2/maxLevel",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/hue",
                "value": 39.2727367579937,
                "normalizedValue": 0.5545454677194357
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/brightness",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "channelEnabled": true,
                "channelFader": 0.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/crossfadeGroup",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MIXER",
                "type": "CHANNEL_FADER",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/3",
                "channelEnabled": true,
                "channelFader": 1.0
              },
              {
                "scope": "MIXER",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/crossfadeGroup",
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/3",
                "activePatternIndex": 0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xAmount",
                "value": 0.6333333142101765,
                "normalizedValue": 0.8166666571050882
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yAmount",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zAmount",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/blendMode",
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/gradient",
                "value": 0.1904761753976345,
                "normalizedValue": 0.5952380876988173
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/brightness",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/fixedColor/hue",
                "value": 290.6190530322492,
                "normalizedValue": 0.8095238246023655
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/gradientRange",
                "value": 360.0,
                "normalizedValue": 0.1
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/amount",
                "value": 0.41000001318752766,
                "normalizedValue": 0.41000001318752766
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/density",
                "value": 50.0,
                "normalizedValue": 0.3535533905932738
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/speed",
                "value": 0.5099999979138374,
                "normalizedValue": 0.5099999979138374
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/variation",
                "value": 25.0,
                "normalizedValue": 0.25
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/duration",
                "value": 83.00000037997961,
                "normalizedValue": 0.8300000037997961
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/waveshape",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/minInterval",
                "value": 3.3959999464452264,
                "normalizedValue": 0.05502504084215737
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/maxInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/minLevel",
                "value": 75.0,
                "normalizedValue": 0.75
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/maxLevel",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/label",
                "value": "LFO",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/clockMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodFast",
                "value": 810.3668079480674,
                "normalizedValue": 0.330000014975667
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/periodSlow",
                "value": 10000.0,
                "normalizedValue": 0.3163156681145601
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/wave",
                "value": 3,
                "normalizedValue": 0.75
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/skew",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/shape",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/bias",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/phase",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/1/exp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/label",
                "value": "Env",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/loop",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoSync",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoMultiplier",
                "value": 5,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/tempoLock",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/2/period",
                "value": 463.09830083280417,
                "normalizedValue": 0.19151134703645523
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/label",
                "value": "Beat",
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/running",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/trigger",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gain",
                "value": 15.359999120235443,
                "normalizedValue": 0.6599999908357859
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/range",
                "value": 36.0,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/attack",
                "value": 22.999999709427353,
                "normalizedValue": 0.22999999709427354
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/release",
                "value": 31.056226618204697,
                "normalizedValue": 0.1762277691460818
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/slope",
                "value": 2.1000000536441803,
                "normalizedValue": 0.3400000035762787
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/threshold",
                "value": 0.4655172433704138,
                "normalizedValue": 0.4655172433704138
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/floor",
                "value": 0.5107665793188515,
                "normalizedValue": 0.5107665793188515
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/decay",
                "value": 304.0000021457672,
                "normalizedValue": 0.1900000013411045
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/minFreq",
                "value": 270.95684814453125,
                "normalizedValue": 0.33294529687216173
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/maxFreq",
                "value": 1337.302734375,
                "normalizedValue": 0.49625544471402083
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/gate",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/average",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "MODULATION",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/modulation/modulator/3/tap",
                "value": 0.0,
                "normalizedValue": 0.0
              }
            ]
          }
        ]
      },
      "midi": {
        "id": 25,
        "class": "heronarts.lx.midi.LXMidiEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "LX",
          "computerKeyboardEnabled": false
        },
        "children": {},
        "inputs": [],
        "surfaces": [],
        "mapping": []
      },
      "audio": {
        "id": 26,
        "class": "heronarts.lx.audio.LXAudioEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Audio",
          "enabled": true,
          "mode": 1
        },
        "children": {
          "input": {
            "id": 27,
            "class": "heronarts.lx.audio.LXAudioInput",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Input",
              "device": 1
            },
            "children": {}
          },
          "output": {
            "id": 28,
            "class": "heronarts.lx.audio.LXAudioOutput",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Output",
              "file": "Music\\3. Sleepy \u0026 Boo - Tangible.wav",
              "trigger": false,
              "looping": false,
              "play": false
            },
            "children": {}
          },
          "meter": {
            "id": 29,
            "class": "heronarts.lx.audio.GraphicMeter",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "Meter",
              "running": true,
              "trigger": false,
              "gain": 3.8400009870529175,
              "range": 48.0,
              "attack": 28.999999575316902,
              "release": 152.10001063495892,
              "slope": 4.5,
              "band-1": 0.0,
              "band-2": 0.0,
              "band-3": 0.0,
              "band-4": 0.0,
              "band-5": 0.0,
              "band-6": 0.0,
              "band-7": 0.0,
              "band-8": 0.0,
              "band-9": 0.0,
              "band-10": 0.0,
              "band-11": 0.0,
              "band-12": 0.0,
              "band-13": 0.0,
              "band-14": 0.0,
              "band-15": 0.0,
              "band-16": 0.0
            },
            "children": {}
          }
        }
      },
      "osc": {
        "id": 30,
        "class": "heronarts.lx.osc.LXOscEngine",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "OSC",
          "receiveHost": "0.0.0.0",
          "receivePort": 3030,
          "receiveActive": false,
          "transmitHost": "localhost",
          "transmitPort": 3131,
          "transmitActive": false
        },
        "children": {}
      }
    }
  },
  "externals": {
    "ui": {
      "audioExpanded": true,
      "paletteExpanded": true,
      "cameraExpanded": true,
      "clipViewVisible": false,
      "modulatorExpanded": {
        "34": true,
        "253": true,
        "258": true
      },
      "preview": {
        "mode": 0,
        "animation": false,
        "animationTime": 1000.0,
        "projection": 1,
        "perspective": 60.0,
        "depth": 1.0,
        "phiLock": true,
        "centerPoint": false,
        "camera": {
          "active": false,
          "radius": 546.359252273632,
          "theta": 0.060561953112483025,
          "phi": 0.15454212995246053,
          "x": 243.5,
          "y": 0.5,
          "z": 0.0
        },
        "cue": [
          {
            "active": false,
            "radius": 546.359252273632,
            "theta": 0.060561953112483025,
            "phi": 0.15454212995246053,
            "x": 243.5,
            "y": 0.5,
            "z": 0.0
          },
          {
            "active": false,
            "radius": 120.0,
            "theta": 0.0,
            "phi": 0.0,
            "x": 0.0,
            "y": 0.0,
            "z": 0.0
          },
          {
            "active": false,
            "radius": 120.0,
            "theta": 0.0,
            "phi": 0.0,
            "x": 0.0,
            "y": 0.0,
            "z": 0.0
          },
          {
            "active": false,
            "radius": 120.0,
            "theta": 0.0,
            "phi": 0.0,
            "x": 0.0,
            "y": 0.0,
            "z": 0.0
          },
          {
            "active": false,
            "radius": 120.0,
            "theta": 0.0,
            "phi": 0.0,
            "x": 0.0,
            "y": 0.0,
            "z": 0.0
          },
          {
            "active": false,
            "radius": 120.0,
            "theta": 0.0,
            "phi": 0.0,
            "x": 0.0,
            "y": 0.0,
            "z": 0.0
          }
        ],
        "focus": 0,
        "pointCloud": {
          "pointSize": 3.0
        },
        "grid": {
          "visible": false,
          "spacing": 100.0,
          "planes": 1,
          "size": 10,
          "x": 0.0,
          "y": 0.0,
          "z": 0.0
        }
      }
    }
  }
}