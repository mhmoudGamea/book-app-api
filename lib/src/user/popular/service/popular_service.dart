// ignore_for_file: public_member_api_docs

import 'package:dart_frog/dart_frog.dart';

abstract class PopularService {
  Future<Response> getAllBooks();

  Future<Response> getBookById({required String bookId});
}
