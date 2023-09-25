// ignore_for_file: eol_at_end_of_file, public_member_api_docs

import 'package:book_app_api/src/books/models/book_model.dart';
import 'package:book_app_api/src/books/repo/book_repo.dart';
import 'package:book_app_api/utils/constants.dart';
import 'package:firedart/firedart.dart';

class BookRepoImpl implements BookRepo {
  final CollectionReference _firestore = Firestore.instance.collection(
    Constants.collection,
  );

  @override
  Future<void> addBook({
    required BookModel bookModel,
  }) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      await _firestore
          .document(
            id,
          )
          .set(
            bookModel.copyWith(id: id).toJson(),
          );
    } catch (error) {
      throw Exception('Un successiful insert operation');
    }
  }

  @override
  Future<void> deleteBook({required String bookId}) async {
    try {
      final docRef = await _firestore.document(bookId).get();
      if (await docRef.reference.exists) {
        await _firestore
            .document(
              bookId,
            )
            .delete();
      }
    } catch (error) {
      throw Exception('Un successiful delete operation');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllBooks() async {
    try {
      final books = await _firestore.get();

      return BookModel.bookList(books);
    } catch (error) {
      throw Exception("Can't get all books $error");
    }
  }

  @override
  Future<Map<String, dynamic>> getBookById({required String bookId}) async {
    try {
      final book = await _firestore.document(bookId).get();

      if (await book.reference.exists) {
        return book.map;
      }

      throw Exception("Can't find book with id = $bookId");
    } catch (error) {
      throw Exception("Can't get this book $error");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchBookByName({
    required String bookName,
  }) async {
    try {
      final bookNameList = <Map<String, dynamic>>[];

      final documents = await _firestore.get();
      for (final doc in documents) {
        if (doc.map['name'] == bookName) {
          bookNameList.add(doc.map);
        }
      }

      return bookNameList;
    } catch (error) {
      throw Exception("Can't get book with name = $bookName");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchBookByAuthor({
    required String bookAuthorName,
  }) async {
    try {
      final bookAuthorList = <Map<String, dynamic>>[];
      final documents = await _firestore.get();
      for (final doc in documents) {
        if (doc.map['author'] == bookAuthorName) {
          bookAuthorList.add(doc.map);
        }
      }
      return bookAuthorList;
    } catch (error) {
      throw Exception("Can't get book with author name = $bookAuthorName");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> searchBookByCategory({
    required String bookCategoryName,
  }) async {
    try {
      final bookCategoryList = <Map<String, dynamic>>[];
      final documents = await _firestore.get();
      for (final doc in documents) {
        if (doc.map['category'] == bookCategoryList) {
          bookCategoryList.add(doc.map);
        }
      }
      return bookCategoryList;
    } catch (error) {
      throw Exception("Can't get book with category name = $bookCategoryName");
    }
  }
}
