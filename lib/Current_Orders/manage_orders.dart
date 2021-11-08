import 'package:bigg_bite_manager/Current_Orders/current_order_list.dart';
import 'package:bigg_bite_manager/Current_Orders/current_orders.dart';
import 'package:flutter/material.dart';

class ManageOrdersScreen extends StatefulWidget {
  const ManageOrdersScreen({Key? key}) : super(key: key);

  @override
  _ManageOrdersScreenState createState() => _ManageOrdersScreenState();
}

class _ManageOrdersScreenState extends State<ManageOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'New Order'),
                Tab(text: 'Ongoing Order'),
                Tab(text: 'Out For Delivery'),
                Tab(text: 'Past Order'),
                Tab(text: 'Cancelled Order'),
              ],
            ),
            title: const Text('Manage Orders'),
          ),
          body: TabBarView(
            children: [
              CurrentOrderList('created'),
              CurrentOrderList('accepted'),
              CurrentOrderList('shipped'),
              CurrentOrderList('delivered'),
              CurrentOrderList('cancelled'),
            ],
          ),
        ),
      ),
    );
  }
}
