class Statewise {
  String state;
  int confirmed;
  int deaths;
  int recovered;
  int active;


  Statewise(
      {
        this.state,
        this.confirmed,
        this.deaths,
        this.recovered,
        this.active,
       });


  Statewise.fromJson(Map<String,dynamic> json) {
    state = json['state'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    return data;
  }
}