import 'package:flutter/material.dart';

import 'Current_Orders/current_orders.dart';
import 'Manage_Category/ManageCategoryEdit.dart';
import 'Manage_Category/manage_category.dart';
import 'Manage_Items/manage_items.dart';

class SideNavScreen extends StatefulWidget {
  const SideNavScreen({Key? key}) : super(key: key);

  @override
  _SideNavScreenState createState() => _SideNavScreenState();

}

class _SideNavScreenState extends State<SideNavScreen> {
  Widget  selecteditem=Text("dashboard");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manager')),
      body: Container(
        child:
          selecteditem

      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Manage Category'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selecteditem=ManageCategory();
                });
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategory(),
//                  ),
//                );
                },
            ),
            ListTile(
              title: const Text('Manage Items'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selecteditem=ManageItems();
                });
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageItems(),
//                  ),
//                );

              },
            ),
            ListTile(
              title: const Text('Current Orders'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selecteditem=CurrentOrders();
                });
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => CurrentOrders(),
//                  ),
//                );
                },
            ),
            ListTile(
              title: const Text('Past Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageCategoryEdit(),
                  ),
                );              },
            ),
            ListTile(
              title: const Text('Revenus'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Users'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
