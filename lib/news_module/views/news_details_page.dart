import 'package:flutter/material.dart';
class NewsDetailsScreen extends StatefulWidget {
  final  String NewsTitle;
    final  String imageLink;

   NewsDetailsScreen({ Key? key,required this.NewsTitle,required this.imageLink }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState(NewsTitle);
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
 late String NewsTitle;

  _NewsDetailsScreenState(String NewsTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
       child: Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Container(
            //  height:180,
          //  width: 200,
          //  color: Colors.red,
           child:  Image.network(widget.imageLink,
                              // 'https://www.fool.com.au/wp-content/uploads/2022/01/etf-16.9.jpg',
                              // 'https://bsmedia.business-standard.com/_media/bs/img/article/2021-12/31/full/1640958034-2414.jpg',
                              // width: 200,
                              // height: 100,
                              //  fit: BoxFit.fill,
                            ),
         ),
         SizedBox(
           height: 10,
         ),
         Container(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              //  mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
  Text(widget.NewsTitle,
  style: TextStyle(fontWeight: FontWeight.bold,
  
  fontSize: 15
  )
  
  ),
        SizedBox(height:5,),
         Text(" 22 sep,2020 4:40PM",
         style: TextStyle(
           fontSize: 10,
           color:Colors.grey
         )
         )

             ]),
           ),
         ),
        //  Container(
        //    child: Column(children: [
        //      Text("Hello")
        //    ]),
        //  )
      
       ]),
      ),
      
    );
  }
}