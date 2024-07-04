import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/SearchWidget.dart';
import 'package:news_app/Pages/NewDetails/NewsDetails.dart';

import '../HomePage/Widgets/NewsTile.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchWidget(),
                  SizedBox(height: 20),
                  Obx(
                    () => Column(
                      children: newsController.newsForYouList
                          .map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(NewsDetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
                              title: e.title!,
                              author: e.author ?? "Unknown",
                              time: e.publishedAt!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
