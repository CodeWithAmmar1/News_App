import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/home_controller.dart';

class NewsView extends StatelessWidget {
  NewsView({super.key});

  final HomeController _homeScreenController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String imageUrl = arguments['image'] ?? '';
    final String title = arguments['title'] ?? 'No Title';
    final String author = arguments['author'] ?? 'No Author';
    String content = arguments['content'] ?? 'No Content Available';
    final String News_url = arguments['url'] ?? '';
    final String publishedAt = arguments['publishedAt'] ?? 'Unknown Date';
    if (content.endsWith('chars]')) {
      content = content.trim().substring(0, content.length - 14);
    } else {
      content = content.trim();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: imageUrl,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    imageUrl.isNotEmpty
                        ? imageUrl
                        : 'https://media.istockphoto.com/id/2156307983/photo/american-woman-views-online-news-articles-on-laptop-and-phone-while-relaxing-on-sofa-in-black.jpg?s=612x612&w=0&k=20&c=GpN_Z9pl5xzoZFCFZvndNgQGmCWv7gb-F_YGTxfeQtE=',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Wrap(
                    children: [
                      Text(
                        content,
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            _homeScreenController.openAppweb(News_url);
                          },
                          child: const Text(
                            "more..",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Authorized by : $author",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "Published at : $publishedAt",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
