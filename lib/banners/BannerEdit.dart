import 'dart:io';

import 'package:bigg_bite_manager/Models/categoryList/category_edit.dart';
import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker_web/image_picker_web.dart';

import '../common_response_model.dart';
import '../web_utils.dart';

class BannerEditScreen extends StatefulWidget {
  BannerEditScreen(this.BannerUrl, this.CategoryId, this.id);
  String BannerUrl;
  int CategoryId;
  int id;
  @override
  _BannerEditScreenState createState() => _BannerEditScreenState();
}

class _BannerEditScreenState extends State<BannerEditScreen> {
  TextEditingController categoryController = TextEditingController();
  CategoryResponseList categoryResponseList = CategoryResponseList();
  int selectedCategoryId = 1;

  @override
  void initState() {
    selectedCategoryId = widget.CategoryId;
    getCategoryList();
    setState(() {});
    super.initState();
  }

  Future<void> getCategoryList() async {
    categoryResponseList = await getCategoryListApi(context);

    if (widget.id == 0 && categoryResponseList.data != null) {
      selectedCategoryId = categoryResponseList.data![0].id;
    }
    setState(() {});
  }

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = pickedFile;
        } else {
          print("No image selected");
        }
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  Widget _previewImage() {
    if (_imageFile != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            kIsWeb
                ? Image.network(
                    _imageFile!.path,
                    height: 100,
                    width: 100,
                  )
                : Image.file(
                    File(_imageFile!.path),
                    height: 100,
                    width: 100,
                  ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    } else if (widget.BannerUrl != '') {
      return CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: '${BASE_URL_IMAGE}${widget.BannerUrl}',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retriveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      print('Retrieve error ' + response.exception!.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.id != 0 ? 'Edit Banner' : 'Add Banner')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder<void>(
              future: retriveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Text('Picked an image');
                  case ConnectionState.done:
                    return _previewImage();
                  default:
                    return const Text('Picked an image');
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                _pickImage();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                height: 60,
                child: Center(
                  child: Text(
                    'Pick Image',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Category',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
          ),
          categoryResponseList.data != null
              ? Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: DropdownButton<int>(
                    value: selectedCategoryId,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedCategoryId = newValue ?? 0;
                      });
                    },
                    items: categoryResponseList.data!
                        .map((e) => DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.categoryName ?? ''),
                            ))
                        .toList(),
                  ),
                )
              : Container(),
          Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    child: Text(
                      widget.id != 0 ? 'Edit Banner' : 'Add Banner',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (widget.id != 0) {
                        editBanner();
                      } else {
                        addNewBanner();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> addNewBanner() async {
    String imageurl = '';
    if (_imageFile != null) {
      CommonResponseModel res = CommonResponseModel();
      if (kIsWeb) {
        res = await uploadImageWeb(_imageFile!.path, _imageFile!);
      } else {
        res = await uploadImage(_imageFile!.path, _imageFile!);
      }
      imageurl = res.message ?? '';
      print(res.message);
    }
    CommonResponseModel response =
        await createNewBanner(context, imageurl, selectedCategoryId.toString());
    if (response.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> editBanner() async {
    String imageurl = '';
    if (_imageFile != null) {
      CommonResponseModel res = CommonResponseModel();
      if (kIsWeb) {
        res = await uploadImageWeb(_imageFile!.path, _imageFile!);
      } else {
        res = await uploadImage(_imageFile!.path, _imageFile!);
      }
      imageurl = res.message ?? '';
      print(res.message);
    } else {
      imageurl = widget.BannerUrl;
    }
    CommonResponseModel response = await editBannerApi(
        context, widget.id.toString(), imageurl, selectedCategoryId.toString());
    if (response.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }
}
