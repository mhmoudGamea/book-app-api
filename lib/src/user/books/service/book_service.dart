// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/user/books/models/book_model.dart';
import 'package:dart_frog/dart_frog.dart';

abstract class BookService {
  Future<Response> addBook({required BookModel bookModel});
  Future<Response> deleteBook({required String bookId});
  Future<Response> getAllBooks();
  Future<Response> getBookById({required String bookId});

  Future<Response> searchBookByName({required String bookName});
  Future<Response> searchBookByAuthor({required String authorName});
  Future<Response> searchBookByCategory({required String categoryName});
}
