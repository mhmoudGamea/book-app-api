// ignore_for_file: public_member_api_docs

import 'package:firedart/firedart.dart';

class CategoryModel {
  const CategoryModel({required this.name, required this.image, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'] as String,
        image: json['image'] as String,
        id: json['id'] == null ? null : json['id'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'id': id,
      };

  CategoryModel copyWith({String? id, String? image, String? name}) =>
      CategoryModel(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
      );

  static List<Map<String, dynamic>> categoryList(Page<Document> page) {
    // ignore: omit_local_variable_types, prefer_final_locals
    List<Map<String, dynamic>> categories = [];

    for (final doc in page) {
      categories.add(doc.map);
    }
    return categories;
  }

  final String name;
  final String image;
  final String? id;
}
