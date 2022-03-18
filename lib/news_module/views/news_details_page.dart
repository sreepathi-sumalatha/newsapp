import 'package:flutter/material.dart';
import 'package:news_app/models/news_model_data.dart';
class NewsDetailsScreen extends StatefulWidget {
  // final NewsResponse passingNewsData;
  

   NewsDetailsScreen({ Key? key,
 
    // required this.passingNewsData
    }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState(
    //  passingNewsData
    );
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
//  late String NewsTitle;
// NewsResponse passingNewsData;
//   _NewsDetailsScreenState(this.passingNewsData);
void initState() {
  super.initState();
  // for testing the data ...............//
// print("passingdata:$passingNewsData"); 
 
} 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details Screen"),
      ),
      body: Container(
        // child: ListView(
        //   children: [
        //     Container(
        //       height:100,
        //       // width: 120,
        //       color: Colors.teal,
        //     ),
        //     // _imageDisplay(),
        //     Text(widget.passingNewsData.articles[index].author.toString()),
        //     _headingNews(),
        //     _newsTime(),
        //   ],
        // ),
// child: ListView.builder(
//   itemCount:passingNewsData.articles!.length,
//   itemBuilder: (context,index){
//     return             Text(widget.passingNewsData.articles![index].author.toString());


//   }
  
  
  
  
//   ),



      )
      
    );
  }


Widget _headingNews(){
  return Text("Here News Heading");
}
Widget _newsTime(){
  return Text("Here News  time");
}








}