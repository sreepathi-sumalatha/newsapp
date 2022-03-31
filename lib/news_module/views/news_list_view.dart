// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:news_app/common_modules/AppColors.dart';
import 'package:news_app/news_module/views/search_bar.dart';
import '../../pages/countries_news.dart';
import '../../pages/news_list.dart';
import '../controllers/home_controller.dart';
import 'appbar.dart';
import 'floating_button.dart';
import 'package:get/get.dart';
import 'news_heading.dart';

class NewsDashboardPage extends StatefulWidget {
  NewsDashboardPage({Key? key}) : super(key: key);
  final HomeNewsController controller = Get.put(HomeNewsController());

  // final homeNewsController = Get.find<HomeNewsController>();

  @override
  State<NewsDashboardPage> createState() => _NewsDashboardPageState();
}

class _NewsDashboardPageState extends State<NewsDashboardPage> {
  void initState() {
    // widget.controller.getNews(apiUrl: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leadingWidth: 75,
        leading: const Center(
            child: Text(
          'MyNEWS',
          style: TextStyle(
            fontSize: 15,
          ),
        )),
        actions: <Widget>[
          // NewsAppBar(),
          CountryNews(),
        ],
      ),
      // body: _listdata(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            SearchBar(),
            HeadingText(),
            NewsList(),
          ],
        ),
      ),
      floatingActionButton: FButton(),
    );
  }

  /* ...........list data........... */
  /* Widget _listdata() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SearchBar(),
        HeadingText(),
        Expanded(
          child: Container(
            //  height: 200,
            // color: Colors.red,
            child: NewsList(),

            /*  GetBuilder<HomeNewsController>(
                init: HomeNewsController(),
                                 builder: (controller) {
        
        
        
        
                  return ListView.builder(
                          //  itemCount:10,
                       
                        itemCount: controller.newsList.length,
                    itemBuilder: (context, index) {
                      return
                            //  _newsData(index,controller);
                                  // Text("testing");
                                 Text(controller.newsList[index].author.toString());
            // logger.d('controller.newsList[index].author.toString()');
                    },
                  );
                }
                ), */
          ),
        ),
      ],
    );
  }
 */
  // .........newsData.............//
  /* Widget _newsData(index, controller) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailsScreen(
                    passingNewsData: controller.newsList[index],
                  )),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.newsList[index].author.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          controller.newsList[index].description.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: false,
                        ),
                        SizedBox(height: 50),
                        Text('10 min ago',
                            style: TextStyle(fontSize: 10, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 150,
                  child: controller.newsList[index].urlToImage != null
                      ? Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.newsList[index].urlToImage),
                            ),
                          ),
                        )
                      : null,
                ),
              ]),
        ),
      ),
    );
  } */
}
