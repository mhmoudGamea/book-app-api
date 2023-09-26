// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/user/category/repo/category_repo.dart';
import 'package:book_app_api/src/user/category/repo/category_repo_impl.dart';
import 'package:book_app_api/src/user/category/service/category_service.dart';
import 'package:dart_frog/dart_frog.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepo _categoryRepo = CategoryRepoImpl();

  @override
  Future<Response> getCategories() async {
    try {
      final result = await _categoryRepo.getCategories();
      return Response.json(
        body: {
          'status_code': 200,
          'result': result,
        },
      );
    } catch (error) {
      return Response.json(
        statusCode: HttpStatus.notFound,
        body: {
          'status_code': HttpStatus.notFound,
          'result': error.toString(),
        },
      );
    }
  }
}
