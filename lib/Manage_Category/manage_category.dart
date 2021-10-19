import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:flutter/material.dart';

import 'ManageCategoryEdit.dart';

class ManageCategory extends StatefulWidget {
  @override
  _ManageCategoryState createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  late Future<CategoryResponseList> futurecategorylist;
  @override
  void initState() {
    futurecategorylist=getCategoryResponceList(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: FutureBuilder<CategoryResponseList>(future:futurecategorylist,builder: (context,snapshot){
          if (snapshot.hasData){
            return ListView.builder(itemCount:snapshot.data!.data!.length,itemBuilder: (context,index){
              return  ListTile(
              title: Text(snapshot.data!.data![index].categoryName??''),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageCategoryEdit(),
                  ),
                );
              },

            );
            });
            return Container();
          }
          else{
            return Container();
          }
        })
//        ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text('Grocery'),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategoryEdit(),
//                  ),
//                );
//              },
//
//            ),
//            ListTile(
//              title: Text('Mobiles'),
//              onTap: () {
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategoryEdit(),
//                  ),
//                );              },
//            ),
//            ListTile(
//              title: Text('Fashion'),
//              onTap: () {
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategoryEdit(),
//                  ),
//                );              },
//            ),
//            ListTile(
//              title: Text('Electronics'),
//              onTap: () {
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategoryEdit(),
//                  ),
//                );              },
//            ),
//            ListTile(
//              title: Text('Recharge'),
//              onTap: () {
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ManageCategoryEdit(),
//                  ),
//                );              },
//            ),
//          ],
//        ),
      );
  }
}
