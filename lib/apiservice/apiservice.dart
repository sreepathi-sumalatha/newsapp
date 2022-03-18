import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/news_model_data.dart';

class NewsApiServices {
  static String _apiKey = '378a93be58114d87bfd4b87429f14749';
  String _url =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-02-17&sortBy=publishedAt&apiKey=$_apiKey';
  late Dio _dio;
  NewsApiServices() {
    _dio = Dio();
  }
    Future fetchNewsArticle() async {
    try {
      Response response = await _dio.get(_url);
      print("test result :$response");
       NewsResponse newsResponce = NewsResponse.fromJson(response.data);
     
      // Article newsResponce = Article.fromJson(response.data);
      // print("artickles:${newsResponce.articles}");
       return newsResponce.articles;
       
      // return newsResponce;
    }
     on DioError catch (e) {
      print(e);
    }
    // update();
  }
}
//.........for the seperate artickle models ...trying.........//


class ArticleApiServices {
  static String _apiKey = '378a93be58114d87bfd4b87429f14749';
  String _url =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-02-17&sortBy=publishedAt&apiKey=$_apiKey';
  late Dio _dio;
  ArticleApiServices() {
    _dio = Dio();
  }
    Future fetchArticle() async {
    try {
      Response response = await _dio.get(_url);
      print("test result :$response");
     Article articleData = Article.fromJson(response.data);
       return articleData;
       
    }
     on DioError catch (e) {
      print(e);
    }
  
  }
}
