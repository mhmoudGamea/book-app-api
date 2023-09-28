// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/admin/popular/models/popular_model.dart';
import 'package:book_app_api/src/admin/popular/repo/popular_repo.dart';
import 'package:book_app_api/src/admin/popular/repo/popular_repo_impl.dart';
import 'package:book_app_api/src/admin/popular/service/popular_service.dart';
import 'package:dart_frog/dart_frog.dart';

class PopularServiceImpl implements PopularService {
  final PopularRepo _popularRepo = PopularRepoImpl();

  @override
  Future<Response> addBook({required PopularModel popularModel}) async {
    try {
      await _popularRepo.addBook(popularModel: popularModel);
      return Response.json(
        body: {
          'status_code': 200,
          'result': 'Book added successfully.',
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
  Future<Response> deleteBook({required String bookId}) async {
    try {
      await _popularRepo.deleteBook(bookId: bookId);

      return Response.json(
        body: {
          'status_code': 200,
          'result': 'Book deleted successfully.',
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
