import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_apppp/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({super.key});

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff464646),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "HEADLINES",
              style: TextStyle(fontSize: 29),
            ),
          ),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () async{
               await Provider.of<NewsProvider>(context, listen: false)
                    .getNewsFromApi();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                height: MediaQuery.of(context).size.height / 3,
                //color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.black,
                      child: Image.network(
                          "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                          fit: BoxFit.cover),
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
                                child: const Text(
                                  "CM meets affected locals in Joshimath as land subsidence concerns peak: Top 5",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "data",
                                    style: TextStyle(
                                        color: Color(0xffbababa), fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Text(
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
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                const Color(0x00000000)
                              ]),
                          borderRadius: BorderRadius.circular(24)),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
