import 'package:bigg_bite_manager/Manage_Category/ManageCategoryEdit.dart';
import 'package:bigg_bite_manager/Models/banner_model/banner_response_model.dart';
import 'package:bigg_bite_manager/Models/categoryList/category_response_list.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:bigg_bite_manager/banners/BannerEdit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common_response_model.dart';

class BannerListScreen extends StatefulWidget {
  const BannerListScreen({Key? key}) : super(key: key);

  @override
  _BannerListScreenState createState() => _BannerListScreenState();
}

class _BannerListScreenState extends State<BannerListScreen> {
  late Future<BannerResponseModel> futureBannerList;

  @override
  void initState() {
    futureBannerList = getBannerList(context);
    super.initState();
  }

  Future<void> _getData() async {
    setState(() {
      futureBannerList = getBannerList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _getData(),
        child: FutureBuilder<BannerResponseModel>(
            future: futureBannerList,
            initialData: BannerResponseModel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error == null) {
                  return Container();
                }
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
                                    BannerEditScreen('', 0, 0),
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            height: 60,
                            child: Center(
                              child: Text(
                                'Create New Banner',
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
                                    builder: (context) => BannerEditScreen(
                                        snapshot.data!.data![index].bannerUrl ??
                                            '',
                                        snapshot.data!.data![index]
                                                .categoryId ??
                                            0,
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
                                              height: 150,
                                              imageUrl:
                                                  '${BASE_URL_IMAGE}${snapshot.data!.data![index].bannerUrl}',
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
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
              } else {
                return Container();
              }
            }),
      ),
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
          CommonResponseModel result = await deleteBanner(context, id);
          if (result.error ?? true) {
            Navigator.pop(context);
          } else {
            setState(() {
              futureBannerList = getBannerList(context);
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
