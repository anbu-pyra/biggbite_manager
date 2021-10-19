import 'package:bigg_bite_manager/Models/productList/product_responce_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:flutter/material.dart';

import 'manage_items_details.dart';

class ManageItems extends StatefulWidget {
  @override
  _ManageItemsState createState() => _ManageItemsState();
}

class _ManageItemsState extends State<ManageItems> {
  late Future<ProductResponceList> futureproductlist;

  @override
  void initState() {
    futureproductlist=getProductResponceList(context);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<ProductResponceList>(future:futureproductlist,builder: (context,snapshot){
        if (snapshot.hasData){
          return ListView.builder(itemCount:snapshot.data!.data!.length,itemBuilder: (context,index){
            return  ListTile(
              title: Text(snapshot.data!.data![index].productName??''),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageItemsDetails(),
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


//      ListView(
//        children: <Widget>[
//          ListTile(
//            title: Text('IPhone'),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ManageItemsDetails(),
//                ),
//              );
//            },
//          ),
//          ListTile(
//            title: Text('Samsung'),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ManageItemsDetails(),
//                ),
//              );
//            },
//          ),
//          ListTile(
//            title: Text('Vivo'),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ManageItemsDetails(),
//                ),
//              );
//            },
//          ),
//          ListTile(
//            title: Text('OPPO'),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ManageItemsDetails(),
//                ),
//              );
//            },
//          ),
//          ListTile(
//            title: Text('OnePlus'),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ManageItemsDetails(),
//                ),
//              );
//            },
//          ),
//        ],
//      ),
    );
  }
}
