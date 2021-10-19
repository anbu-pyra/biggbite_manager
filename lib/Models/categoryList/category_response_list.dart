/// error : false
/// message : "success"
/// data : [{"id":1,"category_name":"Mobilesjff anbu"},{"id":2,"category_name":"Chargers"},{"id":3,"category_name":"hello"},{"id":4,"category_name":"hello"},{"id":5,"category_name":"new one"},{"id":6,"category_name":"dsfklklfdjsklj"},{"id":7,"category_name":"hellodsjf"},{"id":8,"category_name":"new anbu"},{"id":9,"category_name":"vghh"},{"id":10,"category_name":"any"},{"id":11,"category_name":"vicky"}]

class CategoryResponseList {
  CategoryResponseList({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  CategoryResponseList.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;

  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// category_name : "Mobilesjff anbu"

class Data {
  Data({
      int? id, 
      String? categoryName,}){
    _id = id;
    _categoryName = categoryName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
  }
  int? _id;
  String? _categoryName;

  int? get id => _id;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    return map;
  }

}