import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

import '../common_modules/AppColors.dart';
import '../news_module/controllers/home_controller.dart';
import '../news_module/views/appbar.dart';
import 'news_list.dart';


class HomeNews extends StatelessWidget {
  HomeNews({Key? key}) : super(key: key);
  final homeNewsController = Get.put(HomeNewsController());

  @override
  void initState() {    
  //DO OTHER STUFF
  HomeNewsController().getNews();
}
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FD),
      appBar:
       AppBar(
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
          NewsAppBar(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 500,
          color: Colors.teal,
          child: ListView(
            // controller: homeNewsController.scrollController,
            // physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
             
              SizedBox(height: 20),
              Container(
                height: 200,
                //  color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Top Headlines",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("sort : "),
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              NewsList(),
            ],
          ),
        ),
      ),
    );
  }
}
