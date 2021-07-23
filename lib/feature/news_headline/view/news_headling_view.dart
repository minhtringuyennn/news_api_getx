import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_getx/core/widget/article.dart';
import 'package:news_api_getx/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "News Headline",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.search, size: 28),
              onPressed: () => Get.toNamed('/search_news'),
            ),
          ],
        ),
      ),
      //drawer: getAppDrawer(),
      body: Obx(
        () {
          return controller.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      return BuildArticle(
                        key: ValueKey<int>(index),
                        index: index,
                        controller: controller,
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
