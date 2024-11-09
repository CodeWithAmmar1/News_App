import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/apikey.dart';
import 'package:newsapp/model/model.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  NewsModel? newsModel;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  Future<void> getNews() async {
    String baseUrl = api;
    Uri url = Uri.parse(baseUrl);

    try {
      isLoading.value = true;
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        newsModel = NewsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> openAppweb(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception("Something went wrong $url");
    }
  }
}
