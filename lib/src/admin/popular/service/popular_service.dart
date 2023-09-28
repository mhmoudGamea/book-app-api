// ignore_for_file: public_member_api_docs

import 'package:book_app_api/src/admin/popular/models/popular_model.dart';
import 'package:dart_frog/dart_frog.dart';

abstract class PopularService {
  Future<Response> addBook({required PopularModel popularModel});
  Future<Response> deleteBook({required String bookId});
  Future<Response> getAllBooks();
  Future<Response> getBookById({required String bookId});

  // Future<Response> searchBookByName({required String bookName});
  // Future<Response> searchBookByAuthor({required String authorName});
  // Future<Response> searchBookByCategory({required String categoryName});
}
