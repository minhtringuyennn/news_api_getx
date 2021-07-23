import 'package:get/get.dart';
import 'package:news_api_getx/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
