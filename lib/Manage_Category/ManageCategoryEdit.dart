import 'package:flutter/material.dart';

class ManageCategoryEdit extends StatefulWidget {
  @override
  _ManageCategoryEditState createState() => _ManageCategoryEditState();
}

class _ManageCategoryEditState extends State<ManageCategoryEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Category Edit')),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: TextField (
              decoration: InputDecoration(
                label: Text('Edit Category Name'),
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
                        'Edit Category',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {},
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
}
