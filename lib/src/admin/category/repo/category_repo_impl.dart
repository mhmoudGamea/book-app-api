// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/admin/category/models/book_model.dart';
import 'package:book_app_api/src/admin/category/models/category_model.dart';
import 'package:book_app_api/src/admin/category/repo/category_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firedart.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CollectionReference _collectionReference =
      Firestore.instance.collection(
    Constants.categoryCollection,
  );

  @override
  Future<void> addCategory({required CategoryModel categoryModel}) async {
    try {
      final documents = await _collectionReference.get();
      for (final doc in documents) {
        if (doc.map['name'].toString().toLowerCase() ==
            categoryModel.name.toLowerCase()) {
          throw Exception('There is another category with this name');
        }
      }
      final id = documents.length.toString();
      await _collectionReference.document(id).set(
            categoryModel.copyWith(id: id).toJson(),
          );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteCategory({required String categoryId}) async {
    try {
      final documents = await _collectionReference.get();
      for (final doc in documents) {
        if (doc.map['id'] == categoryId) {
          await doc.reference.delete();
          return true;
        }
      }
      return false;
    } catch (error) {
      throw Exception("Sorry we can't delete this category");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final result = await _collectionReference.get();
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

  @override
  Future<void> addBook({required BookModel bookModel}) async {
    try {
      final collection = Firestore.instance.collection(
        Constants.categoriesCollection,
      );
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      await collection
          .document(bookModel.categoryId)
          .collection(bookModel.category)
          .document(id)
          .set(bookModel.copyWith(id: id, read: 0, download: 0).toJson());
    } catch (error) {
      throw Exception(
        "Can't add ${bookModel.name} to ${bookModel.category} category",
      );
    }
  }
}
