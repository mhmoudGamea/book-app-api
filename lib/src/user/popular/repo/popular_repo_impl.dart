// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/user/popular/models/popular_model.dart';
import 'package:book_app_api/src/user/popular/repo/popular_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firedart.dart';

class PopularRepoImpl implements PopularRepo {
  final CollectionReference _collectionReference =
      Firestore.instance.collection(
    Constants.popularCollection,
  );

  @override
  Future<List<Map<String, dynamic>>> getAllBooks() async {
    try {
      final books = await _collectionReference.get();

      return PopularModel.bookList(books);
    } catch (error) {
      throw Exception("Can't get all books $error");
    }
  }

  @override
  Future<Map<String, dynamic>> getBookById({required String bookId}) async {
    try {
      final book = await _collectionReference.document(bookId).get();

      if (await book.reference.exists) {
        return book.map;
      }

      throw Exception("Can't find book with id = $bookId");
    } catch (error) {
      throw Exception("Can't get this book $error");
    }
  }
}
