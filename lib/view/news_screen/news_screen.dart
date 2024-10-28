import 'package:flutter/material.dart';
import 'package:new_api/controllers/news_screen_controller.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsScreenController>().getnewsapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<NewsScreenController>(
            builder: (context, providerobj, child) => ListView.builder(
                  itemCount: providerobj.articleList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.network(providerobj.articleList[index].urlToImage ??
                          "no image"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(providerobj.articleList[index].publishedAt
                          .toString()),
                      SizedBox(
                        height: 20,
                      ),
                      Text(providerobj.articleList[index].title.toString()),
                      SizedBox(
                        height: 40,
                      ),
                      Text(providerobj.articleList[index].content ??
                          "no content")
                    ],
                  ),
                )),
      ),
    );
  }
}
