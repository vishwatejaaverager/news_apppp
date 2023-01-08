import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 8)
class NewsDataModel extends HiveObject {
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final Map<String, dynamic>? source;
  @HiveField(3)
  final String? urlToImage;
  @HiveField(4)
  final String? content;
  @HiveField(5)
  final String? description;

  NewsDataModel({
    this.title,
    this.source,
    this.urlToImage,
    this.content,
    this.description,
  });
}
