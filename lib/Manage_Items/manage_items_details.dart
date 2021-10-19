import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class ManageItemsDetails extends StatefulWidget {
  @override
  _ManageItemsDetailsState createState() => _ManageItemsDetailsState();
}

class _ManageItemsDetailsState extends State<ManageItemsDetails> {
  String dropdownValue = 'Grocery';
  String dropdownValue1='Veg';
  bool status=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Item Details')),

      body: SingleChildScrollView(
        child: Column(

          children:<Widget> [

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

              child: TextField (
                decoration: InputDecoration(
                  label: Text('Edit Item Name'),
                  hintText: 'Type Text Here...',

                ),
              ),
            ),//Item Name //Text Field
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
            Container(
                padding: EdgeInsets.all(10),

                alignment: Alignment.topLeft,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,

                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Grocery', 'Mobiles', 'Fashion', 'Electronics']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ),//Category name// Dropdown
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
            ),//Available//ON OFF
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
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),

                child: DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });
                  },
                  items: <String>['Veg', 'Non-Veg']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
            ),//VEg Non Veg//Drop down
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

              child: TextField (
                decoration: InputDecoration(
                  label: Text('Discount Value'),
                  hintText: 'Enter the Discount value',

                ),
              ),
            ),//Discound//Text Field
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

              child: TextField (
                decoration: InputDecoration(

                  label: Text('Slashed Value'),
                  hintText: 'Enter the Slashed Price',

                ),
              ),
            ),//Slashed Price//Text Field
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

              child: TextField (
                decoration: InputDecoration(
                  label: Text('Final Amount'),
                  hintText: 'Total Amount',

                ),
              ),
            ),//Price//Text Field
        Container(
          margin: EdgeInsets.all(25),
          child: FlatButton(
            child: Text(
              'Save',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),



          ],
        ),
      ),
    );
  }
}
