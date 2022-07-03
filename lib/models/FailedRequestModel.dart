import 'dart:convert';
/// status_message : "Invalid API key: You must be granted a valid key."
/// success : false
/// status_code : 7

FailedRequestModel failedRequestModelFromJson(String str) => FailedRequestModel.fromJson(json.decode(str));
String failedRequestModelToJson(FailedRequestModel data) => json.encode(data.toJson());
class FailedRequestModel {
  FailedRequestModel({
      String? statusMessage, 
      bool? success, 
      int? statusCode,}){
    _statusMessage = statusMessage;
    _success = success;
    _statusCode = statusCode;
}

  FailedRequestModel.fromJson(dynamic json) {
    _statusMessage = json['status_message'];
    _success = json['success'];
    _statusCode = json['status_code'];
  }
  String? _statusMessage;
  bool? _success;
  int? _statusCode;
FailedRequestModel copyWith({  String? statusMessage,
  bool? success,
  int? statusCode,
}) => FailedRequestModel(  statusMessage: statusMessage ?? _statusMessage,
  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
);
  String? get statusMessage => _statusMessage;
  bool? get success => _success;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_message'] = _statusMessage;
    map['success'] = _success;
    map['status_code'] = _statusCode;
    return map;
  }

}