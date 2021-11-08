/// error : false
/// message : "success"
/// data : {"fieldCount":0,"affectedRows":0,"insertId":0,"serverStatus":2,"warningCount":0,"message":"(Rows matched: 0  Changed: 0  Warnings: 0","protocol41":true,"changedRows":0}

class CategoryEdit {
  CategoryEdit({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  CategoryEdit.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;

  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// fieldCount : 0
/// affectedRows : 0
/// insertId : 0
/// serverStatus : 2
/// warningCount : 0
/// message : "(Rows matched: 0  Changed: 0  Warnings: 0"
/// protocol41 : true
/// changedRows : 0

class Data {
  Data({
      int? fieldCount, 
      int? affectedRows, 
      int? insertId, 
      int? serverStatus, 
      int? warningCount, 
      String? message, 
      bool? protocol41, 
      int? changedRows,}){
    _fieldCount = fieldCount;
    _affectedRows = affectedRows;
    _insertId = insertId;
    _serverStatus = serverStatus;
    _warningCount = warningCount;
    _message = message;
    _protocol41 = protocol41;
    _changedRows = changedRows;
}

  Data.fromJson(dynamic json) {
    _fieldCount = json['fieldCount'];
    _affectedRows = json['affectedRows'];
    _insertId = json['insertId'];
    _serverStatus = json['serverStatus'];
    _warningCount = json['warningCount'];
    _message = json['message'];
    _protocol41 = json['protocol41'];
    _changedRows = json['changedRows'];
  }
  int? _fieldCount;
  int? _affectedRows;
  int? _insertId;
  int? _serverStatus;
  int? _warningCount;
  String? _message;
  bool? _protocol41;
  int? _changedRows;

  int? get fieldCount => _fieldCount;
  int? get affectedRows => _affectedRows;
  int? get insertId => _insertId;
  int? get serverStatus => _serverStatus;
  int? get warningCount => _warningCount;
  String? get message => _message;
  bool? get protocol41 => _protocol41;
  int? get changedRows => _changedRows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fieldCount'] = _fieldCount;
    map['affectedRows'] = _affectedRows;
    map['insertId'] = _insertId;
    map['serverStatus'] = _serverStatus;
    map['warningCount'] = _warningCount;
    map['message'] = _message;
    map['protocol41'] = _protocol41;
    map['changedRows'] = _changedRows;
    return map;
  }

}