

import 'package:flutter/material.dart';
import 'package:get_api/category/category_offer.dart';

class Home_Page extends StatefulWidget{
  Home_Page({
    Key? key,
  }) : super(key: key);
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {


  GlobalKey<ScaffoldState> _islamicScafoldKey = GlobalKey();
  GlobalKey<ScaffoldState> _bppscafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_bppscafoldKey,
      appBar: AppBar(

      ),
      body: Scaffold(
          key: _islamicScafoldKey ,
          backgroundColor: Color(0xFFEEEEEE),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.amber,
            centerTitle: true,
            title: Text(
              'Islamic',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              onPressed: () {
                _islamicScafoldKey .currentState!.openDrawer();
                //Drawer(child: MyDrawer());
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                          //   showSearch(
                          //       context: context, delegate: SearchList());
                           },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                 // HomeMainSlider(),
                //  Home_Banner(),
                  SizedBox(
                    height: 10,
                  ),
                  Category_offer(),
                  //  ImageSlideShowCustom(),
                  // PopularProductHome("neverScroll"),
                  // DailyBestSellWidget(),
                  // LatestDiscount(),
                  // TrandingProductWidget('topselling'),
                  // TrandingProductWidget('TrendingProduct'),
                  // RecentlyAddedWidget(),
                  // TrandingProductWidget('TopRated'),
                  // TopRatedProduct(),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ),

          ),
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
                            //
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
                            //           currentScreen:MyWishList(),
                            //         )),
                            //         (route) => false);

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
          ),
          );

  }
}
