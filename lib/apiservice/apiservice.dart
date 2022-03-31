/* import 'package:dio/dio.dart';
import 'package:news_app/models/news_model_data.dart';

import '../common_modules/loggerfile.dart';

class NewsApiServices {
  static String _apiKey = '378a93be58114d87bfd4b87429f14749';
  // String _url =
  //     'https://newsapi.org/v2/everything?q=tesla&from=2022-02-17&sortBy=publishedAt&apiKey=$_apiKey';
  
  
  String _url = 'https://newsapi.org/v2/everything?q=tesla&from=2022-02-22&sortBy=publishedAt&apiKey=378a93be58114d87bfd4b87429f14749';
  
  late Dio _dio;
  NewsApiServices() {
    _dio = Dio();
  }
    Future fetchNewsArticle() async {
    try {
      Response response = await _dio.get(_url);
      logger.d("test results:$response");
      // print("test result :$response");
          NewsResponse newsResponce = NewsResponse.fromJson(response.data);
                // NewsModel newsResponce = NewsModel.fromJson(response.data);
             print("artickles:${newsResponce.articles}");
             logger.d ('artickles:${newsResponce.articles}');
          return newsResponce.articles;
                // return newsResponce;

    }
     on DioError catch (e) {
      print(e);
    }
    // update();
  }
} */



