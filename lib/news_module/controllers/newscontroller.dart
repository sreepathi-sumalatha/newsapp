import 'package:get/get.dart';
import 'package:news_app/apiservice/apiservice.dart';
import 'package:news_app/models/news_model_data.dart';

 class NewsController extends GetxController{
  bool isLoading = false;
  List <Article> newsList =[];
     @override
  void onInit(){
    getNewsArticles();
    super.onInit();
  }
   Future getNewsArticles() async{
    try{
      // isLoading = true ;
      // var newsList = await NewsApiServices.fetchNewsArticle();
     var newsdata = await NewsApiServices().fetchNewsArticle();
      print("newsresults:$newsdata");
      // if (newsdata != null && newsdata.length != 0) 
        if(newsdata != null)
      {
       newsList.assignAll(newsdata);
            // newsList.addAll(newsdata);

      print("newsdataresult:$newsList");
      }
    }finally{
      isLoading=false;
    }

  } 

}






 

 


 













