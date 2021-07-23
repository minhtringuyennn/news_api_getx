import 'package:get/get.dart';
import 'package:news_api_getx/core/repository/news_repo.dart';
import 'package:news_api_getx/core/repository/news_repo_impl.dart';
import 'package:news_api_getx/core/model/article.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo? _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  loadNewsLine() async {
    showLoading();

    final result = await _newsRepo!.getNewsHeadline();

    print(result);

    hideLoading();

    articles = result.obs;
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() async {
    isLoading.toggle();
  }
}
