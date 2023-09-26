// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/user/category/models/category_model.dart';
import 'package:book_app_api/src/user/category/repo/category_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CollectionReference _firestore = Firestore.instance.collection(
    Constants.categoryCollection,
  );
  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final result = await _firestore.get();
      return CategoryModel.categoryList(result);
    } catch (error) {
      throw Exception("Sorry, can't get categories collection");
    }
  }
}
