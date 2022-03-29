import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../common_modules/loggerfile.dart';
import '../../models/model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  List<NewsModel> newsList = [];
  bool isLoading = false;
  static String _apiKey = '378a93be58114d87bfd4b87429f14749';
  // String _url =
  //     'https://newsapi.org/v2/everything?q=tesla&from=2022-02-17&sortBy=publishedAt&apiKey=$_apiKey';

  String _url =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-02-28&sortBy=publishedAt&apiKey=378a93be58114d87bfd4b87429f14749';

  @override
  void onInit() {
    getNews();
    // TODO: implement onInit
    super.onInit();
  }

  Future getNews() async {
    try {
      isLoading = true;
      // update(["NEWS_LIST"]);
      update();
      List<NewsModel> tempNewsList = [];
      Response response = await dio.get(_url);
      logger.d('getNews response $response');
      if (response.statusCode == 200) {
        if (response.data['articles'].length != null) {
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
      update();
    }
    void launchURL({required String url}) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }
  }
}
