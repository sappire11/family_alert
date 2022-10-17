class data {
  int? fallState;
  String? fallTime;
  int? smokeState;
  String? smokeTime;
  int? smokeValue;
  int? carbonState;
  String? carbonTime;
  int? carbonValue;

  data(
      {this.fallState,
        this.fallTime,
        this.smokeState,
        this.smokeTime,
        this.smokeValue,
        this.carbonState,
        this.carbonTime,
        this.carbonValue});

  data.fromJson(Map<String, dynamic> json) {
    fallState = json['fall_state'];
    fallTime = json['fall_time'];
    smokeState = json['smoke_state'];
    smokeTime = json['smoke_time'];
    smokeValue = json['smoke_value'];
    carbonState = json['carbon_state'];
    carbonTime = json['carbon_time'];
    carbonValue = json['carbon_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fall_state'] = this.fallState;
    data['fall_time'] = this.fallTime;
    data['smoke_state'] = this.smokeState;
    data['smoke_time'] = this.smokeTime;
    data['smoke_value'] = this.smokeValue;
    data['carbon_state'] = this.carbonState;
    data['carbon_time'] = this.carbonTime;
    data['carbon_value'] = this.carbonValue;
    return data;
  }
}