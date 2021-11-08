import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:bigg_bite_manager/Models/banner_model/banner_response_model.dart';
import 'package:bigg_bite_manager/Models/categoryList/category_edit.dart';
import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/Models/productList/product_responce_list.dart';
import 'package:bigg_bite_manager/Models/report_model/report_response_model.dart';
import 'package:bigg_bite_manager/common_response_model.dart';
import 'package:bigg_bite_manager/myorders_model/my_order_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';

String BASE_URL_IMAGE = "http://biggbitecafe.in";

Future<CategoryResponseList> getCategoryResponceList(context) async {
  CategoryResponseList result = CategoryResponseList();
  try {
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/getCategories"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CategoryResponseList.fromJson(item);
    } else {}
  } catch (e) {}
  return result;
}

Future<BannerResponseModel> getBannerList(context) async {
  BannerResponseModel result = BannerResponseModel();
  try {
    final response = await http.get(
      Uri.parse("http://biggbitecafe.in/api/admin/user/getBanners"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = BannerResponseModel.fromJson(item);
    } else {}
  } catch (e) {}
  return result;
}

Future<MyOrderResponseModel> getOrderList(context, String status) async {
  MyOrderResponseModel result = MyOrderResponseModel();
  try {
    var body = jsonEncode({'status': status});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/getCurrentOrders"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = MyOrderResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e);
  }
  return result;
}

getCategoryListApi(context) async {
  CategoryResponseList result = CategoryResponseList();
  try {
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/getCategories"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CategoryResponseList.fromJson(item);
    } else {}
  } catch (e) {}
  return result;
}

Future<ProductResponceList> getProductResponceList(context) async {
  ProductResponceList result = ProductResponceList();
  try {
    final response = await http.get(
      Uri.parse("http://biggbitecafe.in/api/admin/getAllProducts"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = ProductResponceList.fromJson(item);
    } else {}
  } catch (e) {}
  return result;
}

getCategoryEditList(
    context, String categoryName, int id, String imageUrl) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode(
        {'category_name': categoryName, 'id': id, 'category_image': imageUrl});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/updateCategory"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e);
  }
  return result;
}

editBannerApi(context, String id, String imageUrl, String categoryId) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode(
        {'id': id, 'banner_url': imageUrl, 'category_id': categoryId});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/updateBanner"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e);
  }
  return result;
}

deleteBanner(context, String id) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({
      'id': id,
    });
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/deleteBanner"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e);
  }
  return result;
}

updateOrderStatus(
    context, String status, String id, String orderNo, String fcmToken) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({
      'id': id,
      'status': status,
      'order_reference_id': orderNo,
      'fcm_token': fcmToken
    });
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/updateOrderStatus"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

getReport(context, String fromDate, String toDate) async {
  ReportResponseModel result = ReportResponseModel();
  try {
    var body = jsonEncode({'from_date': fromDate, 'to_date': toDate});
    print(body);
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/getReportByDateRange"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = ReportResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

deleteCategory(context, String id) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({'id': id});
    print(body);
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/deleteCategory"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

deleteProduct(context, String id) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({'id': id});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/deleteProduct"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

createNewCategory(context, String categoryName, String imageurl) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body =
        jsonEncode({'category_name': categoryName, 'category_image': imageurl});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/createCategory"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

createNewBanner(context, String bannerUrl, String category_id) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body =
        jsonEncode({'banner_url': bannerUrl, 'category_id': category_id});
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/createBanner"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

addNewDish(
  context,
  String categoryId,
  String productName,
  String maxQuantity,
  String description,
  String slashedPrice,
  String offerPercentage,
  String photo,
  String isVeg,
  String status,
  String price,
  String gst,
) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({
      'category_id': categoryId,
      'product_name': productName,
      'max_quantity': maxQuantity,
      'description': description,
      'slashed_price': slashedPrice,
      'offer_percentage': offerPercentage,
      'photo': photo,
      'is_veg': isVeg,
      'status': status,
      'price': price,
      'gst': gst,
    });
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/createProduct"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

editDish(
  context,
  String categoryId,
  String productName,
  String maxQuantity,
  String description,
  String slashedPrice,
  String offerPercentage,
  String photo,
  String isVeg,
  String status,
  String price,
  String id,
) async {
  CommonResponseModel result = CommonResponseModel();
  try {
    var body = jsonEncode({
      'category_id': categoryId,
      'product_name': productName,
      'max_quantity': maxQuantity,
      'description': description,
      'slashed_price': slashedPrice,
      'offer_percentage': offerPercentage,
      'photo': photo,
      'is_veg': isVeg,
      'status': status,
      'price': price,
      'id': id,
    });
    final response = await http.post(
      Uri.parse("http://biggbitecafe.in/api/admin/updateProduct"),
      body: body,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CommonResponseModel.fromJson(item);
    } else {}
  } catch (e) {
    print(e.toString());
  }
  return result;
}

uploadImage(filepath, XFile? imageFile) async {
  CommonResponseModel result = CommonResponseModel();

  var request = http.MultipartRequest(
      'POST', Uri.parse('http://biggbitecafe.in/api/admin/uploadImage'));
  if (kIsWeb) {
    PickedFile imageFile = PickedFile(filepath);
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

    var multipartFile = new http.MultipartFile(
        'uploadFile', stream, File(filepath).lengthSync(),
        filename: filepath.split("/").last);

    request.files.add(multipartFile);
  } else {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', filepath));
  }
  var res = await request.send();
  if (res.statusCode == 200) {
    final respStr = await res.stream.bytesToString();

    final item = json.decode(respStr);
    result = CommonResponseModel.fromJson(item);
  }
  print(res);
  return result;
}
