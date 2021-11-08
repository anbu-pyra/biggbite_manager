class Data {
  Data({
    int? id,
    String? bannerUrl,
    int? categoryId,
    int? productId,
    String? updatedAt,
    String? createdAt,
  }) {
    _id = id;
    _bannerUrl = bannerUrl;
    _categoryId = categoryId;
    _productId = productId;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _bannerUrl = json['banner_url'];
    _categoryId = json['category_id'];
    _productId = json['product_id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _bannerUrl;
  int? _categoryId;
  int? _productId;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  String? get bannerUrl => _bannerUrl;
  int? get categoryId => _categoryId;
  int? get productId => _productId;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['banner_url'] = _bannerUrl;
    map['category_id'] = _categoryId;
    map['product_id'] = _productId;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }
}
