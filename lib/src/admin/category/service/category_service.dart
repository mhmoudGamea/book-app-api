// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/admin/category/models/category_model.dart';
import 'package:dart_frog/dart_frog.dart';

abstract class CategoryService {
  Future<Response> getCategories();

  Future<Response> getCategory({
    required String id,
    required String name,
  });

  Future<Response> addCategory({required CategoryModel categoryModel});

  Future<Response> deleteCategory({required String categoryId});
}
