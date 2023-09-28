import 'dart:io';

import 'package:book_app_api/src/admin/search/service/search_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.get => _search(context),
    _ => _notAllowed(),
  };
}

Future<Response> _search(RequestContext context) async {
  try {
    final search = context.read<SearchServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final bookName = requestQuery['book_name']?.toString();
    final authorName = requestQuery['author_name']?.toString();
    final categoryName = requestQuery['category_name']?.toString();

    if (bookName != null && bookName.isNotEmpty) {
      return await search.searchBookByName(bookName: bookName);
    } else if (authorName != null && authorName.isNotEmpty) {
      return await search.searchBookByAuthor(authorName: authorName);
    } else if (categoryName != null && categoryName.isNotEmpty) {
      return await search.searchBookByCategory(categoryName: categoryName);
    } else {
      return Response.json(
        statusCode: HttpStatus.notFound,
        body: {
          'status_code': HttpStatus.notFound,
          'message':
              'Not found. please make sure that you write a correct endpoint',
        },
      );
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

Future<Response> _notAllowed() async {
  return Response.json(
    statusCode: HttpStatus.methodNotAllowed,
    body: {
      'status_code': HttpStatus.methodNotAllowed,
      'result': 'Method not allowed',
    },
  );
}
