import 'package:get/get.dart';
import 'package:news_api_getx/core/model/article.dart';
import 'package:news_api_getx/core/model/news_response.dart';
import 'package:news_api_getx/core/repository/news_repo.dart';
import 'package:news_api_getx/service/http_service.dart';
import 'package:news_api_getx/service/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      dynamic response =
          await _httpService.getRequest("/v2/top-headlines?country=us");

      final parsedResponse = NewsResponse.fromJson(response.data);

      print(parsedResponse.status);

      return parsedResponse.articles;
    } on Exception catch (e) {
      throw (e);
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      dynamic response =
          await _httpService.getRequest("/v2/everything?q=$query");

      print("ok21");

      final parsedResponse = NewsResponse.fromJson(response.data);

      print("ok22");

      return parsedResponse.articles;
    } on Exception catch (e) {
      throw (e);
    }
  }
}
