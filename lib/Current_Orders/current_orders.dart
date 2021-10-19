import 'package:flutter/material.dart';

class CurrentOrders extends StatefulWidget {
  @override
  _CurrentOrdersState createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Order List')),

      body: SingleChildScrollView(
        child: Column(

          children:<Widget> [

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Order Id',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),

              child: TextField (
                decoration: InputDecoration(
                  label: Text('Enter Order Id'),
                  hintText: 'Type Text Here...',

                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Name',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),

              alignment: Alignment.center,
              child: TextField (
                decoration: InputDecoration(
                  label: Text('Enter Name'),
                  hintText: 'Type Text Here...',

                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Mobile No',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),

              alignment: Alignment.center,
              child: TextField (
                decoration: InputDecoration(
                  label: Text('Edit Item Name'),
                  hintText: 'Type Text Here...',

                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Address',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),

              child: TextField (
                decoration: InputDecoration(
                  label: Text('Address Details'),
                  hintText: 'Type Text Here...',

                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Status',
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
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Ordered Items',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
            ),


            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Oil'),

                  onTap: () {
                    Navigator.pop(context);
                  },

                ),
                ListTile(
                  title: Text('Iphone 12'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Watch'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cap'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Bike Cover'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
