class Country {
  String? apikey;
  List<Data>? data;
  String? status;
  Info? info;

  Country({this.apikey, this.data, this.status, this.info});

  Country.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? genericFlag;

  Data({this.id, this.name, this.genericFlag});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genericFlag = json['genericFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['genericFlag'] = this.genericFlag;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? totalRows;
  double? queryTime;
  int? s;
  int? cache;

  Info(
      {this.hitsToday,
      this.hitsUsed,
      this.hitsLimit,
      this.credits,
      this.server,
      this.offsetRows,
      this.totalRows,
      this.queryTime,
      this.s,
      this.cache});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    totalRows = json['totalRows'];
    queryTime = json['queryTime'];
    s = json['s'];
    cache = json['cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hitsToday'] = this.hitsToday;
    data['hitsUsed'] = this.hitsUsed;
    data['hitsLimit'] = this.hitsLimit;
    data['credits'] = this.credits;
    data['server'] = this.server;
    data['offsetRows'] = this.offsetRows;
    data['totalRows'] = this.totalRows;
    data['queryTime'] = this.queryTime;
    data['s'] = this.s;
    data['cache'] = this.cache;
    return data;
  }
}
