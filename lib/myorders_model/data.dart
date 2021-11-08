import 'items.dart';

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
    String? houseNo,
    String? address,
    String? cgst,
    String? sgst,
    String? updatedAt,
    String? createdAt,
    String? fcmToken,
    List<Items>? items,
  }) {
    _id = id;
    _orderReferenceId = orderReferenceId;
    _mobileNumber = mobileNumber;
    _totalPrice = totalPrice;
    _deliveryCharge = deliveryCharge;
    _status = status;
    _orderType = orderType;
    _paymentStatus = paymentStatus;
    _deliveryInstructions = deliveryInstructions;
    _houseNo = houseNo;
    _address = address;
    _cgst = cgst;
    _sgst = sgst;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _fcmToken = fcmToken;
    _items = items;
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
    _houseNo = json['house_no'];
    _address = json['address'];
    _cgst = json['cgst'];
    _sgst = json['sgst'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _fcmToken = json['fcm_token'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
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
  String? _houseNo;
  String? _address;
  String? _cgst;
  String? _sgst;
  String? _updatedAt;
  String? _createdAt;
  String? _fcmToken;
  List<Items>? _items;

  int? get id => _id;
  String? get orderReferenceId => _orderReferenceId;
  String? get mobileNumber => _mobileNumber;
  int? get totalPrice => _totalPrice;
  dynamic get deliveryCharge => _deliveryCharge;
  String? get status => _status;
  String? get orderType => _orderType;
  String? get paymentStatus => _paymentStatus;
  String? get deliveryInstructions => _deliveryInstructions;
  String? get houseNo => _houseNo;
  String? get address => _address;
  String? get cgst => _cgst;
  String? get sgst => _sgst;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  String? get fcmToken => _fcmToken;
  List<Items>? get items => _items;

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
    map['house_no'] = _houseNo;
    map['address'] = _address;
    map['cgst'] = _cgst;
    map['sgst'] = _sgst;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
