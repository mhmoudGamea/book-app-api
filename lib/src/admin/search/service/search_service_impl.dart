// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/admin/search/repo/search_repo.dart';
import 'package:book_app_api/src/admin/search/repo/search_repo_impl.dart';
import 'package:book_app_api/src/admin/search/service/search_service.dart';
import 'package:dart_frog/dart_frog.dart';

class SearchServiceImpl implements SearchService {
  final SearchRepo _searchRepo = SearchRepoImpl();
  @override
  Future<Response> searchBookByAuthor({required String authorName}) async {
    try {
      final result =
          await _searchRepo.searchBookByAuthor(authorName: authorName);

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

  @override
  Future<Response> searchBookByCategory({required String categoryName}) async {
    try {
      final result = await _searchRepo.searchBookByCategory(
        categoryName: categoryName,
      );

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

  @override
  Future<Response> searchBookByName({required String bookName}) async {
    try {
      final result = await _searchRepo.searchBookByName(bookName: bookName);

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
