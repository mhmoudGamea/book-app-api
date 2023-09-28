// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/user/category/models/category_model.dart';
import 'package:book_app_api/src/user/category/repo/category_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firestore/firestore.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final collection = Firestore.instance.collection(
        Constants.categoryCollection,
      );
      final result = await collection.get();
      return CategoryModel.categoryList(result);
    } catch (error) {
      throw Exception("Can't get all categories");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCategory({
    required String id,
    required String name,
  }) async {
    try {
      final collection = Firestore.instance.collection(
        Constants.categoriesCollection,
      );
      final result = await collection.document(id).collection(name).get();
      return CategoryModel.categoryList(result);
    } catch (error) {
      throw Exception("Can't get $name category");
    }
  }
}
