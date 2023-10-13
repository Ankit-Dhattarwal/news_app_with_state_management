import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/Model/news_channel_headline_model.dart';

import '../Model/categories_news_model.dart';


class NewsRepository {

  // Future ka b use waiting k leye hota hai kyuki api time leti hai
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlineApi (String channelName)async{

    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=4a2ece846ac341cb9094d81ceb3254d0';

    final response = await http.get(Uri.parse(url));  // upar wala url yaha aaye ga;
    // if(kDebugMode){
    //   print(response.body);
    // }
    // await ko use nyu kara hai ki api or call hone mai kitna hi time le sakta hai
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error , Please Try Again!!');
  }


  //For catogeries

 Future<CategoriesNewsModel> fetchCategoriesNewModel(String categories) async{

    String url = 'https://newsapi.org/v2/everything?q=${categories}&apiKey=4a2ece846ac341cb9094d81ceb3254d0';

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Errro , Please Try Again!!');
 }
}