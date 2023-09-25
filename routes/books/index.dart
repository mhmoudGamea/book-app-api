import 'dart:convert';
import 'dart:io';

import 'package:book_app_api/src/books/models/book_model.dart';
import 'package:book_app_api/src/books/service/book_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.get => _get(context),
    HttpMethod.post => _insert(context),
    HttpMethod.delete => _delete(context),
    _ => _notAllowed(),
  };
}

Future<Response> _get(RequestContext context) async {
  try {
    final bookService = context.read<BookServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final bookName = requestQuery['book_name']?.toString();
    final authorName = requestQuery['author_name']?.toString();
    final categoryName = requestQuery['category_name']?.toString();

    if (bookName != null && bookName.isNotEmpty) {
      return await bookService.searchBookByName(bookName: bookName);
    } else if (authorName != null && authorName.isNotEmpty) {
      return await bookService.searchBookByAuthor(authorName: authorName);
    } else if (categoryName != null && categoryName.isNotEmpty) {
      return await bookService.searchBookByCategory(categoryName: categoryName);
    } else {
      return await bookService.getAllBooks();
    }
  } catch (error) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {
        'status_code': HttpStatus.internalServerError,
        'message': 'Error in _get method: $error',
      },
    );
  }
}

Future<Response> _insert(RequestContext context) async {
  try {
    final bookService = context.read<BookServiceImpl>();

    final requestBody =
        json.decode(await context.request.body()) as Map<String, dynamic>;

    if (requestBody.isNotEmpty) {
      final bookModel = BookModel.fromJson(requestBody);
      return await bookService.addBook(bookModel: bookModel);
    } else {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': 'Invalid request body',
        },
      );
    }
  } catch (error) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {
        'status_code': HttpStatus.internalServerError,
        'message': 'Error in _insert method: $error',
      },
    );
  }
}

Future<Response> _delete(RequestContext context) async {
  try {
    final bookService = context.read<BookServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final bookId = requestQuery['book_id']?.toString();

    if (bookId != null && bookId.isNotEmpty) {
      return await bookService.deleteBook(bookId: bookId);
    } else {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': 'Invalid request body',
        },
      );
    }
  } catch (error) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {
        'status_code': HttpStatus.internalServerError,
        'message': 'Error in _delete method: $error',
      },
    );
  }
}

Future<Response> _notAllowed() async {
  return Response.json(
    statusCode: HttpStatus.methodNotAllowed,
    body: 'Method not allowed',
  );
}
