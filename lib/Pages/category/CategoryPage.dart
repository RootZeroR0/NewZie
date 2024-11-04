// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/Components/NewsTileLoading.dart';
// import 'package:news_app/Controller/NewsController.dart';
// import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
// import 'package:news_app/Pages/NewDetails/NewsDetails.dart';

// class CategoryPage extends StatelessWidget {
//   final NewsController newsController = Get.put(NewsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Categories'),
//       ),
//       body: Column(
//         children: [
//           // Category Scroller
//           SizedBox(
//             height: 40,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => newsController.changeCategory(index),
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: newsController.selectedCategoryIndex.value == index
//                           ? Theme.of(context).colorScheme.primary
//                           : Colors.grey,
//                     ),
//                     child: Text(
//                       ['Business News', 'Apple News', 'Tesla News'][index],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // News List
//           Expanded(
//             child: Obx(
//               () => newsController.isNewsForULoading.value
//                   ? SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: const Column(
//                         children: [
//                           NewsTileLoading(),
//                           NewsTileLoading(),
//                           NewsTileLoading(),
//                         ],
//                       ),
//                     )
//                   : Column(
//                       children: newsController.currentNews
//                           .map(
//                             (e) => NewsTile(
//                               ontap: () {
//                                 Get.to(NewsDetailsPage(news: e));
//                               },
//                               imageUrl: e.urlToImage ??
//                                   "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
//                               title: e.title!,
//                               author: e.author ?? "Unknown",
//                               time: e.publishedAt!,
//                             ),
//                           )
//                           .toList(),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NewsTileLoading.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/NewDetails/NewsDetails.dart';

class CategoryPage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Categories'),
      ),
      body: Obx(
        () => Column(
          children: [
            // Category Scroller
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      newsController.changeCategory(index);
                      print('Selected category index: $index');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            newsController.selectedCategoryIndex.value == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                      ),
                      child: Text(
                        ['Business News', 'Apple News', 'Tesla News'][index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // News List
            Expanded(
              child: newsController.isNewsForULoading.value
                  ? ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => const NewsTileLoading(),
                    )
                  : ListView.builder(
                      itemCount: newsController.currentNews.length,
                      itemBuilder: (context, index) {
                        final news = newsController.currentNews[index];
                        return NewsTile(
                          ontap: () {
                            Get.to(NewsDetailsPage(news: news));
                          },
                          imageUrl: news.urlToImage ??
                              "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
                          title: news.title!,
                          author: news.author ?? "Unknown",
                          time: news.publishedAt!.substring(0, 11),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
