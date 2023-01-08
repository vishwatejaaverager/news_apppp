import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_apppp/models/news_model.dart';

class NewsDetailedScreen extends StatefulWidget {
  final News news;
  const NewsDetailedScreen({super.key, required this.news});

  @override
  State<NewsDetailedScreen> createState() => _NewsDetailedScreenState();
}

class _NewsDetailedScreenState extends State<NewsDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                  fit: BoxFit.fitHeight, imageUrl: widget.news.urlToImage!),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black, Color(0x00000000)]),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 24),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        widget.news.title!,
                        style: const TextStyle(
                            fontSize: 29,
                            color: Color(0xfff2f2f3),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(widget.news.source!['name'],
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xfff2f2f3),
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 24, bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        widget.news.description!,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xffbababa)),
                      ),
                    )
                    // Row(
                    //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [

                    //     const SizedBox(
                    //       width: 124,
                    //     ),
                    //     const Text("07-01-2023",
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             color: Color(0xfff2f2f3),
                    //             fontWeight: FontWeight.bold))
                    //   ],
                    // )
                  ],
                )),
            Positioned(
                top: 16,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
