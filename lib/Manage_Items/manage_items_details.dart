import 'dart:io';

import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/Models/productList/product_responce_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

import '../common_response_model.dart';
import '../web_utils.dart';

class ManageItemsDetails extends StatefulWidget {
  ManageItemsDetails(this.data);

  Data data;
  @override
  _ManageItemsDetailsState createState() => _ManageItemsDetailsState();
}

class _ManageItemsDetailsState extends State<ManageItemsDetails> {
  TextEditingController ItemController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();
  TextEditingController DiscountController = TextEditingController();
  TextEditingController SlashedPriceController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController MaximumQuantityController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController OfferPriceController = TextEditingController();
  CategoryResponseList categoryResponseList = CategoryResponseList();
  int selectedCategoryId = 1;
  void initState() {
    if (widget.data.productName != null) {
      ItemController.text = widget.data.productName! ?? '';
      SlashedPriceController.text = widget.data.slashedPrice.toString();
      PriceController.text = widget.data.price.toString();
      MaximumQuantityController.text = widget.data.maxQuantity.toString();
      selectedCategoryId = widget.data.categoryId ?? 1;
      DescriptionController.text = widget.data.description ?? '';
      DiscountController.text = widget.data.offer_percentage.toString();
      vegOrNonVeg = widget.data.isVeg.toString() ?? '1';
      status = widget.data.status.toString() == '1' ? true : false;
    }
    getCategoryList();
    setState(() {});
    super.initState();
  }

  String dropdownValue = 'Grocery';
  String vegOrNonVeg = '1';
  bool status = false;

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
    } else if (widget.data.photo != '') {
      return CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: widget.data.photo ?? '',
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
      appBar: AppBar(title: Text('Manage Item Details')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                'Item Name',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: ItemController,
                decoration: InputDecoration(
                    // label: Text('Edit Item Name'),
                    // hintText: 'Type Text Here...',
                    ),
              ),
            ), //Item Name //Text Field
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
                : Container(), //Category name// Dropdown
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Available',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: FlutterSwitch(
                width: 125.0,
                height: 40.0,
                valueFontSize: 25.0,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ), //Available//ON OFF
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Veg/Non Veg',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  contentPadding: EdgeInsets.all(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: vegOrNonVeg,
                    isDense: true,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(child: Text("Veg"), value: "1"),
                      DropdownMenuItem(child: Text("Non-Veg"), value: "0"),
                    ],
                    onChanged: (newValue) {
                      vegOrNonVeg = newValue!;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Description',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: DescriptionController,
                decoration: InputDecoration(
                  label: Text('Description'),
                  hintText: 'Enter the description',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Discount',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: DiscountController,
                decoration: InputDecoration(
                  label: Text('Discount Value'),
                  hintText: 'Enter the Discount value',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Maximum Quantity',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: MaximumQuantityController,
                decoration: InputDecoration(
                  label: Text('Maximum Quantity'),
                  hintText: 'Enter the Max Quantity',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Slashed Price',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: SlashedPriceController,
                decoration: InputDecoration(
                  label: Text('Slashed Value'),
                  hintText: 'Enter the Slashed Price',
                ),
              ),
            ), //Slashed Price//Text Field
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Price',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: PriceController,
                decoration: InputDecoration(
                  label: Text('Final Amount'),
                  hintText: 'Total Amount',
                ),
              ),
            ), //Price//Text Field
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () async {
                  if (widget.data.id != null) {
                    editItem();
                  } else {
                    addItem();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getCategoryList() async {
    categoryResponseList = await getCategoryListApi(context);
    setState(() {});
  }

  Future<void> editItem() async {
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
      imageurl = widget.data.photo ?? '';
    }
    CommonResponseModel result = await editDish(
        context,
        selectedCategoryId.toString(),
        ItemController.text,
        MaximumQuantityController.text,
        DescriptionController.text,
        SlashedPriceController.text,
        DiscountController.text,
        imageurl,
        vegOrNonVeg,
        status ? '1' : '0',
        PriceController.text,
        widget.data.id.toString());

    if (result.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> addItem() async {
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
    CommonResponseModel result = await addNewDish(
        context,
        selectedCategoryId.toString(),
        ItemController.text,
        MaximumQuantityController.text,
        DescriptionController.text,
        SlashedPriceController.text,
        DiscountController.text,
        imageurl,
        vegOrNonVeg,
        status ? '1' : '0',
        PriceController.text,
        '0');

    if (result.error ?? true) {
    } else {
      Navigator.pop(context);
    }
  }
}
