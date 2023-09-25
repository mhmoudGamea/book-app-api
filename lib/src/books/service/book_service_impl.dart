// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/books/models/book_model.dart';
import 'package:book_app_api/src/books/repo/book_repo.dart';
import 'package:book_app_api/src/books/repo/book_repo_impl.dart';
import 'package:book_app_api/src/books/service/book_service.dart';
import 'package:dart_frog/dart_frog.dart';

class BookServiceImpl implements BookService {
  final BookRepo _bookRepo = BookRepoImpl();

  @override
  Future<Response> addBook({required BookModel bookModel}) async {
    try {
      await _bookRepo.addBook(bookModel: bookModel);
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
      await _bookRepo.deleteBook(bookId: bookId);

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
      final result = await _bookRepo.getAllBooks();

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
      final result = await _bookRepo.getBookById(bookId: bookId);

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
      final result = await _bookRepo.searchBookByName(bookName: bookName);

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
  Future<Response> searchBookByAuthor({required String authorName}) async {
    try {
      final result =
          await _bookRepo.searchBookByAuthor(bookAuthorName: authorName);

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
      final result = await _bookRepo.searchBookByCategory(
        bookCategoryName: categoryName,
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
}
