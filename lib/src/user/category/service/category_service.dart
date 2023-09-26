// ignore_for_file: public_member_api_docs

import 'package:dart_frog/dart_frog.dart';

abstract class CategoryService {
  Future<Response> getCategories();
}
