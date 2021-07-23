import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_getx/core/widget/article.dart';
import 'package:news_api_getx/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Search News",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return controller.isLoading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.articles.isEmpty
                        ? Center(
                            child: Text("No news found"),
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
          )
        ],
      ),
    );
  }
}
