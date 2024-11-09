import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/home_controller.dart';
import 'package:newsapp/views/view.dart';
import 'package:shimmer/shimmer.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade500,
          leading: SizedBox(
            height: 70,
            width: 70,
            child: Hero(
              tag: "worldAnimation",
              child: Lottie.asset(
                'assets/world.json',
                fit: BoxFit.cover,
                repeat: true,
                reverse: false,
              ),
            ),
          ),
          centerTitle: true,
          title: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.cyan.shade700,
            child: const Text(
              "USA Pulse",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          toolbarHeight: 80.0,
        ),
        body: Obx(() {
          if (_homeController.isLoading.value) {
            return Center(
              child: Lottie.asset(
                'assets/world.json',
                fit: BoxFit.cover,
                repeat: true,
                reverse: false,
              ),
            );
          } else if (_homeController.newsModel == null) {
            return const Center(child: Text("Error loading data"));
          } else {
            return ListView.builder(
              itemCount: _homeController.newsModel!.articles.length,
              itemBuilder: (BuildContext context, index) {
                var article = _homeController.newsModel!.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => NewsView(),
                        arguments: {
                          'image': article.urlToImage,
                          'title': article.title,
                          'descriptions': article.description,
                          'content': article.content,
                          'url': article.url,
                          'author': article.author,
                          'publishedAt': "${article.publishedAt}",
                        },
                      );
                    },
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (article.title),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            width: MediaQuery.sizeOf(context).height * 0.5,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.cyan.shade300,
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ], borderRadius: BorderRadius.circular(25)),
                            child: Hero(
                              tag: article.urlToImage ?? index,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  article.urlToImage != null &&
                                          article.urlToImage!.isNotEmpty
                                      ? article.urlToImage!
                                      : 'https://media.istockphoto.com/id/2156307983/photo/american-woman-views-online-news-articles-on-laptop-and-phone-while-relaxing-on-sofa-in-black.jpg?s=612x612&w=0&k=20&c=GpN_Z9pl5xzoZFCFZvndNgQGmCWv7gb-F_YGTxfeQtE=',
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return Shimmer.fromColors(
                                      baseColor: Colors.black,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        height: 200,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://media.istockphoto.com/id/1515911274/photo/senior-woman-reading-newspapers-at-home.jpg?s=612x612&w=0&k=20&c=ctqLa0XQBPi4ttKxweARioknv8YoUwvDEiECaus5tgY=', // Replace with a valid local image path
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.description ?? "",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Text(
                                  ("${article.publishedAt}"),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
