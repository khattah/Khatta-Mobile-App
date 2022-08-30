class CountryCodeModel {
  String id;
  int code;
  String iso;
  String countryName;
  CountryCodeModel({this.id, this.code, this.iso, this.countryName});

  CountryCodeModel.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    code = json["code"];
    iso = json["iso"];
    countryName = json["country"];
  }
  static List<CountryCodeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => CountryCodeModel.fromMap(data)).toList();
  }
}
