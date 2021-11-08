import 'package:flutter/material.dart';

import 'Current_Orders/current_order_list.dart';
import 'Current_Orders/current_orders.dart';
import 'Manage_Category/ManageCategoryEdit.dart';
import 'Manage_Category/manage_category.dart';
import 'Manage_Items/manage_items.dart';

import 'Manage_Items/manage_items_details.dart';
import 'side_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
//(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      //home: MyHomePage(title: appTitle),
      //home: SideNavScreen(),
      //  home: ManageCategory(),
      home: SideNavScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            )
          ],
        ));
  }
}
