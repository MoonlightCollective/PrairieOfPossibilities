{
  "version": "0.2.1",
  "timestamp": 1623014826746,
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
          "crossfader": 0.5,
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
              "focusedPattern": 2,
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
            "clips": [],
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
                "id": 318,
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
            "clips": [],
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
                  "xOffset": -0.142857126891613,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "scale": 0.42000000178813934,
                  "minScale": 1.0,
                  "maxScale": 10.0,
                  "xScale": 1.0,
                  "yScale": 1.0,
                  "zScale": 1.0,
                  "motion": true,
                  "motionSpeed": 0.24528302252292633,
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
                  "density": 12.959999688863755,
                  "speed": 1.0,
                  "variation": 59.99999921768904,
                  "duration": 9.000001475214958,
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
            "basis": 0.36527378661752746
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
              "Polarity": 1,
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
          "autoCycleCursor": 0,
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
              "file": "Music\\1. Sleepy \u0026 Boo - Decoding Reality.wav",
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