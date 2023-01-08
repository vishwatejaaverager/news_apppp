import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_apppp/database/data_model.dart';
import 'package:news_apppp/provider/news_provider.dart';
import 'package:news_apppp/screens/news_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({super.key});

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  @override
  void initState() {
    Provider.of<NewsProvider>(context, listen: false).getNewsFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff464646),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: InkWell(
            onTap: () async {
              // await Provider.of<NewsProvider>(context, listen: false)
              //     .getNewsFromApi();
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "HEADLINES",
                style: TextStyle(fontSize: 29),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Consumer<NewsProvider>(builder: ((_, __, ___) {
              return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: __.isLoading ? 20 : __.fetchedNews.length,
                    itemBuilder: ((context, index) {
                      return __.isLoading
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: const Color(0x00000000),
                                child: Container(
                                  margin: const EdgeInsets.all(16),
                                  width: 200.0,
                                  height: 100.0,
                                  color: Colors.white,
                                  child: const Text(
                                    'Shimmer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () async {},
                              child: NewsCard(news: __.fetchedNews[index]));
                    })),
              );
            }))
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsDataModel news;
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //  await Provider.of<NewsProvider>(context, listen: false)
        //       .getNewsFromApi();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => NewsDetailedScreen(news: news))));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        height: MediaQuery.of(context).size.height / 3,
        //color: Colors.white,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              // color: Colors.black,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: news.urlToImage ??
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/2048px-Solid_black.svg.png",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Text(
                          news.title ?? "No title ",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            news.source!['name'] ?? "",
                            style: const TextStyle(
                                color: Color(0xffbababa), fontSize: 12),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          const Text(
                            "12-09-2022",
                            style: TextStyle(
                                color: Color(0xffbababa), fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                )),
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Color(0x00000000)]),
                  borderRadius: BorderRadius.circular(24)),
            ))
          ],
        ),
      ),
    );
  }
}
