{
  "version": "0.2.1",
  "timestamp": 1623052160920,
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
              "fader": 0.9857142856344581,
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
                "id": 579,
                "class": "heronarts.lx.effect.HueSaturationEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Hue + Saturation",
                  "enabled": true,
                  "hue": 203.88985033880954,
                  "saturation": 76.36363711208105,
                  "brightness": -3.6363663151860237
                },
                "children": {
                  "modulation": {
                    "id": 580,
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
                        "cursor": 2335.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 4864.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 7327.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 9663.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 12160.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 13407.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 14591.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 17568.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 19488.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 21887.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 24352.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 26752.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 29248.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 31839.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 34304.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 36703.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 39200.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 41600.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 43135.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 44095.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 46528.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 49088.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 51552.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 53952.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 56448.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 59007.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 61440.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 63967.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 66368.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 68960.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 71487.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 73280.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 74016.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 76543.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 79071.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 81472.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 83008.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 84287.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 86719.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 89280.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 91680.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 93280.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 94303.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 96768.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 98176.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 101760.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 103168.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 104351.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 106880.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 108223.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 109695.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 111712.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 113119.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 114335.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 119263.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 121823.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 123423.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 124351.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 126783.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 128159.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 129408.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 131968.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 133471.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 134527.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 137087.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 139647.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 142143.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 143583.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 145312.0,
                        "normalized": 0.931039936733887
                      },
                      {
                        "cursor": 147136.0,
                        "normalized": 0.831039936733887
                      },
                      {
                        "cursor": 148576.0,
                        "normalized": 0.731039936733887
                      },
                      {
                        "cursor": 150015.0,
                        "normalized": 0.831039936733887
                      }
                    ],
                    "path": "/effect/1/hue",
                    "componentId": 579,
                    "parameterPath": "hue"
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
                  "midpoint": 33.000000193715096,
                  "contrast": 204.79999084472666,
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
                  "motionSpeed": 0.403018857240677,
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
                  "density": 38.4399987435341,
                  "speed": 0.8500000033527613,
                  "variation": 48.9999994635582,
                  "duration": 20.0000012293458,
                  "sharp": 0.29999999329447746,
                  "waveshape": 1,
                  "minInterval": 16.573999651893974,
                  "maxInterval": 3.69399991966784,
                  "baseLevel": 20.000001788139343,
                  "minLevel": 51.00000090897083,
                  "maxLevel": 78.00000067800283
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
                  "level": 0.29000001586973667,
                  "decay": 0.255719023523255,
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
                  },
                  {
                    "laneType": "parameter",
                    "events": [
                      {
                        "cursor": 29440.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 29471.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 29504.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 29504.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 29504.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 29567.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 29567.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 29567.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 29599.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 29632.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 29663.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 29728.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 29792.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 29888.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 29888.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 29951.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 29983.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 30080.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 30111.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 30111.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 30175.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 30207.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 30240.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 30240.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 30304.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 30304.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 30367.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 30367.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 30431.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 30431.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 30495.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 30528.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 30560.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 30592.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 30655.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 30655.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 30688.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 30720.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 30751.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 30783.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 30783.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 30816.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 30847.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 30847.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 30879.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 30911.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 30911.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 30944.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 30944.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 30975.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 31008.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 31040.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 31071.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 31103.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 31103.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 31136.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 31167.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 31167.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 31167.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 31199.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 31199.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 31231.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 31231.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 31264.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 31296.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 31296.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 31296.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 31328.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 31359.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 31359.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 31392.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 31392.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 31392.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 31424.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 31455.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 31487.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 31487.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 31487.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 31520.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 31520.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 31551.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 31551.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 31583.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 31583.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 31583.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 31616.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 31616.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 31648.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 31904.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 31936.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 31936.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 31936.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 31968.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 32000.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 32000.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 32000.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 32032.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 32063.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 32063.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 32095.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 32128.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 32128.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 32128.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 32159.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 32159.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 32191.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 32191.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 32224.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 32256.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 32256.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 32288.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 32319.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 32319.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 32352.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 32352.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 32383.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 32383.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 32415.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 32415.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 32448.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 32480.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 32512.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 32544.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 32544.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 32576.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 32640.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 32671.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 32703.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 32735.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 32735.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 32767.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 32799.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 32799.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 32832.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 32863.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 32863.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 32863.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 32895.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 32928.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 32928.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 32960.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 32991.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 32991.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 33023.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 33056.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 33088.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 33120.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 33120.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 33151.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 33151.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 33216.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 33216.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 33248.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 33280.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 33311.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 33343.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 33375.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 33375.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 33408.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 33408.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 33440.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 33440.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 33472.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 33504.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 33504.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 33536.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 33536.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 33568.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 33599.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 33632.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 33632.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 33632.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 33696.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 33696.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 33696.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 33728.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 33759.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 33759.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 33791.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 33824.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 33824.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 33856.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 33888.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 34080.0,
                        "normalized": 0.942499983124435
                      },
                      {
                        "cursor": 34176.0,
                        "normalized": 0.9324999833479524
                      },
                      {
                        "cursor": 34176.0,
                        "normalized": 0.9224999835714698
                      },
                      {
                        "cursor": 34208.0,
                        "normalized": 0.9124999837949872
                      },
                      {
                        "cursor": 34240.0,
                        "normalized": 0.9024999840185046
                      },
                      {
                        "cursor": 34240.0,
                        "normalized": 0.8824999844655395
                      },
                      {
                        "cursor": 34272.0,
                        "normalized": 0.8724999846890569
                      },
                      {
                        "cursor": 34304.0,
                        "normalized": 0.8624999849125743
                      },
                      {
                        "cursor": 34336.0,
                        "normalized": 0.8524999851360917
                      },
                      {
                        "cursor": 34336.0,
                        "normalized": 0.8424999853596091
                      },
                      {
                        "cursor": 34367.0,
                        "normalized": 0.8324999855831265
                      },
                      {
                        "cursor": 34400.0,
                        "normalized": 0.8124999860301614
                      },
                      {
                        "cursor": 34400.0,
                        "normalized": 0.8024999862536788
                      },
                      {
                        "cursor": 34431.0,
                        "normalized": 0.7924999864771962
                      },
                      {
                        "cursor": 34431.0,
                        "normalized": 0.772499986924231
                      },
                      {
                        "cursor": 34464.0,
                        "normalized": 0.7624999871477485
                      },
                      {
                        "cursor": 34495.0,
                        "normalized": 0.7424999875947833
                      },
                      {
                        "cursor": 34495.0,
                        "normalized": 0.7324999878183007
                      },
                      {
                        "cursor": 34528.0,
                        "normalized": 0.7224999880418181
                      },
                      {
                        "cursor": 34528.0,
                        "normalized": 0.7124999882653356
                      },
                      {
                        "cursor": 34559.0,
                        "normalized": 0.702499988488853
                      },
                      {
                        "cursor": 34591.0,
                        "normalized": 0.6924999887123704
                      },
                      {
                        "cursor": 34591.0,
                        "normalized": 0.6824999889358878
                      },
                      {
                        "cursor": 34623.0,
                        "normalized": 0.6724999891594052
                      },
                      {
                        "cursor": 34623.0,
                        "normalized": 0.6624999893829226
                      },
                      {
                        "cursor": 34655.0,
                        "normalized": 0.6524999896064401
                      },
                      {
                        "cursor": 34687.0,
                        "normalized": 0.6424999898299575
                      },
                      {
                        "cursor": 34687.0,
                        "normalized": 0.6324999900534749
                      },
                      {
                        "cursor": 34719.0,
                        "normalized": 0.6224999902769923
                      },
                      {
                        "cursor": 34719.0,
                        "normalized": 0.6124999905005097
                      },
                      {
                        "cursor": 34751.0,
                        "normalized": 0.6024999907240272
                      },
                      {
                        "cursor": 34783.0,
                        "normalized": 0.5924999909475446
                      },
                      {
                        "cursor": 34815.0,
                        "normalized": 0.582499991171062
                      },
                      {
                        "cursor": 34815.0,
                        "normalized": 0.5724999913945794
                      },
                      {
                        "cursor": 34848.0,
                        "normalized": 0.5624999916180968
                      },
                      {
                        "cursor": 34879.0,
                        "normalized": 0.5524999918416142
                      },
                      {
                        "cursor": 34912.0,
                        "normalized": 0.5424999920651317
                      },
                      {
                        "cursor": 34943.0,
                        "normalized": 0.5324999922886491
                      },
                      {
                        "cursor": 34976.0,
                        "normalized": 0.5224999925121665
                      },
                      {
                        "cursor": 35007.0,
                        "normalized": 0.5124999927356839
                      },
                      {
                        "cursor": 35040.0,
                        "normalized": 0.5024999929592013
                      },
                      {
                        "cursor": 35072.0,
                        "normalized": 0.49249999318271875
                      },
                      {
                        "cursor": 35103.0,
                        "normalized": 0.48249999340623617
                      },
                      {
                        "cursor": 35136.0,
                        "normalized": 0.4724999936297536
                      },
                      {
                        "cursor": 35136.0,
                        "normalized": 0.462499993853271
                      },
                      {
                        "cursor": 35167.0,
                        "normalized": 0.4524999940767884
                      },
                      {
                        "cursor": 35167.0,
                        "normalized": 0.44249999430030584
                      },
                      {
                        "cursor": 35199.0,
                        "normalized": 0.43249999452382326
                      },
                      {
                        "cursor": 35232.0,
                        "normalized": 0.4224999947473407
                      },
                      {
                        "cursor": 35232.0,
                        "normalized": 0.4124999949708581
                      },
                      {
                        "cursor": 35264.0,
                        "normalized": 0.4024999951943755
                      },
                      {
                        "cursor": 35264.0,
                        "normalized": 0.39249999541789293
                      },
                      {
                        "cursor": 35296.0,
                        "normalized": 0.38249999564141035
                      },
                      {
                        "cursor": 35296.0,
                        "normalized": 0.37249999586492777
                      },
                      {
                        "cursor": 35327.0,
                        "normalized": 0.3624999960884452
                      },
                      {
                        "cursor": 35327.0,
                        "normalized": 0.3524999963119626
                      },
                      {
                        "cursor": 35359.0,
                        "normalized": 0.34249999653548
                      },
                      {
                        "cursor": 35359.0,
                        "normalized": 0.33249999675899744
                      },
                      {
                        "cursor": 35392.0,
                        "normalized": 0.32249999698251486
                      },
                      {
                        "cursor": 35392.0,
                        "normalized": 0.3124999972060323
                      },
                      {
                        "cursor": 35424.0,
                        "normalized": 0.3024999974295497
                      },
                      {
                        "cursor": 35456.0,
                        "normalized": 0.2924999976530671
                      },
                      {
                        "cursor": 35456.0,
                        "normalized": 0.28249999787658453
                      },
                      {
                        "cursor": 35487.0,
                        "normalized": 0.27249999810010195
                      },
                      {
                        "cursor": 35520.0,
                        "normalized": 0.26249999832361937
                      },
                      {
                        "cursor": 35520.0,
                        "normalized": 0.2524999985471368
                      },
                      {
                        "cursor": 35551.0,
                        "normalized": 0.2424999987706542
                      },
                      {
                        "cursor": 35583.0,
                        "normalized": 0.23249999899417162
                      },
                      {
                        "cursor": 35583.0,
                        "normalized": 0.22249999921768904
                      },
                      {
                        "cursor": 35615.0,
                        "normalized": 0.21249999944120646
                      },
                      {
                        "cursor": 35615.0,
                        "normalized": 0.20249999966472387
                      },
                      {
                        "cursor": 35648.0,
                        "normalized": 0.1924999998882413
                      },
                      {
                        "cursor": 35648.0,
                        "normalized": 0.17250000033527613
                      },
                      {
                        "cursor": 35712.0,
                        "normalized": 0.16250000055879354
                      },
                      {
                        "cursor": 35712.0,
                        "normalized": 0.15250000078231096
                      },
                      {
                        "cursor": 35712.0,
                        "normalized": 0.1325000012293458
                      },
                      {
                        "cursor": 35744.0,
                        "normalized": 0.12250000145286322
                      },
                      {
                        "cursor": 35744.0,
                        "normalized": 0.11250000167638063
                      },
                      {
                        "cursor": 35775.0,
                        "normalized": 0.10250000189989805
                      },
                      {
                        "cursor": 35808.0,
                        "normalized": 0.09250000212341547
                      },
                      {
                        "cursor": 35840.0,
                        "normalized": 0.08250000234693289
                      },
                      {
                        "cursor": 35871.0,
                        "normalized": 0.0725000025704503
                      },
                      {
                        "cursor": 35903.0,
                        "normalized": 0.06250000279396772
                      },
                      {
                        "cursor": 35903.0,
                        "normalized": 0.05250000301748514
                      },
                      {
                        "cursor": 35903.0,
                        "normalized": 0.04250000324100256
                      },
                      {
                        "cursor": 35903.0,
                        "normalized": 0.03250000346451998
                      },
                      {
                        "cursor": 35935.0,
                        "normalized": 0.022500003688037395
                      },
                      {
                        "cursor": 35935.0,
                        "normalized": 0.012500003911554813
                      },
                      {
                        "cursor": 35968.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 36704.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 36736.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 36736.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 36767.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 36767.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 36767.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 36800.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 36800.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 36831.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 36831.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 36863.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 36863.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 36895.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 36895.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 36927.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 36959.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 36959.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 36959.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 36992.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 36992.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 37023.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 37023.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 37056.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 37056.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 37088.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 37088.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 37119.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 37119.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 37183.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 37183.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 37183.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 37216.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 37247.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 37247.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 37247.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 37279.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 37279.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 37408.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 37439.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 37439.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 37439.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 37472.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 37535.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 37535.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 37567.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 37600.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 37696.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 37696.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 37727.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 37759.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 37791.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 37823.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 37823.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 37856.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 37887.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 37887.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 37920.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 37952.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 37952.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 38015.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 38015.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 38047.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 38047.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 38079.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 38079.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 38111.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 38111.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 38144.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 38176.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 38176.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 38208.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 38239.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 38239.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 38271.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 38271.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 38336.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 38336.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 38367.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 38400.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 38433.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 38463.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 38496.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 38496.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 38528.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 38560.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 38624.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 38655.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 38688.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 38688.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 38719.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 38752.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 38783.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 38783.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 38816.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 38847.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 38847.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 38880.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 39263.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 39263.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 39295.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 39295.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 39327.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 39327.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 39327.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 39359.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 39359.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 39359.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 39391.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 39391.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 39391.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 39424.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 39424.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 39424.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 39455.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 39488.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 39519.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 39519.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 39552.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 39552.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 39552.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 39583.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 39615.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 39615.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 39648.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 39648.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 39679.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 39711.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 39711.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 39744.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 39744.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 39776.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 39776.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 39808.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 39840.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 39872.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 39872.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 39904.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 39936.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 39967.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 39967.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 40000.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 40032.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 40063.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 40096.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 40160.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 40160.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 40191.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 40191.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 40223.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 40257.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 40287.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 40319.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 40319.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 40351.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 40351.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 40384.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 40415.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 40447.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 40480.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 40513.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 40513.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 40544.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 40575.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 40575.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 40608.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 40639.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 40672.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 40704.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 40737.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 40800.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 40864.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 40928.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 40928.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 40959.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 40959.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 40991.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 41024.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 41055.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 41120.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 41120.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 41120.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 41152.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 41152.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 41152.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 41183.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 41216.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 41216.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 41247.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 41247.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 41695.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 41695.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 41727.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 41727.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 41727.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 41759.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 41759.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 41759.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 41759.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 41792.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 41792.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 41823.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 41823.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 41823.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 41823.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 41887.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 41887.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 41920.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 41920.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 41952.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 41952.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 41984.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 42016.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 42016.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 42047.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 42047.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 42080.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 42112.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 42112.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 42143.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 42175.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 42175.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 42207.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 42207.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 42272.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 42272.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 42304.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 42304.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 42335.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 42367.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 42367.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 42367.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 42399.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 42433.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 42433.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 42463.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 42495.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 42528.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 42528.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 42591.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 42591.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 42591.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 42591.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 42624.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 42655.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 42687.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 42687.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 42719.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 42719.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 42751.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 42783.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 42815.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 42815.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 42848.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 42880.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 42880.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 42911.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 42911.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 42911.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 42944.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 42944.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 42975.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 42975.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 43008.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 43040.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 43072.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 43072.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 43103.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 43135.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 43135.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 43167.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 43167.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 43231.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 43231.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 43231.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 43263.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 44191.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 44191.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 44224.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 44256.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 44256.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 44287.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 44287.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 44319.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 44319.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 44319.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 44351.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 44351.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 44383.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 44416.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 44448.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 44480.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 44511.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 44543.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 44576.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 44639.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 44639.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 44671.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 44704.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 44704.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 44736.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 44736.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 44768.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 44800.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 44800.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 44831.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 44863.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 44896.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 44896.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 44896.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 44896.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 44927.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 44927.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 44960.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 44992.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 44992.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 45024.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 45024.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 45055.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 45055.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 45088.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 45120.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 45120.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 45152.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 45152.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 45184.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 45184.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 45247.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 45247.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 45247.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 45280.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 45280.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 45311.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 45344.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 45375.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 45375.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 45408.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 45408.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 45472.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 45472.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 45504.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 45504.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 45535.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 45567.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 45567.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 45599.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 45599.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 45631.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 45664.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 45664.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 45664.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 45696.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 45696.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 45727.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 45727.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 45759.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 45792.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 45792.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 45824.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 45824.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 45856.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 45887.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 45920.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 45952.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 45952.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 46655.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 46655.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 46688.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 46688.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 46720.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 46720.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 46720.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 46751.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 46783.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 46783.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 46783.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 46816.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 46847.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 46847.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 46847.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 46847.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 46879.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 46879.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 46911.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 46944.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 46944.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 46976.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 46976.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 47008.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 47039.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 47072.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 47103.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 47103.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 47103.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 47136.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 47167.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 47167.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 47199.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 47199.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 47199.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 47232.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 47232.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 47263.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 47263.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 47296.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 47296.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 47327.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 47359.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 47359.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 47359.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 47392.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 47424.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 47424.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 47456.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 47488.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 47488.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 47519.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 47519.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 47519.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 47552.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 47552.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 47584.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 47616.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 47648.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 47648.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 47648.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 47648.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 47680.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 47680.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 47711.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 47744.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 47744.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 47776.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 47808.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 47808.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 47903.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 47935.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 47935.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 47935.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 47968.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 47999.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 47999.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 47999.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 47999.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 47999.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 48031.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 48031.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 48063.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 48095.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 48095.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 48095.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 48095.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 48127.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 48127.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 48159.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 48159.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 48191.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 48191.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 48223.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 48223.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 48223.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 48256.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 48288.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 48288.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 48319.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 48319.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 48319.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 48319.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 48352.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 48352.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 48384.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 48415.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 48415.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 48415.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 48447.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 48480.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 48480.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 48511.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 48511.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 48543.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 48543.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 48576.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 48609.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 48609.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 48639.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 48639.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 48671.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 48704.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 48704.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 48736.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 48736.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 48768.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 48768.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 48768.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 48800.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 48863.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 48863.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 48863.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 48863.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 48895.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 69280.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 69312.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 69312.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 69312.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 69344.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 69408.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 69408.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 69408.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 69632.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 69664.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 69664.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 69664.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 69695.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 69727.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 69727.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 69727.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 69919.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 69919.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 69951.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 69951.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 69983.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 69983.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 70015.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 70048.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 70048.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 70080.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 70080.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 70112.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 70112.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 70144.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 70144.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 70144.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 70175.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 70207.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 70207.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 70240.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 70271.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 70271.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 70303.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 70303.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 70336.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 70368.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 70368.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 70368.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 70399.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 70432.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 70463.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 70463.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 70527.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 70560.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 70560.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 70624.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 70655.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 70655.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 70688.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 70688.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 70720.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 70751.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 70783.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 70783.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 70816.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 70816.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 70816.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 70847.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 70847.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 70880.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 70880.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 70880.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 70913.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 70913.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 70943.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 70976.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 70976.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 70976.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 71008.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 71039.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 71072.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 71072.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 71072.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 71072.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 71104.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 71136.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 71136.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 71168.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 71168.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 71199.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 71199.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 71199.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 71199.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 71232.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 71232.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 71232.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 71551.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 71551.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 71584.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 71615.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 71615.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 71648.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 71648.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 71679.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 71679.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 71711.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 71744.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 71744.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 71775.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 71775.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 71807.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 71807.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 71841.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 71872.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 71904.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 71904.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 71904.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 71968.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 71968.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 71968.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 72032.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 72032.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 72032.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 72032.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 72063.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 72063.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 72097.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 72128.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 72159.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 72159.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 72192.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 72192.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 72192.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 72223.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 72255.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 72287.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 72320.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 72352.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 72383.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 72416.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 72448.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 72479.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 72479.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 72511.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 72543.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 72576.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 72607.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 72607.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 72640.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 72672.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 72703.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 72703.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 72735.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 72735.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 72767.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 72801.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 72801.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 72831.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 72831.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 72863.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 72863.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 72895.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 72895.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 72992.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 73056.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 73056.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 73087.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 73120.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 73151.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 73151.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 73215.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 73215.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 73279.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 73312.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 73343.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 73376.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 73407.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 73407.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 73439.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 73439.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 73472.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 73503.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 73503.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 73535.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 73535.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 73535.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 73568.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 74175.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 74175.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 74175.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 74207.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 74240.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 74240.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 74271.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 74303.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 74303.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 74336.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 74336.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 74368.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 74399.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 74399.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 74432.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 74432.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 74463.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 74463.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 74496.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 74496.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 74528.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 74528.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 74559.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 74559.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 74592.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 74623.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 74623.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 74655.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 74688.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 74688.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 74719.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 74751.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 74751.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 74783.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 74783.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 74815.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 74815.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 74848.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 74848.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 74879.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 74879.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 74912.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 74912.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 74943.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 74975.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 74975.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 74975.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 75007.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 75040.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 75040.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 75072.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 75103.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 75136.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 75136.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 75200.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 75232.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 75232.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 75263.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 75296.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 75296.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 75327.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 75327.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 75360.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 75360.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 75360.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 75391.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 75391.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 75391.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 75424.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 75424.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 75424.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 75456.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 75488.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 75488.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 75519.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 75519.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 75552.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 75552.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 75583.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 75615.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 75615.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 75648.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 75648.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 75680.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 75711.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 75711.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 75743.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 75775.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 75775.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 75808.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 75808.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 75840.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 75871.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 75871.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 77087.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 77087.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 77119.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 77119.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 77152.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 77152.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 77184.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 77184.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 77215.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 77247.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 77279.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 77279.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 77343.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 77376.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 77408.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 77408.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 77440.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 77504.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 77504.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 77504.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 77536.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 77568.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 77600.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 77600.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 77631.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 77631.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 77631.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 77663.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 77696.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 77696.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 77727.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 77727.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 77760.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 77760.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 77792.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 77792.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 77824.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 77855.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 77855.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 77887.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 77887.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 77919.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 77952.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 77952.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 77952.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 77952.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 77983.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 77983.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 77983.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 78015.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 78015.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 78047.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 78047.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 78112.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 78143.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 78143.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 78175.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 78175.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 78207.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 78207.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 78239.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 78239.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 78271.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 78271.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 78303.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 78336.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 78368.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 78368.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 78399.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 78399.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 78495.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 78495.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 78495.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 78528.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 78528.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 78528.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 78559.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 78559.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 78559.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 78591.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 78591.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 78591.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 78591.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 78624.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 78656.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 78656.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 78656.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 78656.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 78687.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 78687.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 78719.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 78719.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 78751.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 78783.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 78783.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 78783.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 78816.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 78816.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 78816.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 78847.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 78880.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 78880.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 78880.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 78880.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 78911.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 78911.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 78911.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 78944.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 78944.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 78944.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 78944.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 78976.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 78976.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 79008.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 79008.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 79008.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 79039.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 79039.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 79072.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 79072.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 79104.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 79487.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 79487.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 79520.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 79520.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 79552.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 79583.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 79583.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 79583.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 79616.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 79616.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 79648.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 79648.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 79648.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 79679.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 79679.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 79712.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 79712.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 79744.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 79744.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 79776.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 79776.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 79808.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 79840.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 79840.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 79840.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 79872.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 79904.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 79904.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 79968.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 79968.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 79968.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 79968.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 79999.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 79999.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 79999.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 80031.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 80031.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 80031.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 80064.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 80064.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 80096.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 80127.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 80159.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 80159.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 80192.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 80223.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 80223.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 80255.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 80255.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 80255.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 80287.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 80287.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 80352.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 80352.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 80352.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 80352.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 80352.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 80383.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 80383.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 80415.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 80415.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 80448.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 80448.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 80448.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 80480.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 81599.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 81599.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 81599.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 81631.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 81663.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 81663.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 81695.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 81728.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 81728.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 81759.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 81759.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 81791.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 81791.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 81824.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 81856.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 81887.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 81887.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 81887.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 81919.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 81951.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 81951.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 81983.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 81983.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 81983.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 82015.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 82015.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 82048.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 82048.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 82079.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 82079.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 82112.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 82144.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 82144.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 82144.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 82144.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 82175.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 82208.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 82208.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 82239.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 82239.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 82272.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 82272.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 82303.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 82335.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 82368.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 82368.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 82399.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 82399.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 82431.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 82431.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 82464.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 82464.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 82495.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 82495.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 82527.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 82559.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 82559.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 82591.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 82591.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 82624.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 82656.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 82656.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 82656.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 82688.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 82688.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 82751.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 82751.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 82751.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 82784.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 82784.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 82815.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 82848.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 82848.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 82880.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 82912.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 82912.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 82912.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 82944.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 82944.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 82975.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 83007.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 83007.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 83007.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 83039.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 83039.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 84191.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 84191.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 84223.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 84223.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 84256.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 84256.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 84287.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 84287.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 84287.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 84320.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 84352.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 84383.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 84415.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 84415.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 84447.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 84480.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 84480.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 84480.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 84512.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 84575.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 84607.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 84607.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 84672.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 84704.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 84736.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 84736.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 84767.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 84800.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 84831.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 84864.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 84864.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 84895.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 84927.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 84927.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 84927.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 84959.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 84992.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 85024.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 85024.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 85024.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 85055.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 85055.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 85055.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 85087.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 85087.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 85087.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 85119.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 85152.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 85183.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 85183.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 85216.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 85216.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 85280.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 85313.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 85313.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 85344.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 85344.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 85376.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 85408.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 85408.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 85439.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 85439.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 85439.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 85472.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 85504.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 85536.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 85567.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 85567.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 85567.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 85567.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 85600.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 85631.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 85631.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 85631.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 85664.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 85695.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 85728.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 85728.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 85759.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 85792.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 85823.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 85856.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 85887.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 85887.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 85920.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 85951.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 85951.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 85983.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 86816.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 86816.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 86816.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 86848.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 86848.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 86879.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 86911.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 86911.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 86943.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 86943.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 86976.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 86976.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 87007.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 87039.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 87039.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 87039.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 87071.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 87071.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 87104.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 87136.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 87136.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 87167.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 87167.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 87167.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 87199.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 87199.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 87232.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 87232.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 87232.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 87264.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 87264.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 87295.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 87295.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 87295.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 87327.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 87359.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 87359.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 87392.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 87392.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 87392.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 87423.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 87423.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 87423.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 87455.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 87455.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 87488.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 87488.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 87520.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 87520.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 87552.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 87552.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 87583.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 87583.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 87616.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 87616.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 87616.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 87647.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 87647.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 87679.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 87679.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 87711.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 87711.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 87744.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 87744.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 87744.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 87776.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 87776.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 87776.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 87808.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 87840.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 87840.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 88000.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 88000.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 88000.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 88032.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 88032.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 88063.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 88063.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 88096.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 88096.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 88096.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 88127.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 88127.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 88159.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 88159.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 88159.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 88191.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 88191.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 88191.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 88255.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 88255.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 88255.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 88287.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 88287.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 88351.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 88351.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 88383.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 88383.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 88383.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 88415.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 88415.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 88447.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 88479.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 88479.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 88511.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 88511.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 88575.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 88575.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 88575.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 88607.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 88640.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 88640.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 88672.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 88703.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 88736.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 88736.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 88736.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 88767.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 88799.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 88831.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 88831.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 88863.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 88896.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 88928.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 89024.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 89120.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 89152.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 89183.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 89216.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 89280.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 89280.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 89280.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 89311.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 89344.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 89375.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 89375.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 89375.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 89408.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 89408.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 89439.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 89823.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 89823.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 89823.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 89856.0,
                        "normalized": 0.17249998170882463
                      },
                      {
                        "cursor": 89888.0,
                        "normalized": 0.20249998103827238
                      },
                      {
                        "cursor": 89888.0,
                        "normalized": 0.23249998036772013
                      },
                      {
                        "cursor": 89888.0,
                        "normalized": 0.2524999799206853
                      },
                      {
                        "cursor": 89920.0,
                        "normalized": 0.28249997925013304
                      },
                      {
                        "cursor": 89920.0,
                        "normalized": 0.2924999790266156
                      },
                      {
                        "cursor": 89920.0,
                        "normalized": 0.32249997835606337
                      },
                      {
                        "cursor": 89952.0,
                        "normalized": 0.33249997813254595
                      },
                      {
                        "cursor": 89952.0,
                        "normalized": 0.34249997790902853
                      },
                      {
                        "cursor": 89952.0,
                        "normalized": 0.3524999776855111
                      },
                      {
                        "cursor": 89983.0,
                        "normalized": 0.3624999774619937
                      },
                      {
                        "cursor": 89983.0,
                        "normalized": 0.3724999772384763
                      },
                      {
                        "cursor": 90015.0,
                        "normalized": 0.38249997701495886
                      },
                      {
                        "cursor": 90015.0,
                        "normalized": 0.39249997679144144
                      },
                      {
                        "cursor": 90048.0,
                        "normalized": 0.402499976567924
                      },
                      {
                        "cursor": 90080.0,
                        "normalized": 0.4124999763444066
                      },
                      {
                        "cursor": 90080.0,
                        "normalized": 0.43249997589737177
                      },
                      {
                        "cursor": 90112.0,
                        "normalized": 0.44249997567385435
                      },
                      {
                        "cursor": 90112.0,
                        "normalized": 0.45249997545033693
                      },
                      {
                        "cursor": 90112.0,
                        "normalized": 0.4624999752268195
                      },
                      {
                        "cursor": 90143.0,
                        "normalized": 0.4724999750033021
                      },
                      {
                        "cursor": 90143.0,
                        "normalized": 0.49249997455626726
                      },
                      {
                        "cursor": 90175.0,
                        "normalized": 0.5124999741092324
                      },
                      {
                        "cursor": 90175.0,
                        "normalized": 0.5324999736621976
                      },
                      {
                        "cursor": 90207.0,
                        "normalized": 0.5424999734386802
                      },
                      {
                        "cursor": 90207.0,
                        "normalized": 0.5524999732151628
                      },
                      {
                        "cursor": 90240.0,
                        "normalized": 0.5624999729916453
                      },
                      {
                        "cursor": 90272.0,
                        "normalized": 0.5724999727681279
                      },
                      {
                        "cursor": 90272.0,
                        "normalized": 0.5824999725446105
                      },
                      {
                        "cursor": 90304.0,
                        "normalized": 0.5924999723210931
                      },
                      {
                        "cursor": 90336.0,
                        "normalized": 0.6024999720975757
                      },
                      {
                        "cursor": 90336.0,
                        "normalized": 0.6124999718740582
                      },
                      {
                        "cursor": 90336.0,
                        "normalized": 0.6224999716505408
                      },
                      {
                        "cursor": 90368.0,
                        "normalized": 0.6324999714270234
                      },
                      {
                        "cursor": 90399.0,
                        "normalized": 0.642499971203506
                      },
                      {
                        "cursor": 90399.0,
                        "normalized": 0.6524999709799886
                      },
                      {
                        "cursor": 90431.0,
                        "normalized": 0.6624999707564712
                      },
                      {
                        "cursor": 90464.0,
                        "normalized": 0.6724999705329537
                      },
                      {
                        "cursor": 90464.0,
                        "normalized": 0.6824999703094363
                      },
                      {
                        "cursor": 90496.0,
                        "normalized": 0.6924999700859189
                      },
                      {
                        "cursor": 90528.0,
                        "normalized": 0.7024999698624015
                      },
                      {
                        "cursor": 90528.0,
                        "normalized": 0.7124999696388841
                      },
                      {
                        "cursor": 90528.0,
                        "normalized": 0.7224999694153666
                      },
                      {
                        "cursor": 90528.0,
                        "normalized": 0.7324999691918492
                      },
                      {
                        "cursor": 90591.0,
                        "normalized": 0.7524999687448144
                      },
                      {
                        "cursor": 90591.0,
                        "normalized": 0.762499968521297
                      },
                      {
                        "cursor": 90591.0,
                        "normalized": 0.7824999680742621
                      },
                      {
                        "cursor": 90623.0,
                        "normalized": 0.7924999678507447
                      },
                      {
                        "cursor": 90623.0,
                        "normalized": 0.8024999676272273
                      },
                      {
                        "cursor": 90656.0,
                        "normalized": 0.8224999671801925
                      },
                      {
                        "cursor": 90656.0,
                        "normalized": 0.832499966956675
                      },
                      {
                        "cursor": 90656.0,
                        "normalized": 0.8424999667331576
                      },
                      {
                        "cursor": 90656.0,
                        "normalized": 0.8524999665096402
                      },
                      {
                        "cursor": 90688.0,
                        "normalized": 0.8624999662861228
                      },
                      {
                        "cursor": 90688.0,
                        "normalized": 0.8724999660626054
                      },
                      {
                        "cursor": 90719.0,
                        "normalized": 0.882499965839088
                      },
                      {
                        "cursor": 90719.0,
                        "normalized": 0.8924999656155705
                      },
                      {
                        "cursor": 90719.0,
                        "normalized": 0.9024999653920531
                      },
                      {
                        "cursor": 90783.0,
                        "normalized": 0.9124999651685357
                      },
                      {
                        "cursor": 90783.0,
                        "normalized": 0.9224999649450183
                      },
                      {
                        "cursor": 90783.0,
                        "normalized": 0.9324999647215009
                      },
                      {
                        "cursor": 90815.0,
                        "normalized": 0.9424999644979835
                      },
                      {
                        "cursor": 90815.0,
                        "normalized": 0.952499964274466
                      },
                      {
                        "cursor": 90880.0,
                        "normalized": 0.9724999638274312
                      },
                      {
                        "cursor": 90880.0,
                        "normalized": 0.9824999636039138
                      },
                      {
                        "cursor": 90912.0,
                        "normalized": 0.9924999633803964
                      },
                      {
                        "cursor": 90912.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 90943.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 90975.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 91871.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 91871.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 91904.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 91904.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 91935.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 91967.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 91999.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 91999.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 92031.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 92031.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 92031.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 92064.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 92064.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 92095.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 92127.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 92127.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 92127.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 92160.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 92160.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 92192.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 92224.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 92224.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 92255.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 92288.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 92288.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 92319.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 92319.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 92351.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 92384.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 92384.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 92416.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 92448.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 92448.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 92479.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 92479.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 92511.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 92544.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 92544.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 92575.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 92575.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 92608.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 92641.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 92671.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 92704.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 92735.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 92735.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 92768.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 92768.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 92799.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 92799.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 92832.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 92832.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 92864.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 92864.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 92896.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 92927.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 92927.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 92927.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 92927.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 92992.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 92992.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 92992.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 93024.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 93024.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 93024.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 93055.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 93055.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 93088.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 93088.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 93119.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 93248.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 93279.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 93311.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 93343.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 93376.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 93376.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 93376.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 93376.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 93408.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 93408.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 93408.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 93439.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 93439.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 93471.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 93504.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 93504.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 94463.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 94463.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 94463.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 94496.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 94496.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 94527.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 94527.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 94560.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 94560.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 94591.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 94624.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 94656.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 94656.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 94656.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 94687.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 94687.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 94720.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 94752.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 94752.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 94784.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 94784.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 94816.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 94816.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 94847.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 94880.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 94880.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 94880.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 94912.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 94912.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 94944.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 94976.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 94976.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 95007.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 95007.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 95040.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 95071.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 95104.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 95104.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 95136.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 95167.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 95167.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 95199.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 95231.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 95231.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 95264.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 95264.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 95296.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 95296.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 95328.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 95328.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 95328.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 95359.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 95359.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 95392.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 95392.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 95392.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 95423.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 95423.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 95456.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 95487.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 95487.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 95519.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 95551.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 95551.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 95584.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 95615.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 95615.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 95647.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 95647.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 95679.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 95679.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 95712.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 95712.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 95743.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 95743.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 95776.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 95776.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 95776.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 95808.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 95808.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 95839.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 95839.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 95839.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 95872.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 95872.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 95903.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 97119.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 97119.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 97119.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 97151.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 97151.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 97184.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 97184.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 97216.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 97248.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 97248.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 97280.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 97280.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 97312.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 97312.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 97344.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 97376.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 97376.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 97408.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 97408.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 97440.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 97472.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 97504.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 97536.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 97536.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 97536.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 97536.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 97567.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 97567.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 97567.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 97600.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 97600.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 97631.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 97631.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 97631.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 97664.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 97664.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 97695.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 97728.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 97728.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 97759.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 97759.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 97759.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 97792.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 97792.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 97823.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 97823.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 97823.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 97856.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 97856.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 97887.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 97887.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 97919.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 97951.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 97951.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 97983.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 97983.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 98015.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 98015.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 98047.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 98080.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 98112.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 98400.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 98400.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 98431.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 98431.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 98463.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 98495.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 98495.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 98527.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 98527.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 98559.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 98559.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 98591.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 98624.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 98624.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 98624.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 98655.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 98655.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 98687.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 98720.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 98752.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 98752.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 98752.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 98784.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 98784.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 98816.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 98816.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 98816.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 98848.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 98879.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 98879.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 98912.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 98943.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 98943.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 98975.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 98975.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 99008.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 99040.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 99071.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 99104.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 99104.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 99199.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 99199.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 99232.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 99455.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 99455.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 99455.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 99487.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 99487.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 99487.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 99519.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 99552.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 99552.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 99552.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 99584.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 99584.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 99616.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 99616.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 99616.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 99616.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 99616.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 99648.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 99648.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 99648.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 99711.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 99711.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 99744.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 99744.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 99776.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 99808.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 99840.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 99871.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 99871.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 99871.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 99871.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 99904.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 99936.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 99967.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 99967.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 99999.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 99999.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 100032.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 100032.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 100032.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 100063.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 100063.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 100096.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 100096.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 100096.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 100096.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 100127.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 100127.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 100127.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 100160.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 100160.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 100160.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 100191.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 100224.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 100224.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 100255.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 100287.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 100287.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 100415.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 100447.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 100447.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 100479.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 101823.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 101856.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 101920.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 101920.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 101952.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 101984.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 102016.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 102047.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 102047.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 102080.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 102080.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 102112.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 102144.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 102144.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 102175.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 102208.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 102208.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 102239.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 102239.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 102272.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 102272.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 102304.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 102304.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 102336.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 102336.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 102399.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 102399.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 102432.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 102432.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 102432.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 102463.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 102496.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 102496.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 102527.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 102527.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 102559.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 102559.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 102592.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 102624.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 102624.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 102624.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 102655.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 102655.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 102687.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 102687.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 102719.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 102719.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 102752.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 102785.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 102785.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 102785.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 102815.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 102848.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 102848.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 102879.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 102879.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 102911.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 102944.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 102944.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 102976.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 102976.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 103040.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 103040.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 103040.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 103040.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 103040.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 103072.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 103104.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 103104.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 103104.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 103135.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 103135.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 103135.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 103167.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 103167.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 103167.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 103200.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 103200.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 103232.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 103232.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 103232.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 103296.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 103296.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 103296.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 103296.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 103296.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 103328.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 103359.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 103359.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 104319.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 104351.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 104384.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 104384.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 104448.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 104448.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 104480.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 104513.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 104544.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 104544.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 104575.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 104608.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 104639.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 104639.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 104672.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 104703.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 104736.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 104767.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 104800.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 104832.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 104832.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 104864.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 104864.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 104895.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 104895.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 104927.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 104960.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 104960.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 104991.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 104991.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 105023.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 105055.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 105088.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 105088.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 105119.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 105119.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 105152.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 105184.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 105215.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 105215.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 105215.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 105247.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 105247.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 105247.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 105280.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 105280.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 105280.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 105311.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 105311.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 105311.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 105343.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 105343.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 105343.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 105407.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 105407.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 105440.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 105440.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 105471.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 105504.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 105504.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 105536.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 105536.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 105536.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 105568.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 105568.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 105600.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 105600.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 105632.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 105632.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 105664.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 105696.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 105696.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 105696.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 105728.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 105728.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 105759.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 105759.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 105792.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 105823.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 105823.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 105823.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 105856.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 105856.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 105888.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 105888.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 105888.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 105952.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 105952.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 105952.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 106816.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 106816.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 106847.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 106880.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 106880.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 106880.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 106911.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 106911.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 106943.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 106943.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 106943.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 106976.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 107007.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 107039.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 107039.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 107039.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 107103.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 107103.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 107103.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 107103.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 107103.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 107136.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 107167.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 107167.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 107200.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 107200.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 107232.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 107232.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 107263.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 107263.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 107263.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 107296.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 107296.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 107328.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 107328.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 107359.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 107359.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 107391.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 107391.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 107424.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 107456.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 107456.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 107488.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 107519.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 107552.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 107552.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 107583.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 107615.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 107648.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 107648.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 107648.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 107679.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 107679.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 107712.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 107712.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 107743.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 107743.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 107775.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 107775.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 107775.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 107807.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 107839.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 107839.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 107872.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 107872.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 107903.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 107936.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 107967.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 107967.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 108000.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 108128.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 108128.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 108159.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 108159.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 108159.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 108192.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 108192.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 108192.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 108224.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 108224.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 108256.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 108256.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 108288.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 108288.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 108320.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 108320.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 108320.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 108351.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 108351.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 108384.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 108384.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 108447.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 108447.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 108480.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 108480.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 108511.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 108511.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 108544.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 108575.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 108575.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 108608.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 108608.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 108639.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 108639.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 108672.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 108672.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 108672.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 108703.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 108703.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 108735.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 108735.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 108767.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 108767.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 108799.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 108799.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 108831.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 108831.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 108864.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 108864.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 108896.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 108927.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 108959.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 108959.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 108959.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 108991.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 108991.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 108991.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 109023.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 109023.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 109023.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 130015.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 130015.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 130048.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 130048.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 130080.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 130080.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 130112.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 130112.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 130175.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 130208.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 130208.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 130272.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 130304.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 130304.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 130335.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 130335.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 130368.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 130368.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 130400.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 130400.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 130432.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 130432.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 130463.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 130495.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 130495.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 130527.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 130560.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 130592.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 130623.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 130623.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 130623.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 130656.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 130656.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 130688.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 130720.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 130751.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 130783.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 130783.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 130783.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 130815.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 130815.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 130815.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 130815.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 130848.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 130880.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 130880.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 130880.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 130912.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 130943.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 130943.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 130943.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 130943.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 130976.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 130976.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 131008.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 131008.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 131040.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 131071.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 131104.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 131104.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 131135.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 131168.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 131168.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 131199.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 131231.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 131231.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 131231.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 131263.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 131263.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 131296.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 131296.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 131327.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 131360.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 131360.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 131391.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 131391.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 131391.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 131423.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 131423.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 131455.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 131487.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 131903.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 131903.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 131968.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 131968.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 131968.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 132000.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 132000.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 132031.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 132031.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 132031.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 132063.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 132063.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 132063.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 132095.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 132128.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 132159.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 132159.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 132191.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 132223.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 132255.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 132255.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 132255.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 132287.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 132320.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 132352.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 132384.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 132384.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 132416.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 132447.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 132479.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 132479.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 132479.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 132512.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 132512.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 132544.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 132544.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 132608.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 132608.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 132639.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 132639.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 132672.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 132672.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 132736.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 132736.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 132767.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 132799.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 132832.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 132863.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 132895.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 132928.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 132928.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 132959.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 132991.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 132991.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 133056.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 133056.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 133088.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 133088.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 133088.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 133120.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 133152.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 133152.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 133152.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 133183.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 133183.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 133216.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 133216.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 133248.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 133248.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 133248.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 133280.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 133280.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 133311.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 133344.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 133344.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 133375.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 133375.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 133408.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 133408.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 133440.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 133440.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 133440.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 133503.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 133503.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 133503.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 133536.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 134720.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 134720.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 134752.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 134815.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 134815.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 134848.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 134848.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 134880.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 134880.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 134911.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 134943.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 134943.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 134976.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 134976.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 135008.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 135039.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 135072.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 135072.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 135072.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 135104.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 135135.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 135168.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 135168.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 135200.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 135200.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 135200.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 135231.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 135231.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 135264.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 135264.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 135295.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 135295.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 135295.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 135327.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 135360.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 135360.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 135392.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 135423.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 135423.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 135455.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 135488.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 135520.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 135520.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 135520.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 135552.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 135552.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 135584.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 135584.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 135616.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 135647.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 135647.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 135679.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 135679.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 135712.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 135743.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 135743.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 135776.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 135807.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 135807.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 135807.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 135807.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 135839.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 135839.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 135871.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 135871.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 135903.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 135935.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 135935.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 135935.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 135968.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 135968.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 135999.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 135999.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 135999.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 136031.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 136031.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 136064.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 136096.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 136096.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 136128.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 136160.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 136160.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 136191.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 136191.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 136224.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 136224.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 136255.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 136255.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 136288.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 136320.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 136320.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 136320.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 137055.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 137087.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 137087.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 137120.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 137120.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 137151.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 137151.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 137183.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 137216.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 137247.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 137280.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 137280.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 137312.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 137343.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 137375.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 137408.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 137440.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 137471.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 137503.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 137536.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 137568.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 137568.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 137600.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 137600.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 137631.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 137663.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 137695.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 137695.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 137695.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 137760.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 137760.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 137792.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 137792.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 137823.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 137856.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 137856.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 137888.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 137920.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 137920.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 137984.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 137984.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 138047.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 138047.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 138047.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 138047.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 138079.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 138112.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 138112.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 138143.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 138143.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 138175.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 138175.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 138207.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 138207.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 138239.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 138239.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 138239.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 138271.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 138271.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 138271.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 138304.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 138335.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 138368.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 138368.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 138400.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 138431.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 138431.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 138431.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 138464.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 138495.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 138528.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 138752.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 138752.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 138752.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 138752.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 138784.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 138784.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 138816.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 138847.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 138847.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 138847.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 138879.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 138879.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 138879.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 138911.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 138911.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 138943.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 138975.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 138975.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 138975.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 138975.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 139007.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 139007.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 139039.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 139039.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 139072.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 139103.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 139103.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 139103.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 139135.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 139168.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 139200.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 139231.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 139231.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 139231.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 139264.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 139295.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 139295.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 139327.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 139327.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 139360.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 139360.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 139391.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 139423.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 139423.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 139456.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 139456.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 139487.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 139487.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 139520.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 139775.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 139775.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 139775.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 139807.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 139839.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 139839.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 139872.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 139872.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 139872.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 139903.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 139903.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 139935.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 139967.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 139967.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 139999.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 140031.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 140031.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 140031.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 140031.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 140064.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 140064.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 140064.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 140064.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 140095.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 140095.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 140159.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 140159.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 140159.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 140191.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 140191.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 140223.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 140256.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 140256.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 140287.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 140287.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 140320.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 140352.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 140352.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 140383.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 140416.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 140416.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 140448.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 140480.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 140512.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 140543.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 140543.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 140543.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 140576.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 140608.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 140639.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 140639.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 140639.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 140639.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 140672.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 140672.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 140704.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 140704.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 140735.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 140767.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 140767.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 140799.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 140831.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 142176.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 142176.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 142207.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 142207.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 142240.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 142240.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 142303.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 142303.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 142303.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 142335.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 142367.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 142367.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 142400.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 142432.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 142463.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 142463.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 142463.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 142495.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 142527.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 142560.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 142560.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 142591.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 142591.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 142623.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 142623.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 142655.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 142655.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 142688.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 142688.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 142720.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 142751.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 142751.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 142751.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 142815.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 142815.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 142815.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 142848.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 142848.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 142879.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 142879.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 142912.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 142912.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 142912.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 142944.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 142944.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 143007.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 143007.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 143007.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 143007.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 143072.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 143072.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 143072.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 143104.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 143135.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 143135.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 143167.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 143199.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 143231.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 143231.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 143231.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 143231.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 143264.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 143264.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 143297.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 143328.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 143328.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 143328.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 143359.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 143359.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 143392.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 143392.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 143424.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 143424.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 143424.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 143455.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 143488.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 143488.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 143488.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 143519.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 143552.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 143552.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 143583.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 143583.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 143616.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 143616.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 144895.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 144895.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 144895.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 144927.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 144927.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 144959.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 144959.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 144959.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 144992.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 145024.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 145024.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 145024.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 145056.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 145056.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 145119.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 145119.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 145119.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 145119.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 145151.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 145183.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 145216.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 145216.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 145247.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 145247.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 145247.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 145280.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 145280.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 145311.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 145311.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 145344.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 145344.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 145376.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 145376.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 145408.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 145408.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 145439.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 145471.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 145471.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 145503.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 145503.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 145535.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 145535.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 145599.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 145599.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 145632.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 145632.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 145632.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 145663.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 145696.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 145696.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 145728.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 145728.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 145760.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 145791.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 145824.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 145824.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 145824.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 145856.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 145856.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 145887.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 145920.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 145951.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 145951.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 145984.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 145984.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 145984.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 145984.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 146015.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 146015.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 146015.0,
                        "normalized": 0.19250000175088644
                      },
                      {
                        "cursor": 146047.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 146047.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 146080.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 146080.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 146143.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 146143.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 146143.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 146176.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 146176.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 146240.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 146240.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 146271.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 146271.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 146304.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 146304.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 146336.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 146367.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 146367.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 147327.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 147360.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 147360.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 147392.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 147392.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 147392.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 147423.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 147456.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 147487.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 147487.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 147520.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 147552.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 147552.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 147552.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 147584.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 147616.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 147616.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 147616.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 147647.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 147647.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 147647.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 147679.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 147679.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 147711.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 147744.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 147744.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 147744.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 147775.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 147775.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 147807.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 147840.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 147840.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 147872.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 147872.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 147872.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 147903.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 147903.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 147903.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 147903.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 147936.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 147936.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 147936.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 147968.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 147968.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 147968.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 148000.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 148000.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 148031.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 148063.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 148063.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 148063.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 148063.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 148096.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 148096.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 148127.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 148159.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 148191.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 148191.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 148191.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 148191.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 148223.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 148223.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 148223.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 148256.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 148287.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 148319.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 148319.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 148608.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 148608.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 148640.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 148671.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 148704.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 148704.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 148767.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 148767.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 148767.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 148799.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 148831.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 148831.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 148831.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 148831.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 148864.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 148864.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 148895.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 148895.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 148927.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 148927.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 148959.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 148959.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 148992.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 149024.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 149056.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 149056.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 149087.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 149087.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 149119.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 149119.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 149119.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 149151.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 149184.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 149184.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 149184.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 149216.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 149216.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 149216.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 149248.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 149280.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 149280.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 149280.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 149312.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 149312.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 149344.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 149344.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 149375.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 149407.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 149440.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 149471.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 149471.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 149504.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 149535.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 149568.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 149599.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 149599.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 149631.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 149695.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 149727.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 149791.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 149824.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 149887.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 150239.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 155839.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 155839.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 155839.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 155872.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 155872.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 155904.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 155935.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 155935.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 155969.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 156000.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 156032.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 156032.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 156032.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 156064.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 156095.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 156095.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 156128.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 156159.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 156159.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 156224.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 156224.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 156287.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 156320.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 156416.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 156479.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 156479.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 156512.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 156575.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 156575.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 156575.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 156640.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 156671.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 156704.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 156704.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 156736.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 156767.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 156800.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 156800.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 156831.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 156864.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 156895.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 156895.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 156928.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 156928.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 156960.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 156992.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 157023.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 157023.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 157056.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 157120.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 157120.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 157184.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 157247.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 157311.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 157376.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 157407.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 157472.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 157503.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 157503.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 157568.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 157600.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 157631.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 157631.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 157695.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 157695.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 157728.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 157760.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 157760.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 157791.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 157823.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 157823.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 157857.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 157857.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 157888.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 157921.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 157951.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 157951.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 157984.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 158015.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 158015.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 158049.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 158079.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 158079.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 158111.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 158111.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 158143.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 158176.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 158208.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 158240.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 158271.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 158271.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 158303.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 158336.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 158368.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 158368.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 158400.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 158432.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 158463.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 159008.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 159072.0,
                        "normalized": 0.992499983869493
                      },
                      {
                        "cursor": 159135.0,
                        "normalized": 0.9824999840930104
                      },
                      {
                        "cursor": 159199.0,
                        "normalized": 0.9724999843165278
                      },
                      {
                        "cursor": 159232.0,
                        "normalized": 0.9624999845400453
                      },
                      {
                        "cursor": 159264.0,
                        "normalized": 0.9524999847635627
                      },
                      {
                        "cursor": 159327.0,
                        "normalized": 0.9424999849870801
                      },
                      {
                        "cursor": 159359.0,
                        "normalized": 0.9324999852105975
                      },
                      {
                        "cursor": 159391.0,
                        "normalized": 0.9224999854341149
                      },
                      {
                        "cursor": 159391.0,
                        "normalized": 0.9124999856576324
                      },
                      {
                        "cursor": 159424.0,
                        "normalized": 0.9024999858811498
                      },
                      {
                        "cursor": 159456.0,
                        "normalized": 0.8924999861046672
                      },
                      {
                        "cursor": 159487.0,
                        "normalized": 0.8824999863281846
                      },
                      {
                        "cursor": 159519.0,
                        "normalized": 0.872499986551702
                      },
                      {
                        "cursor": 159551.0,
                        "normalized": 0.8624999867752194
                      },
                      {
                        "cursor": 159583.0,
                        "normalized": 0.8524999869987369
                      },
                      {
                        "cursor": 159583.0,
                        "normalized": 0.8424999872222543
                      },
                      {
                        "cursor": 159616.0,
                        "normalized": 0.8324999874457717
                      },
                      {
                        "cursor": 159648.0,
                        "normalized": 0.8224999876692891
                      },
                      {
                        "cursor": 159679.0,
                        "normalized": 0.8124999878928065
                      },
                      {
                        "cursor": 159711.0,
                        "normalized": 0.802499988116324
                      },
                      {
                        "cursor": 159711.0,
                        "normalized": 0.7924999883398414
                      },
                      {
                        "cursor": 159743.0,
                        "normalized": 0.7824999885633588
                      },
                      {
                        "cursor": 159775.0,
                        "normalized": 0.7724999887868762
                      },
                      {
                        "cursor": 159807.0,
                        "normalized": 0.7624999890103936
                      },
                      {
                        "cursor": 159807.0,
                        "normalized": 0.752499989233911
                      },
                      {
                        "cursor": 159840.0,
                        "normalized": 0.7424999894574285
                      },
                      {
                        "cursor": 159904.0,
                        "normalized": 0.7324999896809459
                      },
                      {
                        "cursor": 159904.0,
                        "normalized": 0.7224999899044633
                      },
                      {
                        "cursor": 159935.0,
                        "normalized": 0.7124999901279807
                      },
                      {
                        "cursor": 160000.0,
                        "normalized": 0.7024999903514981
                      },
                      {
                        "cursor": 160032.0,
                        "normalized": 0.6924999905750155
                      },
                      {
                        "cursor": 160096.0,
                        "normalized": 0.682499990798533
                      },
                      {
                        "cursor": 160096.0,
                        "normalized": 0.6724999910220504
                      },
                      {
                        "cursor": 160160.0,
                        "normalized": 0.6624999912455678
                      },
                      {
                        "cursor": 160160.0,
                        "normalized": 0.6524999914690852
                      },
                      {
                        "cursor": 160256.0,
                        "normalized": 0.6424999916926026
                      },
                      {
                        "cursor": 160256.0,
                        "normalized": 0.63249999191612
                      },
                      {
                        "cursor": 160353.0,
                        "normalized": 0.6224999921396375
                      },
                      {
                        "cursor": 160415.0,
                        "normalized": 0.6124999923631549
                      },
                      {
                        "cursor": 160479.0,
                        "normalized": 0.6024999925866723
                      },
                      {
                        "cursor": 160511.0,
                        "normalized": 0.5924999928101897
                      },
                      {
                        "cursor": 160543.0,
                        "normalized": 0.5824999930337071
                      },
                      {
                        "cursor": 160640.0,
                        "normalized": 0.5724999932572246
                      },
                      {
                        "cursor": 160671.0,
                        "normalized": 0.562499993480742
                      },
                      {
                        "cursor": 160671.0,
                        "normalized": 0.5524999937042594
                      },
                      {
                        "cursor": 160736.0,
                        "normalized": 0.5424999939277768
                      },
                      {
                        "cursor": 160736.0,
                        "normalized": 0.5324999941512942
                      },
                      {
                        "cursor": 160799.0,
                        "normalized": 0.5224999943748116
                      },
                      {
                        "cursor": 160799.0,
                        "normalized": 0.5124999945983291
                      },
                      {
                        "cursor": 160831.0,
                        "normalized": 0.5024999948218465
                      },
                      {
                        "cursor": 160864.0,
                        "normalized": 0.4924999950453639
                      },
                      {
                        "cursor": 160896.0,
                        "normalized": 0.4824999952688813
                      },
                      {
                        "cursor": 160928.0,
                        "normalized": 0.47249999549239874
                      },
                      {
                        "cursor": 161024.0,
                        "normalized": 0.46249999571591616
                      },
                      {
                        "cursor": 161024.0,
                        "normalized": 0.4524999959394336
                      },
                      {
                        "cursor": 161024.0,
                        "normalized": 0.442499996162951
                      },
                      {
                        "cursor": 161055.0,
                        "normalized": 0.4324999963864684
                      },
                      {
                        "cursor": 161055.0,
                        "normalized": 0.42249999660998583
                      },
                      {
                        "cursor": 161087.0,
                        "normalized": 0.41249999683350325
                      },
                      {
                        "cursor": 161119.0,
                        "normalized": 0.40249999705702066
                      },
                      {
                        "cursor": 161184.0,
                        "normalized": 0.3924999972805381
                      },
                      {
                        "cursor": 161184.0,
                        "normalized": 0.3824999975040555
                      },
                      {
                        "cursor": 161215.0,
                        "normalized": 0.3724999977275729
                      },
                      {
                        "cursor": 161248.0,
                        "normalized": 0.36249999795109034
                      },
                      {
                        "cursor": 161311.0,
                        "normalized": 0.35249999817460775
                      },
                      {
                        "cursor": 161344.0,
                        "normalized": 0.34249999839812517
                      },
                      {
                        "cursor": 161375.0,
                        "normalized": 0.3324999986216426
                      },
                      {
                        "cursor": 161439.0,
                        "normalized": 0.32249999884516
                      },
                      {
                        "cursor": 161472.0,
                        "normalized": 0.3124999990686774
                      },
                      {
                        "cursor": 161536.0,
                        "normalized": 0.30249999929219484
                      },
                      {
                        "cursor": 161631.0,
                        "normalized": 0.29249999951571226
                      },
                      {
                        "cursor": 161663.0,
                        "normalized": 0.2824999997392297
                      },
                      {
                        "cursor": 161663.0,
                        "normalized": 0.2724999999627471
                      },
                      {
                        "cursor": 161695.0,
                        "normalized": 0.2625000001862645
                      },
                      {
                        "cursor": 161727.0,
                        "normalized": 0.25250000040978193
                      },
                      {
                        "cursor": 161759.0,
                        "normalized": 0.24250000063329935
                      },
                      {
                        "cursor": 161855.0,
                        "normalized": 0.23250000085681677
                      },
                      {
                        "cursor": 161887.0,
                        "normalized": 0.2225000010803342
                      },
                      {
                        "cursor": 161952.0,
                        "normalized": 0.2125000013038516
                      },
                      {
                        "cursor": 161983.0,
                        "normalized": 0.20250000152736902
                      },
                      {
                        "cursor": 162016.0,
                        "normalized": 0.18250000197440386
                      },
                      {
                        "cursor": 162047.0,
                        "normalized": 0.17250000219792128
                      },
                      {
                        "cursor": 162080.0,
                        "normalized": 0.1625000024214387
                      },
                      {
                        "cursor": 162111.0,
                        "normalized": 0.1525000026449561
                      },
                      {
                        "cursor": 162111.0,
                        "normalized": 0.14250000286847353
                      },
                      {
                        "cursor": 162143.0,
                        "normalized": 0.13250000309199095
                      },
                      {
                        "cursor": 162175.0,
                        "normalized": 0.12250000331550837
                      },
                      {
                        "cursor": 162175.0,
                        "normalized": 0.11250000353902578
                      },
                      {
                        "cursor": 162208.0,
                        "normalized": 0.1025000037625432
                      },
                      {
                        "cursor": 162241.0,
                        "normalized": 0.09250000398606062
                      },
                      {
                        "cursor": 162271.0,
                        "normalized": 0.08250000420957804
                      },
                      {
                        "cursor": 162271.0,
                        "normalized": 0.07250000443309546
                      },
                      {
                        "cursor": 162304.0,
                        "normalized": 0.06250000465661287
                      },
                      {
                        "cursor": 162304.0,
                        "normalized": 0.05250000488013029
                      },
                      {
                        "cursor": 162336.0,
                        "normalized": 0.04250000510364771
                      },
                      {
                        "cursor": 162336.0,
                        "normalized": 0.03250000532716513
                      },
                      {
                        "cursor": 162367.0,
                        "normalized": 0.022500005550682545
                      },
                      {
                        "cursor": 162399.0,
                        "normalized": 0.012500005774199963
                      },
                      {
                        "cursor": 162432.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 163104.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 163104.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 163136.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 163167.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 163167.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 163199.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 163232.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 163232.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 163264.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 163264.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 163296.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 163328.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 163328.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 163392.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 163392.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 163424.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 163455.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 163552.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 163583.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 163648.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 163679.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 163679.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 163712.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 163712.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 163744.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 163744.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 163776.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 163808.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 163839.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 163839.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 163872.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 163872.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 163904.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 163935.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 163935.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 163968.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 164000.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 164000.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 164000.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 164032.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 164064.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 164064.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 164127.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 164127.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 164127.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 164159.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 164159.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 164192.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 164223.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 164223.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 164255.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 164351.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 164383.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 164448.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 164480.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 164511.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 164544.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 164575.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 164608.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 164608.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 164639.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 164672.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 164672.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 164703.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 164735.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 164735.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 164768.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 164800.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 164831.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 164831.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 164863.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 164895.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 164895.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 164895.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 164928.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 164960.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 164991.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 164991.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 165023.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 165023.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 165056.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 165088.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 165088.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 165120.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 165152.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 165248.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 165248.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 165312.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 165376.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 165408.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 165439.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 165471.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 165503.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 165536.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 165536.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 165600.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 165631.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 166079.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 166111.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 166111.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 166144.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 166175.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 166207.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 166207.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 166272.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 166304.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 166336.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 166367.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 166400.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 166400.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 166432.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 166432.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 166496.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 166496.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 166527.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 166559.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 166559.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 166591.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 166591.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 166623.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 166655.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 166655.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 166688.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 166719.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 166784.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 166848.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 166911.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 166975.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 167008.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 167039.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 167071.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 167103.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 167199.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 167199.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 167263.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 167359.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 167424.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 167424.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 167487.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 167584.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 167680.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 167711.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 167744.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 167808.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 167840.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 167903.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 167936.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 168032.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 168159.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 168191.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 168224.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 168384.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 168447.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 168447.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 168479.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 168544.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 168607.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 168672.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 168704.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 168767.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 168863.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 168992.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 168992.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 169087.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 169120.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 169184.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 169184.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 169280.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 169343.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 169376.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 169376.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 169472.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 169503.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 169535.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 169568.0,
                        "normalized": 0.18249997962266207
                      },
                      {
                        "cursor": 169568.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 169599.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 169632.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 169664.0,
                        "normalized": 0.14249998051673174
                      },
                      {
                        "cursor": 169695.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 169728.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 169759.0,
                        "normalized": 0.11249998118728399
                      },
                      {
                        "cursor": 169759.0,
                        "normalized": 0.10249998141080141
                      },
                      {
                        "cursor": 169759.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 169792.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 169823.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 169856.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 169856.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 169887.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 169887.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 169920.0,
                        "normalized": 0.012499983422458172
                      },
                      {
                        "cursor": 170783.0,
                        "normalized": 0.022499983198940754
                      },
                      {
                        "cursor": 170815.0,
                        "normalized": 0.032499982975423336
                      },
                      {
                        "cursor": 170847.0,
                        "normalized": 0.04249998275190592
                      },
                      {
                        "cursor": 170847.0,
                        "normalized": 0.0524999825283885
                      },
                      {
                        "cursor": 170847.0,
                        "normalized": 0.06249998230487108
                      },
                      {
                        "cursor": 170879.0,
                        "normalized": 0.07249998208135366
                      },
                      {
                        "cursor": 170879.0,
                        "normalized": 0.08249998185783625
                      },
                      {
                        "cursor": 170879.0,
                        "normalized": 0.09249998163431883
                      },
                      {
                        "cursor": 170912.0,
                        "normalized": 0.12249998096376657
                      },
                      {
                        "cursor": 170912.0,
                        "normalized": 0.13249998074024916
                      },
                      {
                        "cursor": 170976.0,
                        "normalized": 0.15249998029321432
                      },
                      {
                        "cursor": 170976.0,
                        "normalized": 0.1624999800696969
                      },
                      {
                        "cursor": 170976.0,
                        "normalized": 0.17249997984617949
                      },
                      {
                        "cursor": 171008.0,
                        "normalized": 0.19249997939914465
                      },
                      {
                        "cursor": 171040.0,
                        "normalized": 0.20249997917562723
                      },
                      {
                        "cursor": 171040.0,
                        "normalized": 0.2124999789521098
                      },
                      {
                        "cursor": 171040.0,
                        "normalized": 0.2224999787285924
                      },
                      {
                        "cursor": 171072.0,
                        "normalized": 0.23249997850507498
                      },
                      {
                        "cursor": 171072.0,
                        "normalized": 0.24249997828155756
                      },
                      {
                        "cursor": 171104.0,
                        "normalized": 0.25249997805804014
                      },
                      {
                        "cursor": 171135.0,
                        "normalized": 0.2624999778345227
                      },
                      {
                        "cursor": 171135.0,
                        "normalized": 0.2724999776110053
                      },
                      {
                        "cursor": 171199.0,
                        "normalized": 0.2824999773874879
                      },
                      {
                        "cursor": 171263.0,
                        "normalized": 0.29249997716397047
                      },
                      {
                        "cursor": 171328.0,
                        "normalized": 0.30249997694045305
                      },
                      {
                        "cursor": 171328.0,
                        "normalized": 0.31249997671693563
                      },
                      {
                        "cursor": 171423.0,
                        "normalized": 0.3224999764934182
                      },
                      {
                        "cursor": 171455.0,
                        "normalized": 0.3324999762699008
                      },
                      {
                        "cursor": 171519.0,
                        "normalized": 0.3424999760463834
                      },
                      {
                        "cursor": 171519.0,
                        "normalized": 0.35249997582286596
                      },
                      {
                        "cursor": 171551.0,
                        "normalized": 0.36249997559934855
                      },
                      {
                        "cursor": 171583.0,
                        "normalized": 0.3724999753758311
                      },
                      {
                        "cursor": 171615.0,
                        "normalized": 0.3824999751523137
                      },
                      {
                        "cursor": 171648.0,
                        "normalized": 0.3924999749287963
                      },
                      {
                        "cursor": 171679.0,
                        "normalized": 0.4024999747052789
                      },
                      {
                        "cursor": 171712.0,
                        "normalized": 0.41249997448176146
                      },
                      {
                        "cursor": 171744.0,
                        "normalized": 0.42249997425824404
                      },
                      {
                        "cursor": 171744.0,
                        "normalized": 0.4324999740347266
                      },
                      {
                        "cursor": 171744.0,
                        "normalized": 0.4424999738112092
                      },
                      {
                        "cursor": 171807.0,
                        "normalized": 0.4524999735876918
                      },
                      {
                        "cursor": 171807.0,
                        "normalized": 0.46249997336417437
                      },
                      {
                        "cursor": 171840.0,
                        "normalized": 0.47249997314065695
                      },
                      {
                        "cursor": 171871.0,
                        "normalized": 0.48249997291713953
                      },
                      {
                        "cursor": 171903.0,
                        "normalized": 0.4924999726936221
                      },
                      {
                        "cursor": 171903.0,
                        "normalized": 0.5024999724701047
                      },
                      {
                        "cursor": 171936.0,
                        "normalized": 0.5124999722465873
                      },
                      {
                        "cursor": 171936.0,
                        "normalized": 0.5224999720230699
                      },
                      {
                        "cursor": 171968.0,
                        "normalized": 0.5324999717995524
                      },
                      {
                        "cursor": 171968.0,
                        "normalized": 0.542499971576035
                      },
                      {
                        "cursor": 172000.0,
                        "normalized": 0.5524999713525176
                      },
                      {
                        "cursor": 172032.0,
                        "normalized": 0.5624999711290002
                      },
                      {
                        "cursor": 172032.0,
                        "normalized": 0.5724999709054828
                      },
                      {
                        "cursor": 172063.0,
                        "normalized": 0.5824999706819654
                      },
                      {
                        "cursor": 172096.0,
                        "normalized": 0.5924999704584479
                      },
                      {
                        "cursor": 172096.0,
                        "normalized": 0.6024999702349305
                      },
                      {
                        "cursor": 172128.0,
                        "normalized": 0.6124999700114131
                      },
                      {
                        "cursor": 172159.0,
                        "normalized": 0.6224999697878957
                      },
                      {
                        "cursor": 172159.0,
                        "normalized": 0.6324999695643783
                      },
                      {
                        "cursor": 172192.0,
                        "normalized": 0.6424999693408608
                      },
                      {
                        "cursor": 172192.0,
                        "normalized": 0.6524999691173434
                      },
                      {
                        "cursor": 172224.0,
                        "normalized": 0.662499968893826
                      },
                      {
                        "cursor": 172224.0,
                        "normalized": 0.6724999686703086
                      },
                      {
                        "cursor": 172255.0,
                        "normalized": 0.6824999684467912
                      },
                      {
                        "cursor": 172255.0,
                        "normalized": 0.6924999682232738
                      },
                      {
                        "cursor": 172320.0,
                        "normalized": 0.7024999679997563
                      },
                      {
                        "cursor": 172320.0,
                        "normalized": 0.7124999677762389
                      },
                      {
                        "cursor": 172351.0,
                        "normalized": 0.7224999675527215
                      },
                      {
                        "cursor": 172383.0,
                        "normalized": 0.7324999673292041
                      },
                      {
                        "cursor": 172416.0,
                        "normalized": 0.7424999671056867
                      },
                      {
                        "cursor": 172416.0,
                        "normalized": 0.7524999668821692
                      },
                      {
                        "cursor": 172448.0,
                        "normalized": 0.7624999666586518
                      },
                      {
                        "cursor": 172448.0,
                        "normalized": 0.7724999664351344
                      },
                      {
                        "cursor": 172479.0,
                        "normalized": 0.782499966211617
                      },
                      {
                        "cursor": 172511.0,
                        "normalized": 0.7924999659880996
                      },
                      {
                        "cursor": 172511.0,
                        "normalized": 0.8024999657645822
                      },
                      {
                        "cursor": 172544.0,
                        "normalized": 0.8124999655410647
                      },
                      {
                        "cursor": 172576.0,
                        "normalized": 0.8224999653175473
                      },
                      {
                        "cursor": 172607.0,
                        "normalized": 0.8324999650940299
                      },
                      {
                        "cursor": 172607.0,
                        "normalized": 0.8424999648705125
                      },
                      {
                        "cursor": 172607.0,
                        "normalized": 0.8524999646469951
                      },
                      {
                        "cursor": 172607.0,
                        "normalized": 0.8624999644234776
                      },
                      {
                        "cursor": 172640.0,
                        "normalized": 0.8724999641999602
                      },
                      {
                        "cursor": 172640.0,
                        "normalized": 0.8824999639764428
                      },
                      {
                        "cursor": 172671.0,
                        "normalized": 0.8924999637529254
                      },
                      {
                        "cursor": 172671.0,
                        "normalized": 0.902499963529408
                      },
                      {
                        "cursor": 172671.0,
                        "normalized": 0.9124999633058906
                      },
                      {
                        "cursor": 172704.0,
                        "normalized": 0.9224999630823731
                      },
                      {
                        "cursor": 172736.0,
                        "normalized": 0.9324999628588557
                      },
                      {
                        "cursor": 172736.0,
                        "normalized": 0.9424999626353383
                      },
                      {
                        "cursor": 172736.0,
                        "normalized": 0.9524999624118209
                      },
                      {
                        "cursor": 172768.0,
                        "normalized": 0.9624999621883035
                      },
                      {
                        "cursor": 172799.0,
                        "normalized": 0.972499961964786
                      },
                      {
                        "cursor": 172831.0,
                        "normalized": 0.9824999617412686
                      },
                      {
                        "cursor": 172831.0,
                        "normalized": 0.9924999615177512
                      },
                      {
                        "cursor": 172864.0,
                        "normalized": 1.0
                      },
                      {
                        "cursor": 172895.0,
                        "normalized": 1.0
                      }
                    ],
                    "path": "/pattern/1/pos",
                    "componentId": 464,
                    "parameterPath": "pos"
                  }
                ]
              }
            ],
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
                  "pos": 1.0,
                  "width": 0.2799999937415123
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
              "fader": 0.014285714365541935,
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
              "focusedPattern": 3,
              "triggerPatternCycle": false
            },
            "children": {},
            "effects": [
              {
                "id": 616,
                "class": "heronarts.lx.effect.HueSaturationEffect",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false
                },
                "parameters": {
                  "label": "Hue + Saturation",
                  "enabled": true,
                  "hue": 0.0,
                  "saturation": 100.0,
                  "brightness": 0.0
                },
                "children": {
                  "modulation": {
                    "id": 617,
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
                        "patternIndex": 3
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
            "patternIndex": 3,
            "patterns": [
              {
                "id": 608,
                "class": "heronarts.lx.pattern.texture.SparklePattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Sparkle",
                  "density": 108.16000446319585,
                  "speed": 0.6600000075995922,
                  "variation": 56.99999928474426,
                  "duration": 30.000001564621925,
                  "sharp": 0.05999999865889549,
                  "waveshape": 4,
                  "minInterval": 0.6989999866113066,
                  "maxInterval": 0.1,
                  "baseLevel": 15.999999642372131,
                  "minLevel": 77.99999993294477,
                  "maxLevel": 100.0
                },
                "children": {
                  "modulation": {
                    "id": 609,
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
                "id": 619,
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
                  "pos": 0.5299999881535769,
                  "width": 0.0
                },
                "children": {
                  "modulation": {
                    "id": 620,
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
                "id": 629,
                "class": "heronarts.lx.pattern.color.SolidPattern",
                "internal": {
                  "modulationColor": 0,
                  "expanded": true,
                  "modulationExpanded": false,
                  "autoCycleEligible": true
                },
                "parameters": {
                  "label": "Solid",
                  "color/brightness": 100.0,
                  "color/saturation": 100.0,
                  "color/hue": 0.0,
                  "colorMode": 0,
                  "paletteIndex": 1
                },
                "children": {
                  "modulation": {
                    "id": 630,
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
                "id": 631,
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
                  "yAmount": 0.0,
                  "zAmount": 0.0,
                  "xOffset": 0.0,
                  "yOffset": 0.0,
                  "zOffset": 0.0,
                  "colorMode": 0,
                  "blendMode": 0,
                  "gradient": 0.428571417927742,
                  "fixedColor/brightness": 100.0,
                  "fixedColor/saturation": 100.0,
                  "fixedColor/hue": 0.0,
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
              "running": true,
              "trigger": false,
              "loop": true,
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
            "basis": 0.2608250516334304
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
              "id": 34,
              "path": "/modulation/modulator/1"
            },
            "target": {
              "componentId": 616,
              "parameterPath": "hue",
              "path": "/mixer/channel/3/effect/1/hue"
            },
            "id": 635,
            "class": "heronarts.lx.modulation.LXCompoundModulation",
            "internal": {
              "modulationColor": 0
            },
            "parameters": {
              "label": "LX",
              "enabled": true,
              "Polarity": 0,
              "Range": 0.4999999925494194
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
          "autoCycleTimeSecs": 65.0,
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/axis",
                "value": 0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/pos",
                "value": 0.0,
                "normalizedValue": 0.0
              },
              {
                "scope": "PATTERNS",
                "type": "PARAMETER",
                "enabled": true,
                "parameterPath": "/lx/mixer/channel/2/pattern/1/width",
                "value": 0.25999999418854713,
                "normalizedValue": 0.25999999418854713
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
      "clipViewVisible": true,
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