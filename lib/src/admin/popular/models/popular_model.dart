// ignore_for_file: public_member_api_docs
import 'package:firedart/firedart.dart';

class PopularModel {
  const PopularModel({
    required this.name,
    required this.description,
    required this.image,
    required this.author,
    required this.category,
    required this.downloadUrl,
    this.id,
    this.createdAt,
    this.rate,
    this.read,
    this.download,
  });

  /// Deserialization
  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        id: json['id'] == null ? null : json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        author: json['author'] as String,
        category: json['category'] as String,
        downloadUrl: json['download_url'] as String,
        createdAt:
            json['created_at'] == null ? null : json['created_at'] as String,
        rate: json['rate'] == null ? null : json['rate'] as double,
        read: json['read'] == null ? null : json['read'] as double,
        download: json['download'] == null ? null : json['download'] as double,
      );

  /// Serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'author': author,
        'category': category,
        'download_url': downloadUrl,
        'created_at': createdAt,
        'rate': rate,
        'read': read,
        'download': download,
      };

  /// Update PopularModel
  PopularModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? author,
    String? category,
    String? downloadUrl,
    String? createdAt,
    double? rate,
    double? read,
    double? download,
  }) =>
      PopularModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        author: author ?? this.author,
        category: category ?? this.category,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        createdAt: createdAt ?? this.createdAt,
        rate: rate ?? this.rate,
        read: read ?? this.read,
        download: download ?? this.download,
      );

  static List<Map<String, dynamic>> bookList(Page<Document> page) {
    // ignore: omit_local_variable_types, prefer_final_locals
    List<Map<String, dynamic>> books = [];
    for (final element in page) {
      books.add(element.map);
    }
    return books;
  }

  final String name;
  final String description;
  final String image;
  final String author;
  final String category;
  final String downloadUrl;
  final String? id;
  final String? createdAt;
  final double? rate;

  /// number of people who read the book from my app
  final double? read;

  /// number of people who download the book from my app
  final double? download;
}
