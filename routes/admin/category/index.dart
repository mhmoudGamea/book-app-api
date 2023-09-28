import 'dart:convert';
import 'dart:io';

import 'package:book_app_api/src/admin/category/models/category_model.dart';
import 'package:book_app_api/src/admin/category/service/category_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _get(context),
    HttpMethod.post => _add(context),
    HttpMethod.delete => _delete(context),
    _ => _notAllowed()
  };
}

Future<Response> _get(RequestContext context) async {
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

Future<Response> _add(RequestContext context) async {
  try {
    final service = context.read<CategoryServiceImpl>();

    final requestBody =
        json.decode(await context.request.body()) as Map<String, dynamic>;

    if (requestBody.isNotEmpty) {
      final categoryModel = CategoryModel.fromJson(requestBody);
      return await service.addCategory(categoryModel: categoryModel);
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
        'message': 'Error in _add method: $error',
      },
    );
  }
}

Future<Response> _delete(RequestContext context) async {
  try {
    final service = context.read<CategoryServiceImpl>();
    final requestQuery = context.request.uri.queryParameters;

    final categoryId = requestQuery['category_id']?.toString();

    if (categoryId != null && categoryId.isNotEmpty) {
      return await service.deleteCategory(categoryId: categoryId);
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
