import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:bigg_bite_manager/common_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../LifecycleEventHandler.dart';
import 'ManageCategoryEdit.dart';

class ManageCategory extends StatefulWidget {
  @override
  _ManageCategoryState createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory>
    with WidgetsBindingObserver {
  late Future<CategoryResponseList> futurecategorylist;
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    futurecategorylist = getCategoryResponceList(context);
    // WidgetsBinding.instance!.addObserver(LifecycleEventHandler(
    //     resumeCallBack: () async => setState(() {
    //           futurecategorylist = getCategoryResponceList(context);
    //         }),
    //     suspendingCallBack: () async => {}));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        futurecategorylist = getCategoryResponceList(context);
      });
    }
  }

  Future<void> _getData() async {
    setState(() {
      futurecategorylist = getCategoryResponceList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () => _getData(),
      child: FutureBuilder<CategoryResponseList>(
          future: futurecategorylist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ManageCategoryEdit('', '', 0),
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              'Create New Category',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageCategoryEdit(
                                      snapshot.data!.data![index]
                                              .categoryName ??
                                          '',
                                      snapshot.data!.data![index]
                                              .categoryImage ??
                                          '',
                                      snapshot.data!.data![index].id ?? 0),
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
                                                '${BASE_URL_IMAGE}${snapshot.data!.data![index].categoryImage}',
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
                                                          .categoryName ??
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
                        }),
                  ],
                ),
              );
              return Container();
            } else {
              return Container();
            }
          }),
    )
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
          CommonResponseModel result = await deleteCategory(context, id);
          if (result.error ?? true) {
            Navigator.pop(context);
          } else {
            setState(() {
              futurecategorylist = getCategoryResponceList(context);
            });
            Navigator.pop(context);
          }
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Would you like delete category?"),
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
