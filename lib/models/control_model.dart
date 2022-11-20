class ControlPanel {
  bool bathroomLight = false;
  bool livingRoomLight = false;
  bool bedRoomLight = false;
  bool livingRoomCurtain = false;
  bool airConditioner = false;

  ControlPanel(
      {required this.bathroomLight,
        required this.livingRoomLight,
        required this.bedRoomLight,
        required this.livingRoomCurtain,
        required this.airConditioner});


  ControlPanel.fromJson(Map<String, dynamic> json) {
    bathroomLight = json['bathroomLight'];
    livingRoomLight = json['livingRoomLight'];
    bedRoomLight = json['bedRoomLight'];
    livingRoomCurtain = json['livingRoomCurtain'];
    airConditioner = json['airConditioner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bathroomLight'] = this.bathroomLight;
    data['livingRoomLight'] = this.livingRoomLight;
    data['bedRoomLight'] = this.bedRoomLight;
    data['livingRoomCurtain'] = this.livingRoomCurtain;
    data['airConditioner'] = this.airConditioner;
    return data;
  }
}