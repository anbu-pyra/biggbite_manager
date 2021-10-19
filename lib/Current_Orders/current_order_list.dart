import 'package:flutter/material.dart';

class CurrentOrderList extends StatefulWidget {
  @override
  _CurrentOrderListState createState() => _CurrentOrderListState();
}

class _CurrentOrderListState extends State<CurrentOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: TextField (
                  decoration: InputDecoration(
                    label: Text('Order Id'),
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
                            'Save',
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
