{
  "version": "0.2.1",
  "timestamp": 1622868179285,
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
        "jsonFixtureType": "GrassBase",
        "jsonParameters": {},
        "id": 149,
        "class": "heronarts.lx.structure.JsonFixture",
        "internal": {
          "modulationColor": 0
        },
        "parameters": {
          "label": "Grass Base 1",
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
          "fixtureType": "GrassBase",
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
          "focusedChannel": 0,
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
              "selected": true,
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
                  "enabled": true,
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
                "id": 195,
                "class": "heronarts.lx.clip.LXChannelClip",
                "internal": {
                  "modulationColor": 0
                },
                "parameters": {
                  "label": "Clip-2",
                  "running": false,
                  "trigger": false,
                  "length": 0.0,
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
                    "events": []
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
              "selected": false,
              "enabled": true,
              "cue": false,
              "fader": 1.0,
              "crossfadeGroup": 0,
              "blendMode": 3,
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
                  "gradientHue": -308.5714276134968,
                  "gradientSaturation": 42.8571455180645,
                  "gradientBrightness": -23.80952201783657,
                  "colorMode": 1,
                  "blendMode": 0,
                  "color1/brightness": 100.0,
                  "color1/saturation": 99.16666412353516,
                  "color1/hue": 0.0,
                  "color2/brightness": 76.19047798216343,
                  "color2/saturation": 100.0,
                  "color2/hue": 51.42857238650322,
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
              },
              {
                "id": 323,
                "class": "heronarts.lx.effect.StrobeEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Strobe",
                  "enabled": false,
                  "speed": 0.20249999262392526,
                  "depth": 0.2799999974668026,
                  "bias": 0.17999999597668648,
                  "waveshape": 3,
                  "tempoSync": true,
                  "tempoDivision": 5,
                  "tempoPhaseOffset": 0.0,
                  "minFrequency": 0.5,
                  "maxFrequency": 5.0
                },
                "children": {
                  "modulation": {
                    "id": 324,
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
                "id": 327,
                "class": "heronarts.lx.effect.BlurEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Blur",
                  "enabled": true,
                  "level": 0.2900000046938658,
                  "decay": 1.5437719170986188,
                  "mode": 3
                },
                "children": {
                  "modulation": {
                    "id": 328,
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
                  "speed": 0.5,
                  "variation": 31.999999843537807,
                  "duration": 9.000001475214958,
                  "sharp": 0.0,
                  "waveshape": 2,
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
              "arm": true,
              "selected": false,
              "enabled": true,
              "cue": false,
              "fader": 0.0,
              "crossfadeGroup": 0,
              "blendMode": 3,
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
                "id": 347,
                "class": "heronarts.lx.effect.SparkleEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Sparkle",
                  "enabled": true,
                  "amount": 1.0,
                  "density": 50.0,
                  "speed": 0.5299999993294477,
                  "variation": 25.0,
                  "duration": 80.00000044703484,
                  "sharp": 0.0,
                  "waveshape": 1,
                  "minInterval": 1.0,
                  "maxInterval": 1.0,
                  "minLevel": 75.0,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 348,
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
                "id": 350,
                "class": "heronarts.lx.effect.color.ColorizeEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": false,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Colorize",
                  "enabled": true,
                  "source": 0,
                  "gradientHue": 0.0,
                  "gradientSaturation": 19.0476194024086,
                  "gradientBrightness": 0.0,
                  "colorMode": 1,
                  "blendMode": 0,
                  "color1/brightness": 19.285717010498047,
                  "color1/saturation": 53.69047574698925,
                  "color1/hue": 99.0,
                  "color2/brightness": 19.285717010498047,
                  "color2/saturation": 72.73809514939785,
                  "color2/hue": 99.0,
                  "paletteIndex": 1,
                  "paletteStops": 5
                },
                "children": {
                  "modulation": {
                    "id": 351,
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
                "id": 353,
                "class": "heronarts.lx.effect.InvertEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Invert",
                  "enabled": true,
                  "amount": 1.0,
                  "redAmount": 1.0,
                  "greenAmount": 0.9253731360659003,
                  "blueAmount": 0.5671641887165606
                },
                "children": {
                  "modulation": {
                    "id": 354,
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
                "id": 356,
                "class": "heronarts.lx.effect.DynamicsEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": false,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Dynamics",
                  "enabled": true,
                  "ceiling": 0.35000001452863216,
                  "contrast": -0.35999999195337296,
                  "gain": 2.587599943110347,
                  "floor": 0.0,
                  "gate": 0.3399999924004078,
                  "shape": 0.0,
                  "red": 0.4999999962747097,
                  "green": 1.0,
                  "blue": 1.0
                },
                "children": {
                  "modulation": {
                    "id": 357,
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
            "patternIndex": -1,
            "patterns": []
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
            "basis": 0.8130870217953149
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
              "loop": true,
              "tempoSync": false,
              "tempoMultiplier": 5,
              "tempoLock": true,
              "period": 3563.868064648764
            },
            "children": {},
            "basis": 0.34363823185624176,
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
              "running": true,
              "trigger": false,
              "gain": 7.67999929189682,
              "range": 36.0,
              "attack": 22.999999709427353,
              "release": 31.056226618204697,
              "slope": 2.1000000536441803,
              "threshold": 0.4655172433704138,
              "floor": 0.5107665793188515,
              "decay": 304.0000021457672,
              "minFreq": 120.0,
              "maxFreq": 16601.603515625,
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
              "componentId": 183,
              "parameterPath": "pos",
              "path": "/mixer/channel/1/pattern/4/pos"
            },
            "id": 254,
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
          },
          {
            "source": {
              "id": 258,
              "path": "/modulation/modulator/3"
            },
            "target": {
              "componentId": 49,
              "parameterPath": "color/brightness",
              "path": "/mixer/channel/1/pattern/1/color/brightness"
            },
            "id": 259,
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
          },
          {
            "source": {
              "id": 34,
              "path": "/modulation/modulator/1"
            },
            "target": {
              "componentId": 49,
              "parameterPath": "color/brightness",
              "path": "/mixer/channel/1/pattern/1/color/brightness"
            },
            "id": 299,
            "class": "heronarts.lx.modulation.LXCompoundModulation",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LX",
              "enabled": true,
              "Polarity": 0,
              "Range": 0.8875000132247806
            },
            "children": {}
          }
        ],
        "triggers": []
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
          "autoCycleCursor": -1,
          "triggerSnapshotCycle": false
        },
        "children": {},
        "snapshots": []
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
          "enabled": false,
          "mode": 0
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
              "file": "",
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
              "running": false,
              "trigger": false,
              "gain": 17.280000686645508,
              "range": 48.0,
              "attack": 28.999999575316902,
              "release": 152.10001063495892,
              "slope": 4.5,
              "band-1": 0.05213996566914281,
              "band-2": 0.17714689058231248,
              "band-3": 0.3831914660651412,
              "band-4": 0.5178830064878741,
              "band-5": 0.5916843176588611,
              "band-6": 0.7618493165929342,
              "band-7": 0.826733347205206,
              "band-8": 0.6867450831879727,
              "band-9": 0.5055224666760421,
              "band-10": 0.5073009919036078,
              "band-11": 0.45993853856782607,
              "band-12": 0.5252565062167693,
              "band-13": 0.7145163511631047,
              "band-14": 0.8858412016318934,
              "band-15": 0.923992029110845,
              "band-16": 0.5570770666550677
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
        "projection": 0,
        "perspective": 60.0,
        "depth": 1.0,
        "phiLock": true,
        "centerPoint": false,
        "camera": {
          "active": false,
          "radius": 60.0,
          "theta": 0.5174825354479253,
          "phi": 0.06408843118697405,
          "x": 20.0,
          "y": 0.0,
          "z": 0.0
        },
        "cue": [
          {
            "active": false,
            "radius": 60.0,
            "theta": 0.5174825354479253,
            "phi": 0.06408843118697405,
            "x": 20.0,
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