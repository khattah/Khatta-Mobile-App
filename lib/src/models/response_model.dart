class ResponseModel {
  // bool success;
  bool status;
  String message;
  dynamic data;
  int errorCode;
  ResponseModel({this.status = false, this.message = "", this.errorCode = 200});
  // ResponseModel();
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    // print("muller ....****");
    // print(json["content"]);
    var model = ResponseModel();
    model.status = json["status"];
    // model.status = json["error_code"] != null ? json["error_code"] : 200;
    model.message = json["message"] as String;
    model.data = json["content"] == "" ? [] : json["content"];
    return model;
  }
  factory ResponseModel.fromMap(Map<String, dynamic> json) {
    var model = ResponseModel();
    model.status = json["status"];
    // model.status = json["error_code"] != null ? json["error_code"] : 200;
    model.message = json["message"] as String;
    model.data = json["content"];
    return model;
  }

  bool get isValid => status == true && data != null;

  @override
  String toString() {
    return "$status , $status, $message $data";
  }

  bool get isSuccess => status == true && status == 200;
}
