import 'package:bigg_bite_manager/Current_Orders/current_order_list.dart';
import 'package:bigg_bite_manager/ReportScreen.dart';
import 'package:bigg_bite_manager/banners/banner_list.dart';
import 'package:bigg_bite_manager/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Current_Orders/current_orders.dart';
import 'Current_Orders/manage_orders.dart';
import 'Manage_Category/ManageCategoryEdit.dart';
import 'Manage_Category/manage_category.dart';
import 'Manage_Items/manage_items.dart';

class SideNavScreen extends StatefulWidget {
  const SideNavScreen({Key? key}) : super(key: key);

  @override
  _SideNavScreenState createState() => _SideNavScreenState();
}

class _SideNavScreenState extends State<SideNavScreen> {
  Widget selecteditem = Text("dashboard");
  String selectedString = "dashboard";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manager')),
      body: Container(child: selecteditem),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
            ),
            ListTile(
              tileColor:
                  selectedString == "dashboard" ? Colors.grey : Colors.white,
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedString = "dashboard";
                  selecteditem = DashboardScreen();
                });
              },
            ),
            ListTile(
              tileColor:
                  selectedString == "banner" ? Colors.grey : Colors.white,
              title: const Text('Banner'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedString = "banner";
                  selecteditem = BannerListScreen();
                });
              },
            ),
            ListTile(
              tileColor:
                  selectedString == "category" ? Colors.grey : Colors.white,
              title: const Text('Manage Category'),
              onTap: () async {
                Navigator.pop(context);

                setState(() {
                  selectedString = "category";
                  selecteditem = ManageCategory();
                });
              },
            ),
            ListTile(
              tileColor: selectedString == "items" ? Colors.grey : Colors.white,
              title: const Text('Manage Items'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedString = "items";
                  selecteditem = ManageItems();
                });
              },
            ),
            ListTile(
              title: const Text('Manage Orders'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageOrdersScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Reports'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selecteditem = ReportScreen();
                });
              },
            ),
            // ListTile(
            //   title: const Text('Past Orders'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ManageCategoryEdit("", 0),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   title: const Text('Revenus'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Users'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
