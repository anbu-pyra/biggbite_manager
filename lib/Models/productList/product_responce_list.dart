/// error : false
/// message : "success"
/// data : [{"id":1,"category_id":1,"product_name":"Oppo v1","max_quantity":5,"description":"6 GB RAM | 256 GB ROM\r\n16.51 cm (6.5 inch) Display\r\n48MP + 8MP + 2MP + 2MP | 16MP Front Camera\r\n4000 mAh Battery\r\nMediaTek Helio P70 Processor\r\nUltra Night Mode 2.0","slashed_price":1500,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":2,"category_id":1,"product_name":"Vivo v2","max_quantity":3,"description":"6 GB RAM | 256 GB ROM\r\n16.51 cm (6.5 inch) Display\r\n48MP + 8MP + 2MP + 2MP | 16MP Front Camera\r\n4000 mAh Battery\r\nMediaTek Helio P70 Processor\r\nUltra Night Mode 2.0","slashed_price":20000,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":3,"category_id":2,"product_name":"ERD charger","max_quantity":15,"description":"TYPE - C","slashed_price":500,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":4,"category_id":1,"product_name":"design kjdsf","max_quantity":1,"description":"hello description","slashed_price":15000,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":5,"category_id":4,"product_name":"old product","max_quantity":1,"description":"hello description","slashed_price":15000,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":6,"category_id":4,"product_name":"old productss","max_quantity":1,"description":"hello description","slashed_price":15000,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":7,"category_id":5,"product_name":"jsjs","max_quantity":25,"description":"yswhs","slashed_price":30,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":8,"category_id":1,"product_name":"Redmi note 5 pro","max_quantity":15,"description":"hi","slashed_price":13000,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":9,"category_id":1,"product_name":"nxnx","max_quantity":887,"description":"zzzj","slashed_price":1111,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":10,"category_id":1,"product_name":"aaaa","max_quantity":1,"description":"a","slashed_price":1,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"},{"id":11,"category_id":11,"product_name":"apple","max_quantity":15,"description":"its good and frish","slashed_price":120,"photo":"","is_veg":0,"status":1,"price":100,"gst":null,"specifications":"[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]","updated_at":"2021-10-09T14:21:13.000Z","created_at":"2021-10-09T14:21:13.000Z"}]

class ProductResponceList {
  ProductResponceList({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ProductResponceList.fromJson(dynamic json) {
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
/// category_id : 1
/// product_name : "Oppo v1"
/// max_quantity : 5
/// description : "6 GB RAM | 256 GB ROM\r\n16.51 cm (6.5 inch) Display\r\n48MP + 8MP + 2MP + 2MP | 16MP Front Camera\r\n4000 mAh Battery\r\nMediaTek Helio P70 Processor\r\nUltra Night Mode 2.0"
/// slashed_price : 1500
/// photo : ""
/// is_veg : 0
/// status : 1
/// price : 100
/// gst : null
/// specifications : "[{\"key\":\"spec\",\"value\":\"vlaues\"},{\"key\":\"spec\",\"value\":\"vlaues\"}]"
/// updated_at : "2021-10-09T14:21:13.000Z"
/// created_at : "2021-10-09T14:21:13.000Z"

class Data {
  Data({
      int? id, 
      int? categoryId, 
      String? productName, 
      int? maxQuantity, 
      String? description, 
      int? slashedPrice, 
      String? photo, 
      int? isVeg, 
      int? status, 
      int? price, 
      dynamic gst, 
      String? specifications, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _categoryId = categoryId;
    _productName = productName;
    _maxQuantity = maxQuantity;
    _description = description;
    _slashedPrice = slashedPrice;
    _photo = photo;
    _isVeg = isVeg;
    _status = status;
    _price = price;
    _gst = gst;
    _specifications = specifications;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _productName = json['product_name'];
    _maxQuantity = json['max_quantity'];
    _description = json['description'];
    _slashedPrice = json['slashed_price'];
    _photo = json['photo'];
    _isVeg = json['is_veg'];
    _status = json['status'];
    _price = json['price'];
    _gst = json['gst'];
    _specifications = json['specifications'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  int? _id;
  int? _categoryId;
  String? _productName;
  int? _maxQuantity;
  String? _description;
  int? _slashedPrice;
  String? _photo;
  int? _isVeg;
  int? _status;
  int? _price;
  dynamic _gst;
  String? _specifications;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  int? get categoryId => _categoryId;
  String? get productName => _productName;
  int? get maxQuantity => _maxQuantity;
  String? get description => _description;
  int? get slashedPrice => _slashedPrice;
  String? get photo => _photo;
  int? get isVeg => _isVeg;
  int? get status => _status;
  int? get price => _price;
  dynamic get gst => _gst;
  String? get specifications => _specifications;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['product_name'] = _productName;
    map['max_quantity'] = _maxQuantity;
    map['description'] = _description;
    map['slashed_price'] = _slashedPrice;
    map['photo'] = _photo;
    map['is_veg'] = _isVeg;
    map['status'] = _status;
    map['price'] = _price;
    map['gst'] = _gst;
    map['specifications'] = _specifications;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}