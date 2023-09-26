import 'dart:io';

import 'package:book_app_api/src/user/category/service/category_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.get => _get(context),
    _ => _notAllowed(),
  };
}

Future<Response> _get(RequestContext context) async {
  try {
    final bookService = context.read<CategoryServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    if (requestQuery.isEmpty) {
      return await bookService.getCategories();
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
    body: 'Method not allowed',
  );
}
