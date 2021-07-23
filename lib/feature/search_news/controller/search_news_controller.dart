import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_api_getx/core/repository/news_repo.dart';
import 'package:news_api_getx/core/repository/news_repo_impl.dart';
import 'package:news_api_getx/core/model/article.dart';

class SearchNewsController extends GetxController {
  late NewsRepo? _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  late RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();

    final result = await _newsRepo!.getSearchedNews(searchTextController.text);

    hideLoading();

    articles = result.obs;
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
