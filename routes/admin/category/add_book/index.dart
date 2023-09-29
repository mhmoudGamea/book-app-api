import 'dart:convert';
import 'dart:io';

import 'package:book_app_api/src/admin/category/models/book_model.dart';
import 'package:book_app_api/src/admin/category/service/category_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.post => _addBook(context),
    _ => _notAllowed(),
  };
}

Future<Response> _addBook(RequestContext context) async {
  try {
    final service = context.read<CategoryServiceImpl>();
    final requestBody =
        json.decode(await context.request.body()) as Map<String, dynamic>;

    if (requestBody.isNotEmpty) {
      final bookModel = BookModel.fromJson(requestBody);
      return await service.addBook(bookModel: bookModel);
    } else {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': 'Invalid request body, request body is empty',
        },
      );
    }
  } catch (error) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {
        'status_code': HttpStatus.internalServerError,
        'message': 'Error in _addBook method: $error',
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
