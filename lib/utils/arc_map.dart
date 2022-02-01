class Arc {
  static Map<String, dynamic> arcMap = {
    "C_LU": {"direction": -1, "start": 90, "end": 0, "operator": ">"},
    "C_RU": {"direction": 1, "start": 90, "end": 180, "operator": "<"},
    "C_RB": {"direction": -1, "start": 270, "end": 180, "operator": ">"},
    "C_UL": {"direction": 1, "start": 0, "end": 90, "operator": "<"},
    "C_BL": {"direction": -1, "start": 0, "end": -90, "operator": ">"},
    "C_UR": {"direction": -1, "start": 180, "end": 90, "operator": ">"},
    "C_BR": {"direction": 1, "start": 180, "end": 270, "operator": "<"},
    "C_LB": {"direction": 1, "start": 270, "end": 360, "operator": "<"},
    "L_LR": {"direction": 1, "type": "H", "end": null, "operator": "<"},
    "L_RL": {"direction": -1, "type": "H", "end": null, "operator": ">"},
    "L_UD": {"direction": 1, "type": "V", "end": null, "operator": "<"},
    "L_DU": {"direction": -1, "type": "V", "end": null, "operator": ">"},
  };
}
