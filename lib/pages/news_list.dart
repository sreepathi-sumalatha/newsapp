import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../news_module/controllers/home_controller.dart';
import 'news_template.dart';


class NewsList extends StatelessWidget {
  NewsList({Key? key}) : super(key: key);
  final homeNewsController = Get.find<HomeNewsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNewsController>(
    init:HomeNewsController(),
      builder: (_) =>
          // homeNewsController.newsList.isEmpty && homeNewsController.isLoading
                        homeNewsController.isLoading

              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
              
                  // controller: homeNewsController.scrollController,
                  // shrinkWrap: true,
                   itemCount: homeNewsController.newsList.length,
                  // itemCount: 10,
                  // physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                        newsListBody(index),
                        // if (homeNewsController.hasMore &&
                        //     homeNewsController.isLoading)
                          CircularProgressIndicator(),
                      ]
                      );
                   /*  if (index == homeNewsController.newsList.length - 1) {
                      return Column(children: [
                        newsListBody(index),
                        // if (homeNewsController.hasMore &&
                        //     homeNewsController.isLoading)
                          CircularProgressIndicator(),
                      ]
                      );
                    } */
                    // NewsModel newsModel = NewsModel();
                    // return newsListBody(index);
                  },
                ),
    );
  }

  Padding newsListBody(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
      /*   onTap: () {
          Get.to(
              () => DetailsNews(newsModel: homeNewsController.newsList[index]));
        }, */
        child: NewsTemplate(
          newsModel: homeNewsController.newsList[index],
        ),
      ),
    );
  }
}
