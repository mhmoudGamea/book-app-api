// ignore_for_file: public_member_api_docs

import 'package:dart_frog/dart_frog.dart';

abstract class SearchService {
  Future<Response> searchBookByName({required String bookName});

  Future<Response> searchBookByAuthor({required String authorName});

  Future<Response> searchBookByCategory({required String categoryName});
}
