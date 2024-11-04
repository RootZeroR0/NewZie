import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NewsTileLoading.dart';
import 'package:news_app/Components/TrendingLoadingCard.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrendingCard.dart';
import 'package:news_app/Pages/NewDetails/NewsDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "NEWZIE",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrendingLoading.value
                        ? const Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.trendingNewsList
                                .map(
                                  (e) => TrendingCard(
                                    ontap: () {
                                      Get.to(NewsDetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Trending news",
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isNewsForULoading.value
                    ? const Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.newsForYou5
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
        ),
      ),
    );
  }
}
