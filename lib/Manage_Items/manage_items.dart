import 'package:bigg_bite_manager/Manage_Category/ManageCategoryEdit.dart';
import 'package:bigg_bite_manager/Models/productList/product_responce_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../LifecycleEventHandler.dart';
import '../common_response_model.dart';
import 'manage_items_details.dart';

class ManageItems extends StatefulWidget {
  @override
  _ManageItemsState createState() => _ManageItemsState();
}

class _ManageItemsState extends State<ManageItems> {
  late Future<ProductResponceList> futureproductlist;

  @override
  void initState() {
    futureproductlist = getProductResponceList(context);

    // WidgetsBinding.instance!.addObserver(LifecycleEventHandler(
    //     resumeCallBack: () async => setState(() {
    //           futureproductlist = getProductResponceList(context);
    //         }),
    //     suspendingCallBack: () async => {}));
    super.initState();
  }

  Future<void> _getData() async {
    setState(() {
      futureproductlist = getProductResponceList(context);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () => _getData(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageItemsDetails(Data()),
                    ),
                  );
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
                      'Create New Dish',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder<ProductResponceList>(
                future: futureproductlist,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageItemsDetails(
                                      snapshot.data!.data![index]),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            width: 100,
                                            height: 100,
                                            imageUrl:
                                                '${BASE_URL_IMAGE}${snapshot.data!.data![index].photo}',
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  snapshot.data!.data![index]
                                                          .productName ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {
                                        showAlertDialog(
                                            context,
                                            snapshot.data!.data![index].id
                                                .toString());
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    ));
  }

  showAlertDialog(BuildContext context, String id) {
    // set up the buttons
    bool validate = true;
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Delete"),
      onPressed: () async {
        if (validate) {
          validate = false;
          CommonResponseModel result = await deleteProduct(context, id);
          if (result.error ?? true) {
            Navigator.pop(context);
          } else {
            setState(() {
              futureproductlist = getProductResponceList(context);
            });
            Navigator.pop(context);
          }
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Would you like delete dish?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
