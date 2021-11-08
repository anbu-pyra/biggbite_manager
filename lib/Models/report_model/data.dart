class Data {
  Data({
      int? id, 
      String? orderReferenceId, 
      String? mobileNumber, 
      int? totalPrice, 
      dynamic deliveryCharge, 
      String? status, 
      String? orderType, 
      String? paymentStatus, 
      String? deliveryInstructions, 
      String? name, 
      String? houseNo, 
      String? cgst, 
      String? sgst, 
      String? fcmToken, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _orderReferenceId = orderReferenceId;
    _mobileNumber = mobileNumber;
    _totalPrice = totalPrice;
    _deliveryCharge = deliveryCharge;
    _status = status;
    _orderType = orderType;
    _paymentStatus = paymentStatus;
    _deliveryInstructions = deliveryInstructions;
    _name = name;
    _houseNo = houseNo;
    _cgst = cgst;
    _sgst = sgst;
    _fcmToken = fcmToken;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderReferenceId = json['order_reference_id'];
    _mobileNumber = json['mobile_number'];
    _totalPrice = json['total_price'];
    _deliveryCharge = json['delivery_charge'];
    _status = json['status'];
    _orderType = json['order_type'];
    _paymentStatus = json['payment_status'];
    _deliveryInstructions = json['delivery_instructions'];
    _name = json['name'];
    _houseNo = json['house_no'];
    _cgst = json['cgst'];
    _sgst = json['sgst'];
    _fcmToken = json['fcm_token'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _orderReferenceId;
  String? _mobileNumber;
  int? _totalPrice;
  dynamic _deliveryCharge;
  String? _status;
  String? _orderType;
  String? _paymentStatus;
  String? _deliveryInstructions;
  String? _name;
  String? _houseNo;
  String? _cgst;
  String? _sgst;
  String? _fcmToken;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  String? get orderReferenceId => _orderReferenceId;
  String? get mobileNumber => _mobileNumber;
  int? get totalPrice => _totalPrice;
  dynamic get deliveryCharge => _deliveryCharge;
  String? get status => _status;
  String? get orderType => _orderType;
  String? get paymentStatus => _paymentStatus;
  String? get deliveryInstructions => _deliveryInstructions;
  String? get name => _name;
  String? get houseNo => _houseNo;
  String? get cgst => _cgst;
  String? get sgst => _sgst;
  String? get fcmToken => _fcmToken;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_reference_id'] = _orderReferenceId;
    map['mobile_number'] = _mobileNumber;
    map['total_price'] = _totalPrice;
    map['delivery_charge'] = _deliveryCharge;
    map['status'] = _status;
    map['order_type'] = _orderType;
    map['payment_status'] = _paymentStatus;
    map['delivery_instructions'] = _deliveryInstructions;
    map['name'] = _name;
    map['house_no'] = _houseNo;
    map['cgst'] = _cgst;
    map['sgst'] = _sgst;
    map['fcm_token'] = _fcmToken;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}