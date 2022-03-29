import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/model.dart';
import '../news_module/controllers/home_controller.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;
  final homeNewsController = Get.find<HomeNewsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FD),
      appBar: AppBar(),
      body: SizedBox(
        height: Get.height,
        child: ListView(
          // shrinkWrap: true,
          children: [
            CachedNetworkImage(
              imageUrl: newsModel.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                width: Get.width,
                height: Get.width * 3 / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => CachedNetworkImage(
                imageUrl:
                    "https://homestaymatch.com/images/no-image-available.png",
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
              width: Get.width,
              height: Get.width * 3 / 4,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.title,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    newsModel.publishedAt.toString(),
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    newsModel.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 24),
                  InkWell(
                    onTap: (() {
                      homeNewsController.launchURL(url: newsModel.url);
                    }),
                    child: Row(
                      children: const [
                        Text(
                          "See full Story",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
