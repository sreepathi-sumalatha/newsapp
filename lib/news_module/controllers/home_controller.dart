import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../common_modules/logger_file.dart';
import '../../models/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/route_manager.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  List<NewsModel> newsList = [];
  bool isLoading = false;
  static String _apiKey = '378a93be58114d87bfd4b87429f14749';
  String selectedCountry = "India";
  String tempCountry = "India";
  String selectedCountryCode = "in";
  int? selectedValue = 2;
  List<Map<String, String>> countriesList = [
    {"Nepal": "np"},
    {"USA": "us"},
    {"India": "in"},
    {"Sri Lanka": "sl"},
    {"England": "eng"},
    {"Sweden": "sn"},
    {"Pacific Island": "pc"},
  ];

  String _url =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-02-28&sortBy=publishedAt&apiKey=378a93be58114d87bfd4b87429f14749';
  bool hasMoreItems = true;
  int currentPage = 1;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  getNews();
    getNews(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?pageSize=10&page=$currentPage&country=in&apiKey=378a93be58114d87bfd4b87429f14749");
    scrollController.addListener(() {
      double _maxScroll = scrollController.position.maxScrollExtent;
      double _currentScroll = scrollController.position.pixels;
      double delta = Get.height * 0.25;
      if (_maxScroll - _currentScroll <= delta) {
        currentPage += 1;
        logger.d('scrollListner');
        getNews(
            apiUrl:
                "https://newsapi.org/v2/top-headlines?pageSize=10&page=$currentPage&country=in&apiKey=378a93be58114d87bfd4b87429f14749");
      }
    });
  }

  Future getNews({required String apiUrl}) async {
    if (!hasMoreItems) return;
    try {
      isLoading = true;
      update(["NEWS_LIST"]);
      // update();
      List<NewsModel> tempNewsList = [];
      Response response = await dio.get(_url);
      logger.d('getNews response $response');
      if (response.statusCode == 200) {
        if (response.data['articles'].length < 10) {
          logger.d("hasMore data $hasMoreItems");
          hasMoreItems = false;
        } else {
          hasMoreItems = true;
          logger.d("hasMore $hasMoreItems");
        }
        {
          for (Map<String, dynamic> json in response.data['articles']) {
            NewsModel newsModel = NewsModel.fromJson(json);
            tempNewsList.add(newsModel);
            logger.d(tempNewsList.length);
          }
          newsList.addAll(tempNewsList);
          logger.d("newsResults:$newsList");
        }
      }
    } catch (e) {
    } finally {
      isLoading = false;
      // update();
      update(["NEWS_LIST"]);
    }
  }

  void launchURL({required String url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  resertNewsData() {
    hasMoreItems = true;
    newsList.clear();
    currentPage = 1;
  }

  // .....for the countries news........//
  void getCountryNews() {
    logger.d('homeNewsController.tempCountry $tempCountry');
    logger.d('homeNewsController.selectedCountry $selectedCountry');
    resertNewsData();
    getNews(
      apiUrl:
          "https://newsapi.org/v2/top-headlines?country=$selectedCountryCode&apiKey=$_apiKey",
    );
  }
}
