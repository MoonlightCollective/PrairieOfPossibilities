{
  "version": "0.2.1",
  "timestamp": 1623044002344,
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
          "crossfaderBlendMode": 2,
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
              "arm": true,
              "selected": false
            },
            "children": {},
            "effects": [],
            "clips": []
          }
        },
        "channels": [
          {
            "id": 37,
            "class": "heronarts.lx.mixer.LXChannel",
            "internal": {
              "modulationColor": 0,
              "controlsExpanded": true
            },
            "parameters": {
              "label": "Channel-1",
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
                "id": 154,
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
                  "blendMode": 0,
                  "color1/brightness": 59.1666145324707,
                  "color1/saturation": 95.0,
                  "color1/hue": 27.000001907348633,
                  "color2/brightness": 100.0,
                  "color2/saturation": 71.42857313156128,
                  "color2/hue": 188.04762455634773,
                  "paletteIndex": 1,
                  "paletteStops": 5
                },
                "children": {
                  "modulation": {
                    "id": 155,
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
                "id": 239,
                "class": "heronarts.lx.effect.SparkleEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Sparkle",
                  "enabled": false,
                  "amount": 0.8000000044703484,
                  "density": 312.26662923799023,
                  "speed": 0.7899999935179949,
                  "variation": 25.0,
                  "duration": 100.0,
                  "sharp": 0.0,
                  "waveshape": 0,
                  "minInterval": 1.0,
                  "maxInterval": 6.390999879501756,
                  "minLevel": 37.00000084936619,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 240,
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
                "id": 242,
                "class": "heronarts.lx.effect.BlurEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Blur",
                  "enabled": false,
                  "level": 0.5200000107288361,
                  "decay": 1.705324294439165,
                  "mode": 0
                },
                "children": {
                  "modulation": {
                    "id": 243,
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
                "id": 561,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-1",
                  "running": false,
                  "trigger": false,
                  "length": 863.0,
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
                        "patternIndex": 2
                      }
                    ]
                  }
                ]
              }
            ],
            "patternIndex": 0,
            "patterns": [
              {
                "id": 49,
                "class": "heronarts.lx.pattern.color.SolidPattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Solid",
                  "color/brightness": 0.0,
                  "color/saturation": 94.16666412353516,
                  "color/hue": 129.0,
                  "colorMode": 0,
                  "paletteIndex": 1
                },
                "children": {
                  "modulation": {
                    "id": 50,
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
                "id": 51,
                "class": "heronarts.lx.pattern.color.GradientPattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Gradient",
                  "xAmount": 1.0,
                  "yAmount": -1.0,
                  "zAmount": 0.0,
                  "xOffset": -1.0,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "colorMode": 1,
                  "blendMode": 1,
                  "gradient": 0.523809514939785,
                  "fixedColor/brightness": 100.0,
                  "fixedColor/saturation": 100.0,
                  "fixedColor/hue": 0.0,
                  "xMode": 0,
                  "yMode": 0,
                  "zMode": 0,
                  "paletteIndex": 3,
                  "paletteStops": 5,
                  "gradientRange": 360.0
                },
                "children": {
                  "modulation": {
                    "id": 52,
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
                "id": 152,
                "class": "heronarts.lx.pattern.texture.SparklePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Sparkle",
                  "density": 118.18011352347413,
                  "speed": 0.6899999976158142,
                  "variation": 34.9999999627471,
                  "duration": 100.0,
                  "sharp": 0.0,
                  "waveshape": 0,
                  "minInterval": 1.0,
                  "maxInterval": 1.0,
                  "baseLevel": 0.0,
                  "minLevel": 75.0,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 153,
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
                "id": 183,
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
                  "pos": 1.0,
                  "width": 0.3200000077486038
                },
                "children": {
                  "modulation": {
                    "id": 184,
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
                "id": 297,
                "class": "LXStudio$RGBPattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "RGB",
                  "red": 124.9500024318695,
                  "green": 255.0,
                  "blue": 112.20000319182873
                },
                "children": {
                  "modulation": {
                    "id": 298,
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
            "id": 300,
            "class": "heronarts.lx.mixer.LXChannel",
            "internal": {
              "modulationColor": 0,
              "controlsExpanded": true
            },
            "parameters": {
              "label": "Channel-2",
              "arm": false,
              "selected": true,
              "enabled": true,
              "cue": false,
              "fader": 1.0,
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
                "id": 318,
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
                  "gradientHue": 171.42856657505035,
                  "gradientSaturation": 42.8571455180645,
                  "gradientBrightness": -23.80952201783657,
                  "colorMode": 1,
                  "blendMode": 0,
                  "color1/brightness": 64.28571362048388,
                  "color1/saturation": 100.0,
                  "color1/hue": 131.09524108842015,
                  "color2/brightness": 40.476191602647305,
                  "color2/saturation": 100.0,
                  "color2/hue": 302.5238076634705,
                  "paletteIndex": 1,
                  "paletteStops": 5
                },
                "children": {
                  "modulation": {
                    "id": 319,
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
                "id": 563,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-2",
                  "running": false,
                  "trigger": false,
                  "length": 24513.0,
                  "loop": false
                },
                "children": {},
                "index": 1,
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
                      },
                      {
                        "cursor": 14433.0,
                        "patternIndex": 1
                      },
                      {
                        "cursor": 18560.0,
                        "patternIndex": 0
                      }
                    ]
                  },
                  {
                    "laneType": "parameter",
                    "events": [
                      {
                        "cursor": 8256.0,
                        "normalized": 0.9857142856344581
                      },
                      {
                        "cursor": 8256.0,
                        "normalized": 0.9714285712689161
                      },
                      {
                        "cursor": 8256.0,
                        "normalized": 0.9285714272409678
                      },
                      {
                        "cursor": 8289.0,
                        "normalized": 0.9142857128754258
                      },
                      {
                        "cursor": 8289.0,
                        "normalized": 0.8714285688474774
                      },
                      {
                        "cursor": 8320.0,
                        "normalized": 0.8571428544819355
                      },
                      {
                        "cursor": 8320.0,
                        "normalized": 0.8285714257508516
                      },
                      {
                        "cursor": 8320.0,
                        "normalized": 0.7857142817229033
                      },
                      {
                        "cursor": 8352.0,
                        "normalized": 0.7571428529918194
                      },
                      {
                        "cursor": 8352.0,
                        "normalized": 0.7428571386262774
                      },
                      {
                        "cursor": 8384.0,
                        "normalized": 0.7285714242607355
                      },
                      {
                        "cursor": 8384.0,
                        "normalized": 0.6999999955296516
                      },
                      {
                        "cursor": 8384.0,
                        "normalized": 0.6857142811641097
                      },
                      {
                        "cursor": 8417.0,
                        "normalized": 0.6714285667985678
                      },
                      {
                        "cursor": 8417.0,
                        "normalized": 0.6428571380674839
                      },
                      {
                        "cursor": 8449.0,
                        "normalized": 0.6142857093364
                      },
                      {
                        "cursor": 8481.0,
                        "normalized": 0.5999999949708581
                      },
                      {
                        "cursor": 8481.0,
                        "normalized": 0.5857142806053162
                      },
                      {
                        "cursor": 8545.0,
                        "normalized": 0.5714285662397742
                      },
                      {
                        "cursor": 8545.0,
                        "normalized": 0.5571428518742323
                      },
                      {
                        "cursor": 8577.0,
                        "normalized": 0.5428571375086904
                      },
                      {
                        "cursor": 8577.0,
                        "normalized": 0.5285714231431484
                      },
                      {
                        "cursor": 8608.0,
                        "normalized": 0.5142857087776065
                      },
                      {
                        "cursor": 8641.0,
                        "normalized": 0.4857142800465226
                      },
                      {
                        "cursor": 8641.0,
                        "normalized": 0.4714285656809807
                      },
                      {
                        "cursor": 8672.0,
                        "normalized": 0.45714285131543875
                      },
                      {
                        "cursor": 8705.0,
                        "normalized": 0.4428571369498968
                      },
                      {
                        "cursor": 8705.0,
                        "normalized": 0.4285714225843549
                      },
                      {
                        "cursor": 8737.0,
                        "normalized": 0.41428570821881294
                      },
                      {
                        "cursor": 8737.0,
                        "normalized": 0.399999993853271
                      },
                      {
                        "cursor": 8768.0,
                        "normalized": 0.3857142794877291
                      },
                      {
                        "cursor": 8800.0,
                        "normalized": 0.37142856512218714
                      },
                      {
                        "cursor": 8800.0,
                        "normalized": 0.3571428507566452
                      },
                      {
                        "cursor": 8832.0,
                        "normalized": 0.34285713639110327
                      },
                      {
                        "cursor": 8832.0,
                        "normalized": 0.32857142202556133
                      },
                      {
                        "cursor": 8864.0,
                        "normalized": 0.3142857076600194
                      },
                      {
                        "cursor": 8897.0,
                        "normalized": 0.29999999329447746
                      },
                      {
                        "cursor": 8897.0,
                        "normalized": 0.28571427892893553
                      },
                      {
                        "cursor": 8897.0,
                        "normalized": 0.25714285019785166
                      },
                      {
                        "cursor": 8928.0,
                        "normalized": 0.24285713583230972
                      },
                      {
                        "cursor": 8961.0,
                        "normalized": 0.2285714214667678
                      },
                      {
                        "cursor": 8961.0,
                        "normalized": 0.21428570710122585
                      },
                      {
                        "cursor": 8992.0,
                        "normalized": 0.19999999273568392
                      },
                      {
                        "cursor": 8992.0,
                        "normalized": 0.18571427837014198
                      },
                      {
                        "cursor": 9216.0,
                        "normalized": 0.19999999273568392
                      },
                      {
                        "cursor": 9248.0,
                        "normalized": 0.2285714214667678
                      },
                      {
                        "cursor": 9280.0,
                        "normalized": 0.24285713583230972
                      },
                      {
                        "cursor": 9280.0,
                        "normalized": 0.2857142798602581
                      },
                      {
                        "cursor": 9280.0,
                        "normalized": 0.3285714238882065
                      },
                      {
                        "cursor": 9312.0,
                        "normalized": 0.35714285261929035
                      },
                      {
                        "cursor": 9312.0,
                        "normalized": 0.3714285669848323
                      },
                      {
                        "cursor": 9344.0,
                        "normalized": 0.39999999571591616
                      },
                      {
                        "cursor": 9344.0,
                        "normalized": 0.428571424447
                      },
                      {
                        "cursor": 9376.0,
                        "normalized": 0.4571428531780839
                      },
                      {
                        "cursor": 9408.0,
                        "normalized": 0.48571428190916777
                      },
                      {
                        "cursor": 9408.0,
                        "normalized": 0.4999999962747097
                      },
                      {
                        "cursor": 9408.0,
                        "normalized": 0.5142857106402516
                      },
                      {
                        "cursor": 9441.0,
                        "normalized": 0.5428571393713355
                      },
                      {
                        "cursor": 9441.0,
                        "normalized": 0.5714285681024194
                      },
                      {
                        "cursor": 9472.0,
                        "normalized": 0.5999999968335032
                      },
                      {
                        "cursor": 9472.0,
                        "normalized": 0.6142857111990452
                      },
                      {
                        "cursor": 9505.0,
                        "normalized": 0.6285714255645871
                      },
                      {
                        "cursor": 9505.0,
                        "normalized": 0.642857139930129
                      },
                      {
                        "cursor": 9537.0,
                        "normalized": 0.657142854295671
                      },
                      {
                        "cursor": 9537.0,
                        "normalized": 0.6714285686612129
                      },
                      {
                        "cursor": 9568.0,
                        "normalized": 0.6857142830267549
                      },
                      {
                        "cursor": 9568.0,
                        "normalized": 0.6999999973922968
                      },
                      {
                        "cursor": 9568.0,
                        "normalized": 0.7142857117578387
                      },
                      {
                        "cursor": 9600.0,
                        "normalized": 0.7285714261233807
                      },
                      {
                        "cursor": 9600.0,
                        "normalized": 0.7571428548544645
                      },
                      {
                        "cursor": 9633.0,
                        "normalized": 0.7714285692200065
                      },
                      {
                        "cursor": 9664.0,
                        "normalized": 0.7857142835855484
                      },
                      {
                        "cursor": 9664.0,
                        "normalized": 0.7999999979510903
                      },
                      {
                        "cursor": 9696.0,
                        "normalized": 0.8142857123166323
                      },
                      {
                        "cursor": 9696.0,
                        "normalized": 0.8285714266821742
                      },
                      {
                        "cursor": 9696.0,
                        "normalized": 0.8428571410477161
                      },
                      {
                        "cursor": 9760.0,
                        "normalized": 0.8571428554132581
                      },
                      {
                        "cursor": 9760.0,
                        "normalized": 0.8714285697788
                      },
                      {
                        "cursor": 9792.0,
                        "normalized": 0.885714284144342
                      },
                      {
                        "cursor": 9824.0,
                        "normalized": 0.8999999985098839
                      },
                      {
                        "cursor": 9888.0,
                        "normalized": 0.885714284144342
                      },
                      {
                        "cursor": 9920.0,
                        "normalized": 0.8714285697788
                      },
                      {
                        "cursor": 9920.0,
                        "normalized": 0.8571428554132581
                      },
                      {
                        "cursor": 9920.0,
                        "normalized": 0.8428571410477161
                      },
                      {
                        "cursor": 9952.0,
                        "normalized": 0.8142857123166323
                      },
                      {
                        "cursor": 9952.0,
                        "normalized": 0.7999999979510903
                      },
                      {
                        "cursor": 9952.0,
                        "normalized": 0.7714285692200065
                      },
                      {
                        "cursor": 9984.0,
                        "normalized": 0.7571428548544645
                      },
                      {
                        "cursor": 9984.0,
                        "normalized": 0.7428571404889226
                      },
                      {
                        "cursor": 9984.0,
                        "normalized": 0.7285714261233807
                      },
                      {
                        "cursor": 9984.0,
                        "normalized": 0.7142857117578387
                      },
                      {
                        "cursor": 10016.0,
                        "normalized": 0.6714285677298903
                      },
                      {
                        "cursor": 10048.0,
                        "normalized": 0.6571428533643484
                      },
                      {
                        "cursor": 10048.0,
                        "normalized": 0.6142857093364
                      },
                      {
                        "cursor": 10048.0,
                        "normalized": 0.5571428518742323
                      },
                      {
                        "cursor": 10048.0,
                        "normalized": 0.5428571375086904
                      },
                      {
                        "cursor": 10080.0,
                        "normalized": 0.499999993480742
                      },
                      {
                        "cursor": 10080.0,
                        "normalized": 0.48571427911520004
                      },
                      {
                        "cursor": 10080.0,
                        "normalized": 0.4714285647496581
                      },
                      {
                        "cursor": 10112.0,
                        "normalized": 0.42857142072170973
                      },
                      {
                        "cursor": 10112.0,
                        "normalized": 0.4142857063561678
                      },
                      {
                        "cursor": 10112.0,
                        "normalized": 0.3857142776250839
                      },
                      {
                        "cursor": 10145.0,
                        "normalized": 0.371428563259542
                      },
                      {
                        "cursor": 10145.0,
                        "normalized": 0.3428571345284581
                      },
                      {
                        "cursor": 10177.0,
                        "normalized": 0.31428570579737425
                      },
                      {
                        "cursor": 10177.0,
                        "normalized": 0.2857142770662904
                      },
                      {
                        "cursor": 10208.0,
                        "normalized": 0.27142856270074844
                      },
                      {
                        "cursor": 10208.0,
                        "normalized": 0.2571428483352065
                      },
                      {
                        "cursor": 10240.0,
                        "normalized": 0.24285713396966457
                      },
                      {
                        "cursor": 10240.0,
                        "normalized": 0.2142857052385807
                      },
                      {
                        "cursor": 10273.0,
                        "normalized": 0.19999999087303877
                      },
                      {
                        "cursor": 10273.0,
                        "normalized": 0.1714285621419549
                      },
                      {
                        "cursor": 10305.0,
                        "normalized": 0.15714284777641296
                      },
                      {
                        "cursor": 10305.0,
                        "normalized": 0.14285713341087103
                      },
                      {
                        "cursor": 10337.0,
                        "normalized": 0.1285714190453291
                      },
                      {
                        "cursor": 10337.0,
                        "normalized": 0.11428570467978716
                      },
                      {
                        "cursor": 10337.0,
                        "normalized": 0.09999999031424522
                      },
                      {
                        "cursor": 10369.0,
                        "normalized": 0.08571427594870329
                      },
                      {
                        "cursor": 10400.0,
                        "normalized": 0.07142856158316135
                      },
                      {
                        "cursor": 10400.0,
                        "normalized": 0.05714284721761942
                      },
                      {
                        "cursor": 10400.0,
                        "normalized": 0.042857132852077484
                      },
                      {
                        "cursor": 10432.0,
                        "normalized": 0.014285704120993614
                      },
                      {
                        "cursor": 10464.0,
                        "normalized": 0.0
                      },
                      {
                        "cursor": 10689.0,
                        "normalized": 0.02857142873108387
                      },
                      {
                        "cursor": 10689.0,
                        "normalized": 0.05714285746216774
                      },
                      {
                        "cursor": 10689.0,
                        "normalized": 0.08571428619325161
                      },
                      {
                        "cursor": 10720.0,
                        "normalized": 0.14285714365541935
                      },
                      {
                        "cursor": 10753.0,
                        "normalized": 0.18571428768336773
                      },
                      {
                        "cursor": 10753.0,
                        "normalized": 0.2142857164144516
                      },
                      {
                        "cursor": 10753.0,
                        "normalized": 0.24285714514553547
                      },
                      {
                        "cursor": 10784.0,
                        "normalized": 0.27142857387661934
                      },
                      {
                        "cursor": 10784.0,
                        "normalized": 0.3000000026077032
                      },
                      {
                        "cursor": 10784.0,
                        "normalized": 0.31428571697324514
                      },
                      {
                        "cursor": 10817.0,
                        "normalized": 0.342857145704329
                      },
                      {
                        "cursor": 10817.0,
                        "normalized": 0.35714286006987095
                      },
                      {
                        "cursor": 10817.0,
                        "normalized": 0.3714285744354129
                      },
                      {
                        "cursor": 10848.0,
                        "normalized": 0.3857142888009548
                      },
                      {
                        "cursor": 10848.0,
                        "normalized": 0.40000000316649675
                      },
                      {
                        "cursor": 10881.0,
                        "normalized": 0.44285714719444513
                      },
                      {
                        "cursor": 10881.0,
                        "normalized": 0.45714286155998707
                      },
                      {
                        "cursor": 10913.0,
                        "normalized": 0.471428575925529
                      },
                      {
                        "cursor": 10913.0,
                        "normalized": 0.48571429029107094
                      },
                      {
                        "cursor": 10944.0,
                        "normalized": 0.5000000046566129
                      },
                      {
                        "cursor": 10977.0,
                        "normalized": 0.5142857190221548
                      },
                      {
                        "cursor": 10977.0,
                        "normalized": 0.5428571477532387
                      },
                      {
                        "cursor": 11008.0,
                        "normalized": 0.5571428621187806
                      },
                      {
                        "cursor": 11008.0,
                        "normalized": 0.5714285764843225
                      },
                      {
                        "cursor": 11041.0,
                        "normalized": 0.5857142908498645
                      },
                      {
                        "cursor": 11041.0,
                        "normalized": 0.6000000052154064
                      },
                      {
                        "cursor": 11041.0,
                        "normalized": 0.6142857195809484
                      },
                      {
                        "cursor": 11041.0,
                        "normalized": 0.6285714339464903
                      },
                      {
                        "cursor": 11072.0,
                        "normalized": 0.6428571483120322
                      },
                      {
                        "cursor": 11105.0,
                        "normalized": 0.6714285770431161
                      },
                      {
                        "cursor": 11105.0,
                        "normalized": 0.685714291408658
                      },
                      {
                        "cursor": 11105.0,
                        "normalized": 0.7000000057742
                      },
                      {
                        "cursor": 11105.0,
                        "normalized": 0.7142857201397419
                      },
                      {
                        "cursor": 11105.0,
                        "normalized": 0.7285714345052838
                      },
                      {
                        "cursor": 11136.0,
                        "normalized": 0.7571428632363677
                      },
                      {
                        "cursor": 11169.0,
                        "normalized": 0.7714285776019096
                      },
                      {
                        "cursor": 11169.0,
                        "normalized": 0.7857142919674516
                      },
                      {
                        "cursor": 11169.0,
                        "normalized": 0.8000000063329935
                      },
                      {
                        "cursor": 11265.0,
                        "normalized": 0.7857142919674516
                      },
                      {
                        "cursor": 11265.0,
                        "normalized": 0.7571428632363677
                      },
                      {
                        "cursor": 11297.0,
                        "normalized": 0.7285714345052838
                      },
                      {
                        "cursor": 11329.0,
                        "normalized": 0.7142857201397419
                      },
                      {
                        "cursor": 11329.0,
                        "normalized": 0.7000000057742
                      },
                      {
                        "cursor": 11360.0,
                        "normalized": 0.685714291408658
                      },
                      {
                        "cursor": 11392.0,
                        "normalized": 0.6714285770431161
                      },
                      {
                        "cursor": 11392.0,
                        "normalized": 0.6285714330151677
                      },
                      {
                        "cursor": 11392.0,
                        "normalized": 0.6142857186496258
                      },
                      {
                        "cursor": 11424.0,
                        "normalized": 0.6000000042840838
                      },
                      {
                        "cursor": 11424.0,
                        "normalized": 0.571428575553
                      },
                      {
                        "cursor": 11424.0,
                        "normalized": 0.557142861187458
                      },
                      {
                        "cursor": 11457.0,
                        "normalized": 0.5428571468219161
                      },
                      {
                        "cursor": 11489.0,
                        "normalized": 0.5285714324563742
                      },
                      {
                        "cursor": 11489.0,
                        "normalized": 0.5142857180908322
                      },
                      {
                        "cursor": 11616.0,
                        "normalized": 0.5285714324563742
                      },
                      {
                        "cursor": 11648.0,
                        "normalized": 0.5428571468219161
                      },
                      {
                        "cursor": 11648.0,
                        "normalized": 0.571428575553
                      },
                      {
                        "cursor": 11685.0,
                        "normalized": 0.6000000042840838
                      },
                      {
                        "cursor": 11712.0,
                        "normalized": 0.6142857186496258
                      },
                      {
                        "cursor": 11712.0,
                        "normalized": 0.6285714330151677
                      },
                      {
                        "cursor": 11712.0,
                        "normalized": 0.6428571473807096
                      },
                      {
                        "cursor": 11712.0,
                        "normalized": 0.685714291408658
                      },
                      {
                        "cursor": 11712.0,
                        "normalized": 0.7000000057742
                      },
                      {
                        "cursor": 11744.0,
                        "normalized": 0.7428571498021483
                      },
                      {
                        "cursor": 11744.0,
                        "normalized": 0.8000000072643161
                      },
                      {
                        "cursor": 11776.0,
                        "normalized": 0.814285721629858
                      },
                      {
                        "cursor": 11776.0,
                        "normalized": 0.8428571503609419
                      },
                      {
                        "cursor": 11808.0,
                        "normalized": 0.8714285790920258
                      },
                      {
                        "cursor": 11808.0,
                        "normalized": 0.8857142934575677
                      },
                      {
                        "cursor": 11840.0,
                        "normalized": 0.9000000078231096
                      },
                      {
                        "cursor": 11840.0,
                        "normalized": 0.9142857221886516
                      },
                      {
                        "cursor": 11872.0,
                        "normalized": 0.9428571509197354
                      },
                      {
                        "cursor": 11872.0,
                        "normalized": 0.9714285796508193
                      },
                      {
                        "cursor": 11872.0,
                        "normalized": 0.9857142940163612
                      },
                      {
                        "cursor": 11904.0,
                        "normalized": 1.0
                      }
                    ],
                    "path": "/fader",
                    "componentId": 300,
                    "parameterPath": "fader"
                  }
                ]
              }
            ],
            "patternIndex": 0,
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
                  "midpoint": 62.99999970942736,
                  "contrast": 100.0,
                  "xOffset": -1.0,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "scale": 0.3300000037997961,
                  "minScale": 1.0,
                  "maxScale": 10.0,
                  "xScale": 1.0,
                  "yScale": 1.0,
                  "zScale": 1.0,
                  "motion": true,
                  "motionSpeed": 0.2075471580028534,
                  "motionSpeedRange": 128.0,
                  "xMotion": 0.5714285634458065,
                  "yMotion": 0.7142857275903225,
                  "zMotion": 1.0,
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
                  "density": 33.63999892830849,
                  "speed": 1.0,
                  "variation": 59.99999921768904,
                  "duration": 20.0000012293458,
                  "sharp": 0.0,
                  "waveshape": 1,
                  "minInterval": 16.573999651893974,
                  "maxInterval": 8.18799983933568,
                  "baseLevel": 53.000001050531864,
                  "minLevel": 81.99999984353781,
                  "maxLevel": 82.00000040233135
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
              "selected": false,
              "enabled": true,
              "cue": false,
              "fader": 0.0,
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
                  "enabled": true,
                  "level": 1.0,
                  "decay": 0.35986165653994706,
                  "mode": 1
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
              }
            ],
            "clips": [],
            "patternIndex": 0,
            "patterns": [
              {
                "id": 464,
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
                  "pos": 0.0,
                  "width": 0.25999999418854713
                },
                "children": {
                  "modulation": {
                    "id": 465,
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
              "running": true,
              "trigger": false,
              "loop": true,
              "tempoSync": false,
              "tempoMultiplier": 5,
              "tempoLock": true,
              "clockMode": 0,
              "periodFast": 29922.494971874057,
              "periodSlow": 10000.0,
              "wave": 0,
              "skew": 0.0,
              "shape": 0.0,
              "bias": 0.0,
              "phase": 0.0,
              "exp": 0.0
            },
            "children": {},
            "basis": 0.4042211545856696
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
              "minFreq": 270.95684814453125,
              "maxFreq": 1337.302734375,
              "gate": false,
              "average": 0.0,
              "tap": false
            },
            "children": {}
          }
        ],
        "modulations": [
          {
            "source": {
              "id": 253,
              "path": "/modulation/modulator/2"
            },
            "target": {
              "componentId": 464,
              "parameterPath": "pos",
              "path": "/mixer/channel/3/pattern/1/pos"
            },
            "id": 466,
            "class": "heronarts.lx.modulation.LXCompoundModulation",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LX",
              "enabled": true,
              "Polarity": 0,
              "Range": 1.0
            },
            "children": {}
          }
        ],
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
          "autoCycleTimeSecs": 60.0,
          "autoCycleCursor": 2,
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
                "parameterPath": "/lx/mixer/channel/1/pattern/1/color/brightness",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/color/saturation",
                "value": 94.16666412353516,
                "normalizedValue": 0.9416666412353516
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/color/hue",
                "value": 129.0,
                "normalizedValue": 0.3593314763231198
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientHue",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientSaturation",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientBrightness",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/brightness",
                "value": 59.1666145324707,
                "normalizedValue": 0.5916661453247071
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/saturation",
                "value": 95.0,
                "normalizedValue": 0.95
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/hue",
                "value": 27.000001907348633,
                "normalizedValue": 0.0752089189619739
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/brightness",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/saturation",
                "value": 71.42857313156128,
                "normalizedValue": 0.7142857313156128
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/hue",
                "value": 188.04762455634773,
                "normalizedValue": 0.5238095391541719
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/3/enabled",
                "value": 0.0,
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/2/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientHue",
                "value": 205.71428149938583,
                "normalizedValue": 0.7857142798602581
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientSaturation",
                "value": 42.8571455180645,
                "normalizedValue": 0.7142857275903225
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientBrightness",
                "value": -23.80952201783657,
                "normalizedValue": 0.38095238991081715
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/colorMode",
                "value": 1,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/brightness",
                "value": 49.64287567138672,
                "normalizedValue": 0.4964287567138672
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/saturation",
                "value": 95.83333587646484,
                "normalizedValue": 0.9583333587646484
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/hue",
                "value": 12.000000953674316,
                "normalizedValue": 0.03342618650048556
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/brightness",
                "value": 25.833353653550148,
                "normalizedValue": 0.2583335365355015
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/hue",
                "value": 217.71428245306015,
                "normalizedValue": 0.6064464692285798
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
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
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/3/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "parameterPath": "/lx/mixer/channel/3/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/mode",
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
                "activePatternIndex": 2
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/density",
                "value": 118.18011352347413,
                "normalizedValue": 0.5435533863464428
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/speed",
                "value": 0.6899999976158142,
                "normalizedValue": 0.6899999976158142
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/variation",
                "value": 34.9999999627471,
                "normalizedValue": 0.34999999962747097
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/duration",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/waveshape",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/baseLevel",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minLevel",
                "value": 75.0,
                "normalizedValue": 0.75
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxLevel",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientHue",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientSaturation",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientBrightness",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/brightness",
                "value": 59.1666145324707,
                "normalizedValue": 0.5916661453247071
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/saturation",
                "value": 95.0,
                "normalizedValue": 0.95
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/hue",
                "value": 27.000001907348633,
                "normalizedValue": 0.0752089189619739
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/brightness",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/saturation",
                "value": 71.42857313156128,
                "normalizedValue": 0.7142857313156128
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/hue",
                "value": 188.04762455634773,
                "normalizedValue": 0.5238095391541719
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/3/enabled",
                "value": 0.0,
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/2/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientHue",
                "value": 205.71428149938583,
                "normalizedValue": 0.7857142798602581
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientSaturation",
                "value": 42.8571455180645,
                "normalizedValue": 0.7142857275903225
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientBrightness",
                "value": -23.80952201783657,
                "normalizedValue": 0.38095238991081715
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/colorMode",
                "value": 1,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/brightness",
                "value": 49.64287567138672,
                "normalizedValue": 0.4964287567138672
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/saturation",
                "value": 95.83333587646484,
                "normalizedValue": 0.9583333587646484
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/hue",
                "value": 12.000000953674316,
                "normalizedValue": 0.03342618650048556
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/brightness",
                "value": 25.833353653550148,
                "normalizedValue": 0.2583335365355015
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/hue",
                "value": 217.71428245306015,
                "normalizedValue": 0.6064464692285798
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
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
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/3/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "parameterPath": "/lx/mixer/channel/3/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/mode",
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
                "value": 1,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/1",
                "activePatternIndex": 2
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/density",
                "value": 118.18011352347413,
                "normalizedValue": 0.5435533863464428
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/speed",
                "value": 0.6899999976158142,
                "normalizedValue": 0.6899999976158142
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/variation",
                "value": 34.9999999627471,
                "normalizedValue": 0.34999999962747097
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/duration",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/waveshape",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/baseLevel",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minLevel",
                "value": 75.0,
                "normalizedValue": 0.75
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxLevel",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/enabled",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientHue",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientSaturation",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/gradientBrightness",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/colorMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/brightness",
                "value": 59.1666145324707,
                "normalizedValue": 0.5916661453247071
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/saturation",
                "value": 95.0,
                "normalizedValue": 0.95
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color1/hue",
                "value": 27.000001907348633,
                "normalizedValue": 0.0752089189619739
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/brightness",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/saturation",
                "value": 71.42857313156128,
                "normalizedValue": 0.7142857313156128
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/color2/hue",
                "value": 188.04762455634773,
                "normalizedValue": 0.5238095391541719
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/2/enabled",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/3/enabled",
                "value": 0.0,
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
                "value": 2,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "ACTIVE_PATTERN",
                "enabled": true,
                "channelPath": "/lx/mixer/channel/2",
                "activePatternIndex": 0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/midpoint",
                "value": 62.99999970942736,
                "normalizedValue": 0.6299999970942736
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/contrast",
                "value": 100.0,
                "normalizedValue": 0.4472135954999579
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xOffset",
                "value": -0.142857126891613,
                "normalizedValue": 0.4285714365541935
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zOffset",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/scale",
                "value": 0.42000000178813934,
                "normalizedValue": 0.42000000178813934
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/minScale",
                "value": 1.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/maxScale",
                "value": 10.0,
                "normalizedValue": 0.0949157995752499
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zScale",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeed",
                "value": 0.24528302252292633,
                "normalizedValue": 0.6226415112614632
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/motionSpeedRange",
                "value": 128.0,
                "normalizedValue": 0.4980392156862745
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMotion",
                "value": 0.5714285634458065,
                "normalizedValue": 0.7857142817229033
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMotion",
                "value": 0.7142857275903225,
                "normalizedValue": 0.8571428637951612
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMotion",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/algorithm",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/seed",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/octaves",
                "value": 3,
                "normalizedValue": 0.2857142857142857
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/lacunarity",
                "value": 2.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/gain",
                "value": 0.5,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/ridgeOffset",
                "value": 0.9,
                "normalizedValue": 0.45
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/xMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/yMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/zMode",
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/2/effect/1/source",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientHue",
                "value": 171.42856657505035,
                "normalizedValue": 0.7380952313542366
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientSaturation",
                "value": 42.8571455180645,
                "normalizedValue": 0.7142857275903225
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/gradientBrightness",
                "value": -23.80952201783657,
                "normalizedValue": 0.38095238991081715
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/colorMode",
                "value": 1,
                "normalizedValue": 0.3333333333333333
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/blendMode",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/brightness",
                "value": 64.28571362048388,
                "normalizedValue": 0.6428571362048388
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color1/hue",
                "value": 131.09524108842015,
                "normalizedValue": 0.3651678024747079
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/brightness",
                "value": 40.476191602647305,
                "normalizedValue": 0.40476191602647305
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/saturation",
                "value": 100.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/color2/hue",
                "value": 302.5238076634705,
                "normalizedValue": 0.8426847010124526
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteIndex",
                "value": 1,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/effect/1/paletteStops",
                "value": 5,
                "normalizedValue": 1.0
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
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/3/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "parameterPath": "/lx/mixer/channel/3/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/mode",
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
                "activePatternIndex": 2
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/density",
                "value": 181.46966413777469,
                "normalizedValue": 0.6735533834407164
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/speed",
                "value": 0.7200000062584877,
                "normalizedValue": 0.7200000062584877
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/variation",
                "value": 34.9999999627471,
                "normalizedValue": 0.34999999962747097
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/duration",
                "value": 83.00000037997961,
                "normalizedValue": 0.8300000037997961
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/waveshape",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxInterval",
                "value": 1.0,
                "normalizedValue": 0.015025041736227046
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/baseLevel",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/minLevel",
                "value": 75.0,
                "normalizedValue": 0.75
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/pattern/3/maxLevel",
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
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/1/effect/3/enabled",
                "value": 0.0,
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
                "activePatternIndex": 1
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/density",
                "value": 12.959999688863755,
                "normalizedValue": 0.17999999783933163
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/speed",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/variation",
                "value": 59.99999921768904,
                "normalizedValue": 0.5999999921768904
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/duration",
                "value": 9.000001475214958,
                "normalizedValue": 0.09000001475214958
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/sharp",
                "value": 0.0,
                "normalizedValue": 0.5
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/waveshape",
                "value": 1,
                "normalizedValue": 0.25
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/minInterval",
                "value": 16.573999651893974,
                "normalizedValue": 0.2750250359247742
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/maxInterval",
                "value": 8.18799983933568,
                "normalizedValue": 0.13502503905401803
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/baseLevel",
                "value": 53.000001050531864,
                "normalizedValue": 0.5300000105053186
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/minLevel",
                "value": 81.99999984353781,
                "normalizedValue": 0.8199999984353781
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/2/maxLevel",
                "value": 82.00000040233135,
                "normalizedValue": 0.8200000040233135
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
                "value": 0,
                "normalizedValue": 0.0
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
                "parameterPath": "/lx/mixer/channel/3/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "parameterPath": "/lx/mixer/channel/3/effect/1/level",
                "value": 1.0,
                "normalizedValue": 1.0
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/decay",
                "value": 0.35986165653994706,
                "normalizedValue": 0.17999999597668656
              },
              {
                "scope": "EFFECTS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/3/effect/1/mode",
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