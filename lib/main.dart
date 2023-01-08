import 'package:flutter/material.dart';
import 'package:news_apppp/models/news_model.dart';
import 'package:news_apppp/provider/news_provider.dart';
import 'package:news_apppp/screens/news_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'database/data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsDataModelAdapter());
 //await Hive.openBox<News>('news');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NewsProvider>(create: (_) => NewsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsHomeScreen(),
    );
  }
}
