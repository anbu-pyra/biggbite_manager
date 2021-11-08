import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'common_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

uploadImageWeb(String filepath, XFile? imageFile) async {
  CommonResponseModel result = CommonResponseModel();

  var request = http.MultipartRequest(
      'POST', Uri.parse('http://biggbitecafe.in/api/admin/uploadImage'));
  PickedFile imageFiles = PickedFile(filepath);
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFiles.openRead()));

  // final MultipartFile file = MultipartFile.fromBytes(imageFiles.readAsBytes(), filename: "picture");

  var length = await imageFile!.length();
  var multipartFile = new http.MultipartFile('uploadFile', stream, length,
      filename: filepath.split("/").last);

  request.files.add(multipartFile);

  var res = await request.send();
  if (res.statusCode == 200) {
    final respStr = await res.stream.bytesToString();

    final item = json.decode(respStr);
    result = CommonResponseModel.fromJson(item);
  }
  print(res);
  return result;
}
