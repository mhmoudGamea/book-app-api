// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/user/popular/repo/popular_repo.dart';
import 'package:book_app_api/src/user/popular/repo/popular_repo_impl.dart';
import 'package:book_app_api/src/user/popular/service/popular_service.dart';
import 'package:dart_frog/dart_frog.dart';

class PopularServiceImpl implements PopularService {
  final PopularRepo _popularRepo = PopularRepoImpl();

  @override
  Future<Response> getAllBooks() async {
    try {
      final result = await _popularRepo.getAllBooks();

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
  Future<Response> getBookById({required String bookId}) async {
    try {
      final result = await _popularRepo.getBookById(bookId: bookId);

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
