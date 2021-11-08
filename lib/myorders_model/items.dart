class Items {
  Items({
    int? id,
    int? orderId,
    int? categoryId,
    int? productId,
    int? quantity,
    int? price,
    int? totalPrice,
    String? updatedAt,
    String? createdAt,
    String? product_name,
  }) {
    _id = id;
    _orderId = orderId;
    _categoryId = categoryId;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _totalPrice = totalPrice;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _product_name = product_name;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _price = json['price'];
    _totalPrice = json['total_price'];
    _product_name = json['product_name'];
  }
  int? _id;
  int? _orderId;
  int? _categoryId;
  int? _productId;
  int? _quantity;
  int? _price;
  int? _totalPrice;
  String? _updatedAt;
  String? _createdAt;
  String? _product_name;

  int? get id => _id;
  int? get orderId => _orderId;
  int? get categoryId => _categoryId;
  int? get productId => _productId;
  int? get quantity => _quantity;
  int? get price => _price;
  int? get totalPrice => _totalPrice;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  String? get product_name => _product_name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['category_id'] = _categoryId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['total_price'] = _totalPrice;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }
}
