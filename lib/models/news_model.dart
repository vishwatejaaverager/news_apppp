// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class News {
  String? title;
  String? name;
  String? urlToImage;
  String? content;
  String? description;
  News({
    this.title,
    this.name,
    this.urlToImage,
    this.content,
    this.description,
  });

  News copyWith({
    String? title,
    String? name,
    String? urlToImage,
    String? content,
    String? description,
  }) {
    return News(
      title: title ?? this.title,
      name: name ?? this.name,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'name': name,
      'urlToImage': urlToImage,
      'content': content,
      'description': description,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      title: map['title'] != null ? map['title'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(title: $title, name: $name, urlToImage: $urlToImage, content: $content, description: $description)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.name == name &&
      other.urlToImage == urlToImage &&
      other.content == content &&
      other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      name.hashCode ^
      urlToImage.hashCode ^
      content.hashCode ^
      description.hashCode;
  }
}
