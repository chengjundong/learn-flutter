class DataModel {
  int? code;
  Data? data;
  String? msg;

  DataModel({this.code, this.data, this.msg});

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['code'] = code;
    if (data != null) {
      result['data'] = data!.toJson();
    }
    result['msg'] = msg;
    return result;
  }
}

class Data {
  int? code;
  String? method;
  String? requestPrams;

  Data({this.code, this.method, this.requestPrams});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    method = json['method'];
    requestPrams = json['requestPrams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['code'] = code;
    result['method'] = method;
    result['requestPrams'] = requestPrams;
    return result;
  }
}
