import 'package:flutter/material.dart';

import '../common_modules/loggerfile.dart';
import '../models/model.dart';
import "package:timeago/timeago.dart" as timeago;
import "package:cached_network_image/cached_network_image.dart";

class NewsTemplate extends StatelessWidget {
  NewsTemplate({Key? key, required this.newsModel}) : super(key: key);
  NewsModel newsModel;

  @override
  void initState() {}
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    newsModel.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    newsModel.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,

                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Container(child: Spacer()),
                  // Expanded(child: Container()),
                  Text(
                    timeago.format(newsModel.publishedAt),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  /*    Text(
                    newsModel.publishedAt,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ), */
                ],
              ),
            ),
          ),
          CachedNetworkImage(
            imageUrl: newsModel.urlToImage,
            imageBuilder: (context, imageProvider) => Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              color: Colors.grey,
            ),
            // placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  "https://homestaymatch.com/images/no-image-available.png",
              fit: BoxFit.cover,
            ),
            fit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
        ],
      ),
    );
  }
}
