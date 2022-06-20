import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/get_api_model.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<PostsModels> postList =[];


  Future<List<PostsModels>>getPostApi ()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
var data =jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(response.body);
      for(Map i in data){
        postList.add(PostsModels.fromJson(i as dynamic));
      }
      return postList;

}else{
      return postList;

}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text(postList[index].title.toString()),
                                SizedBox(height: 5,),
                                Text('Description' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text('Description\n'+postList[index].body.toString() , style: Theme.of(context).textTheme.bodyText1)
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}