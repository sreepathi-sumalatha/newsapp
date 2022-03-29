import 'package:flutter/material.dart';
// import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/news_model_data.dart';
import 'package:get/get.dart';
import 'package:news_app/news_module/controllers/newscontroller.dart';

import '../controllers/newscontroller.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article passingNewsData;
  // final NewsModel passingNewsData;

  // final NewsController = Get.find<NewsController>();

  NewsDetailsScreen({Key? key, required this.passingNewsData})
      : super(key: key);

  @override
  State<NewsDetailsScreen> createState() =>
      _NewsDetailsScreenState(passingNewsData);
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
//  late String NewsTitle;
  Article passingNewsData;
  _NewsDetailsScreenState(this.passingNewsData);
  void initState() {
    super.initState();
    // for testing the data ...............//
    print("passingdata:$passingNewsData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News Details Screen"),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(passingNewsData.urlToImage.toString()),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // _imageDisplay(),
              Text(
                passingNewsData.author.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                passingNewsData.author.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: Text(
                       passingNewsData.description.toString(),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              // _headingNews(),
              // _newsTime(),
            ],
          ),
// child: ListView.builder(
//   itemCount:passingNewsData.articles!.length,
//   itemBuilder: (context,index){
//     return             Text(widget.passingNewsData.articles![index].author.toString());

//   }

//   ),
        ));
  }

  Widget _headingNews() {
    return Text("Here News Heading");
  }

  Widget _newsTime() {
    return Text("Here News  time");
  }
}
