// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/admin/search/repo/search_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firedart.dart';

class SearchRepoImpl implements SearchRepo {
  final CollectionReference _collectionReference =
      Firestore.instance.collection(
    Constants.popularCollection,
  );

  @override
  Future<List<Map<String, dynamic>>> searchBookByAuthor({
    required String authorName,
  }) async {
    try {
      final authorList = <Map<String, dynamic>>[];
      final documents = await _collectionReference.get();
      for (final doc in documents) {
        if (doc.map['author'] == authorName) {
          authorList.add(doc.map);
        }
      }
      return authorList;
    } catch (error) {
      throw Exception("Can't get book with author name = $authorName");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchBookByCategory({
    required String categoryName,
  }) async {
    try {
      final categoryList = <Map<String, dynamic>>[];
      final documents = await _collectionReference.get();
      for (final doc in documents) {
        if (doc.map['category'] == categoryName) {
          categoryList.add(doc.map);
        }
      }
      return categoryList;
    } catch (error) {
      throw Exception("Can't get book with category name = $categoryName");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchBookByName({
    required String bookName,
  }) async {
    try {
      final nameList = <Map<String, dynamic>>[];

      final documents = await _collectionReference.get();
      for (final doc in documents) {
        if (doc.map['name'] == bookName) {
          nameList.add(doc.map);
        }
      }

      return nameList;
    } catch (error) {
      throw Exception("Can't get book with name = $bookName");
    }
  }
}
