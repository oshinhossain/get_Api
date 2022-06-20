import 'package:flutter/material.dart';
class Home_Screen1 extends StatefulWidget {
  const Home_Screen1({Key? key}) : super(key: key);

  @override
  _Home_Screen1State createState() => _Home_Screen1State();
}

class _Home_Screen1State extends State<Home_Screen1> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE37D4E),
        toolbarHeight: 80.2,
        title: Center(
          child: Text("Order Details",
            style: TextStyle(color: Colors.white),),
        ),
        leading:IconButton(
          onPressed: (){
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ) ,
      ),
      body:SingleChildScrollView(
      child:  Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 30, 15, 30),
                // height: MediaQuery.of(context).size.height * .6,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0XFFF8EBD0),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'Your Order is on its way',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Image.asset('assets/Rectangle 237.webp'),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Select Delivery Slot',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(""),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 3,
                            //minimumSize: Size(100, 40),
                          ),
                          onPressed: () async {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                          },
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pay with",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.money,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    "Cash On Delivery",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    ": ৳ 300.0",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.only(left: 60, right: 60),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20), // <-- Radius
                            ),
                            primary: Colors.amber,
                            minimumSize: Size(100, 40),
                          ),
                          onPressed: () async {
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Track Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Go to Homepage',
                        style: TextStyle(
                            fontSize: 18, color: Color(0xffE37D4E)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order Number"),
                      Text("400"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Invoice Number"),
                      Text('554645654654'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Order total (Incl.VAT"),
                      Text("")],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Change"),
                      Text("50.00")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Grand Total"),
                      Text(
                          "2325")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Address",
                            overflow: TextOverflow.ellipsis,
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "jhhgcf gfghcfg ghggh",
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
