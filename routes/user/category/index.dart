import 'dart:io';

import 'package:book_app_api/src/user/category/service/category_service_impl.dart';
import 'package:book_app_api/utils/firebase_client.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  await FirebaseClient.instance.connect();
  return switch (context.request.method) {
    HttpMethod.get => get(context),
    _ => _notAllowed(),
  };
}

/// 'll get all categories in home page
/// + get specific category eg: Horror category
Future<Response> get(RequestContext context) async {
  try {
    final service = context.read<CategoryServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final categoryName = requestQuery['category_name']?.toString();
    final categoryId = requestQuery['category_id']?.toString();

    if (categoryName != null &&
        categoryName.isNotEmpty &&
        categoryId != null &&
        categoryId.isNotEmpty) {
      return await service.getCategory(id: categoryId, name: categoryName);
    } else if (requestQuery.isEmpty) {
      return await service.getCategories();
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
