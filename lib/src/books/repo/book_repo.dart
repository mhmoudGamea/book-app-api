// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/books/models/book_model.dart';

abstract class BookRepo {
  Future<void> addBook({required BookModel bookModel});
  Future<void> deleteBook({required String bookId});
  Future<List<Map<String, dynamic>>> getAllBooks();
  Future<Map<String, dynamic>> getBookById({required String bookId});

  Future<List<Map<String, dynamic>>> searchBookByName({
    required String bookName,
  });
  Future<List<Map<String, dynamic>>> searchBookByAuthor({
    required String bookAuthorName,
  });
  Future<List<Map<String, dynamic>>> searchBookByCategory({
    required String bookCategoryName,
  });
}
