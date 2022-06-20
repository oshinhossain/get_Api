
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/category/model/sub_category_model.dart';
import 'package:http/http.dart' as http;

import 'package:shimmer_animation/shimmer_animation.dart';


class ScreenSubCategory extends StatefulWidget {
  String categoryId;
  String categorySlugName;
  ScreenSubCategory(
      {Key? key, required this.categoryId, required this.categorySlugName})
      : super(key: key);

  @override
  _ScreenSubCategoryState createState() => _ScreenSubCategoryState();
}

class _ScreenSubCategoryState extends State<ScreenSubCategory> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  // String baseUrl = "https://bppshops.com/api/bs/";
  List<Getsubcategory>? subCategoryList;
 // List<ProductUnderSubCategory>? productUnderSubCategoryList;
 // List<Getsubsubcategory>? getsubsubcategoryList;
 // SubSubCategory? subSubCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final list = await getSubCategory(widget.categoryId);
    setState(() {
      subCategoryList = list;
    });
  }


  Future<List<Getsubcategory>?> getSubCategory(String id) async {
    final response = await http.get(Uri.parse('https://bppshops.com/api/bs/${id}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(response.body);
      SubCategory subCategory = SubCategory.fromJson(json);
     subCategoryList= subCategory.getsubcategory;
      return subCategory.getsubcategory;
    } else {
      throw Exception(
          'Failed to load >>>>Status Code>>> :${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFE37D4E),
        leading: IconButton(
          onPressed: (){
            _scafoldKey.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: TextButton(
          onPressed: (){

            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),)),
            //         (route) => false);

            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),));
          },
          child: Text(
            "BPP Shops",
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),
        actions: [
          SizedBox(
            width: 15,
          )
        ],
      ),
     // drawer: BPPMainPageDrawer(),
      body: Scaffold(
        // backgroundColor: Colors.white70,
          body: subCategoryList != null
              ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              childAspectRatio: 2 / 3,
            ),
            itemCount: subCategoryList!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async{
                //   //await getList(widget.categoryId,subCategoryList![index].id.toString());
                //   print(widget.categoryId.toString()+subCategoryList![index].id.toString());
                // // await getSubSubCategory(widget.categoryId,subCategoryList![index].id.toString(),context,subCategoryList![index].subCategoryName.toString());
                //   getsubsubcategoryList!=null?Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => ScreenSubSubCategory(
                //         subCategorySlugName:
                //             subCategoryList![index].subCategoryName.toString(),
                //         getsubsubcategoryList:
                //             getsubsubcategoryList,
                //         //subCategoryID: subCateGoryId,
                //       ),
                //     ),
                //   ):Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => ScreenSubSubCategory(
                //         subCategorySlugName:
                //         subCategoryList![index].subCategoryName.toString(),
                //         getsubsubcategoryList:
                //         getsubsubcategoryList,
                //         //subCategoryID: subCateGoryId,
                //       ),
                //     ),
                //   );
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://bppshops.com/" +
                                  subCategoryList![index]
                                      .subcategoryImage
                                      .toString(),
                            ),
                          )),
                      //child: ,
                    ),
                    Text("${subCategoryList![index].subCategoryName}"),
                  ],
                ),
              );
            },
          )
              : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer(
                  duration: Duration(seconds: 2), //Default value
                  interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
                  color: Colors.black,//Colors.grey.shade700, //Default value
                  colorOpacity: 0, //Default value
                  enabled: true, //Default value
                  direction: ShimmerDirection.fromLTRB(),
                  child: Container(
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: 10, vertical: 10),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                );
              }),
          // floatingActionButton: Consumer<Cart>(
          //   builder: (_, cart, ch) => Badge(
          //     value: cart.itemCount.toString(),
          //     child: ch,
          //   ),
          //   child: FloatingActionButton(
          //     backgroundColor: Theme.of(context).colorScheme.primary,
          //     onPressed: () {
          //     //   Navigator.of(context).push(
          //     //       MaterialPageRoute(builder: (context) => CartScreen()));
          //      },
          //     child: Icon(
          //       Icons.shopping_bag_sharp,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // currentScreen =
                            //     Home_Page(); // if user taps on this dashboard tab will be active
                            // currentTab = 0;
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNavBar(
                            //           currentTab: 0,
                            //           currentScreen: HomeScreen(),
                            //         )),
                            //         (route) => false);
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors
                                  .amber, //currentTab == 0 ? Colors.amber,//: Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors
                                    .amber, //currentTab == 0 ? Colors.amber : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNavBar(
                            //           currentTab: 1,
                            //           currentScreen: MyWishList(),
                            //         )),
                            //         (route) => false);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)));
                            // currentScreen =
                            //     MyWishList(); // if user taps on this dashboard tab will be active
                            // currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border_outlined,
                              color: Colors
                                  .grey, //currentTab == 1 ? Colors.amber : Colors.grey,
                            ),
                            Text(
                              'Favorite',
                              style: TextStyle(
                                color: Colors
                                    .grey, //,currentTab == 1 ? Colors.amber: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // Right Tab bar icons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNavBar(
                            //           currentTab: 2,
                            //           currentScreen: HistoryScreen(),
                            //         )),
                            //         (route) => false);
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
                            // currentScreen =
                            //     HistoryTabbar(); // if user taps on this dashboard tab will be active
                            // currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.dashboard_outlined,
                              color: Colors
                                  .grey, //currentTab == 2 ? Colors.amber: Colors.grey,
                            ),
                            Text(
                              'History',
                              style: TextStyle(
                                color: Colors
                                    .grey, //,currentTab == 2 ? Colors.amber : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNavBar(
                            //           currentTab: 3,
                            //           currentScreen: ProfileScreen(),
                            //         )),
                            //         (route) => false);
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
                            // currentScreen =
                            //     ProfileScreen(); // if user taps on this dashboard tab will be active
                            // currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors
                                  .grey, //currentTab == 3 ? Colors.amber : Colors.grey,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors
                                    .grey, //currentTab == 3 ? Colors.amber: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
