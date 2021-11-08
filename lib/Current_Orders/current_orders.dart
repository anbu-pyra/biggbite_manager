import 'package:bigg_bite_manager/api/api.dart';
import 'package:bigg_bite_manager/common_response_model.dart';
import 'package:bigg_bite_manager/myorders_model/data.dart';
import 'package:flutter/material.dart';

class CurrentOrders extends StatefulWidget {
  CurrentOrders(this.data);
  Data data;
  @override
  _CurrentOrdersState createState() => _CurrentOrdersState(data);
}

class _CurrentOrdersState extends State<CurrentOrders> {
  _CurrentOrdersState(this.data);
  Data data;
  String dropdownValue = 'created';

  @override
  void initState() {
    dropdownValue = data.status ?? 'created';
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Order List')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Order Id: ${widget.data.orderReferenceId}',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Name: ${widget.data.mobileNumber}',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Mobile No: ${widget.data.mobileNumber}',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Door No',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Total: ${widget.data.totalPrice}',
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
                  items: <String>['created', 'accepted', 'shipped', 'delivered']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
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
            Column(
              children: widget.data.items!
                  .map((e) => Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(e.product_name.toString()),
                              Text(' x '),
                              Text(e.quantity.toString()),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () async {
                  CommonResponseModel result = await updateOrderStatus(
                      context,
                      dropdownValue,
                      data.id.toString(),
                      data.orderReferenceId ?? '',
                      data.fcmToken ?? '');
                  if (result.error ?? true) {
                  } else {
                    Navigator.pop(context);
                  }
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
                      'Update Status',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
