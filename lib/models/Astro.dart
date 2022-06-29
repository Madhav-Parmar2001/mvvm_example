class Astro {
  String product;
  String init;
  List<Dataseries> dataseries;

  Astro({this.product, this.init, this.dataseries});

  Astro.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    init = json['init'];
    if (json['dataseries'] != null) {
      dataseries = <Dataseries>[];
      json['dataseries'].forEach((v) {
        dataseries.add(new Dataseries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['init'] = this.init;
    if (this.dataseries != null) {
      data['dataseries'] = this.dataseries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dataseries {
  int timepoint;
  int cloudcover;
  int seeing;
  int transparency;
  int liftedIndex;
  int rh2m;
  Wind10m wind10m;
  int temp2m;
  String precType;

  Dataseries(
      {this.timepoint,
        this.cloudcover,
        this.seeing,
        this.transparency,
        this.liftedIndex,
        this.rh2m,
        this.wind10m,
        this.temp2m,
        this.precType});

  Dataseries.fromJson(Map<String, dynamic> json) {
    timepoint = json['timepoint'];
    cloudcover = json['cloudcover'];
    seeing = json['seeing'];
    transparency = json['transparency'];
    liftedIndex = json['lifted_index'];
    rh2m = json['rh2m'];
    wind10m =
    json['wind10m'] != null ? new Wind10m.fromJson(json['wind10m']) : null;
    temp2m = json['temp2m'];
    precType = json['prec_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timepoint'] = this.timepoint;
    data['cloudcover'] = this.cloudcover;
    data['seeing'] = this.seeing;
    data['transparency'] = this.transparency;
    data['lifted_index'] = this.liftedIndex;
    data['rh2m'] = this.rh2m;
    if (this.wind10m != null) {
      data['wind10m'] = this.wind10m.toJson();
    }
    data['temp2m'] = this.temp2m;
    data['prec_type'] = this.precType;
    return data;
  }
}

class Wind10m {
  String direction;
  int speed;

  Wind10m({this.direction, this.speed});

  Wind10m.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['direction'] = this.direction;
    data['speed'] = this.speed;
    return data;
  }
}