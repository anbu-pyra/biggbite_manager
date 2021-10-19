import 'dart:convert';
import 'dart:io';

import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/Models/productList/product_responce_list.dart';
import 'package:http/http.dart' as http;


Future<CategoryResponseList> getCategoryResponceList(context) async {
  CategoryResponseList result=CategoryResponseList();
  try {
    final response = await http.post(
      Uri.parse("http://139.59.53.68:3001/api/admin/getCategories"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = CategoryResponseList.fromJson(item);
    } else {
       }
  } catch (e) {
  }
  return result;
}



Future<ProductResponceList> getProductResponceList(context) async {
  ProductResponceList result=ProductResponceList();
  try {
    final response = await http.get(
      Uri.parse("http://139.59.53.68:3001/api/admin/getAllProducts"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = ProductResponceList.fromJson(item);
    } else {
    }
  } catch (e) {
  }
  return result;
}

