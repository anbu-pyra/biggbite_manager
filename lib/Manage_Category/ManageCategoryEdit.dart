import 'dart:io';

import 'package:bigg_bite_manager/Models/categoryList/category_edit.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../common_response_model.dart';
import '../web_utils.dart';

class ManageCategoryEdit extends StatefulWidget {
  ManageCategoryEdit(this.Categoryname, this.CategoryImage, this.id);
  String Categoryname;
  String CategoryImage;
  int id;
  @override
  _ManageCategoryEditState createState() => _ManageCategoryEditState();
}

class _ManageCategoryEditState extends State<ManageCategoryEdit> {
  TextEditingController categoryController = TextEditingController();
  @override
  void initState() {
    categoryController.text = widget.Categoryname;
    setState(() {});
    super.initState();
  }

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
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
    } else if (widget.CategoryImage != '') {
      return CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: widget.CategoryImage,
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
      appBar: AppBar(
          title: Text(widget.id != 0 ? 'Edit Category' : 'Add Category')),
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
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: TextField(
              controller: categoryController,
              decoration: InputDecoration(
                label: Text('Category Name'),
                hintText: 'Type Text Here...',
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child: Builder(builder: (context) {
                  return Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      child: Text(
                        widget.id != 0 ? 'Edit Category' : 'Add Category',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () async {
                        if (widget.id != 0) {
                          editCategory();
                        } else {
                          addNewCategory();
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> addNewCategory() async {
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
        await createNewCategory(context, categoryController.text, imageurl);
    if (response.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> editCategory() async {
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
      imageurl = widget.CategoryImage;
    }
    CommonResponseModel response = await getCategoryEditList(
        context, categoryController.text, widget.id, imageurl);
    if (response.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }
}
