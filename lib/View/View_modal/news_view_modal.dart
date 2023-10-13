
import 'package:news_app/Model/categories_news_model.dart';
import 'package:news_app/Model/news_channel_headline_model.dart';
import 'package:news_app/repository/news_repostory.dart';

class  NewsViewModel{
 final _rep = NewsRepository();

 Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlineApi (String channelName) async{
   final response = await _rep.fetchNewsChannelHeadlineApi(channelName);
   return response;
 }

 Future<CategoriesNewsModel> fetchCategoriesNewsApi (String categories) async{
   final response = await _rep.fetchCategoriesNewModel(categories);
   return response;
 }

}