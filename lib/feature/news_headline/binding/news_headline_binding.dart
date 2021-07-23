import 'package:get/get.dart';
import 'package:news_api_getx/core/repository/news_repo_impl.dart';
import 'package:news_api_getx/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
