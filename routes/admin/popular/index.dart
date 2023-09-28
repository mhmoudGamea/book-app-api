import 'dart:convert';
import 'dart:io';

import 'package:book_app_api/src/admin/popular/models/popular_model.dart';
import 'package:book_app_api/src/admin/popular/service/popular_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.get => _get(context),
    HttpMethod.post => _add(context),
    HttpMethod.delete => _delete(context),
    _ => _notAllowed(),
  };
}

Future<Response> _get(RequestContext context) async {
  try {
    final popular = context.read<PopularServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    if (requestQuery.isEmpty) {
      return await popular.getAllBooks();
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

Future<Response> _add(RequestContext context) async {
  try {
    final popular = context.read<PopularServiceImpl>();

    final requestBody =
        json.decode(await context.request.body()) as Map<String, dynamic>;

    if (requestBody.isNotEmpty) {
      final popularModel = PopularModel.fromJson(requestBody);
      return await popular.addBook(popularModel: popularModel);
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
        'message': 'Error in _insert method: $error',
      },
    );
  }
}

Future<Response> _delete(RequestContext context) async {
  try {
    final popular = context.read<PopularServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final bookId = requestQuery['book_id']?.toString();

    if (bookId != null && bookId.isNotEmpty) {
      return await popular.deleteBook(bookId: bookId);
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
    body: {
      'status_code': HttpStatus.methodNotAllowed,
      'result': 'Method not allowed',
    },
  );
}
