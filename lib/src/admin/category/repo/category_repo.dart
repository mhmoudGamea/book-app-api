// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/admin/category/models/category_model.dart';

abstract class CategoryRepo {
  Future<List<Map<String, dynamic>>> getCategories();

  Future<List<Map<String, dynamic>>> getCategory({
    required String id,
    required String name,
  });

  Future<void> addCategory({required CategoryModel categoryModel});

  Future<bool> deleteCategory({required String categoryId});
}
