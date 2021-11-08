import 'package:bigg_bite_manager/Current_Orders/current_orders.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:bigg_bite_manager/myorders_model/my_order_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentOrderList extends StatefulWidget {
  CurrentOrderList(this.status);
  String status;
  @override
  _CurrentOrderListState createState() => _CurrentOrderListState();
}

class _CurrentOrderListState extends State<CurrentOrderList> {
  late Future<MyOrderResponseModel> futureOrdersList;

  @override
  void initState() {
    futureOrdersList = getOrderList(context, widget.status);
    super.initState();
  }

  Future<void> _getData() async {
    futureOrdersList = getOrderList(context, widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _getData(),
        child: FutureBuilder<MyOrderResponseModel>(
            future: futureOrdersList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CurrentOrders(snapshot.data!.data![index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.data![index]
                                              .orderReferenceId ??
                                          '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      snapshot.data!.data![index].mobileNumber
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          '\u{20B9}${snapshot.data!.data![index].totalPrice.toString()}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Text(
                                          convertUtcToLocal(snapshot
                                              .data!.data![index].createdAt
                                              .toString()),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  String convertUtcToLocal(String uTCTime) {
    var dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"); //
    var outputDateFormat = DateFormat("dd-MM-yyyy hh:mm aa"); //
    var utcDate =
        dateFormat.format(DateTime.parse(uTCTime)); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    String createdDate = outputDateFormat
        .format(DateTime.parse(localDate)); // you will local time
    return createdDate;
  }
}
