// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:book_app_api/src/admin/category/models/book_model.dart';
import 'package:book_app_api/src/admin/category/models/category_model.dart';
import 'package:book_app_api/src/admin/category/repo/category_repo.dart';
import 'package:book_app_api/src/admin/category/repo/category_repo_impl.dart';
import 'package:book_app_api/src/admin/category/service/category_service.dart';
import 'package:dart_frog/dart_frog.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepo _categoryRepo = CategoryRepoImpl();
  @override
  Future<Response> addCategory({required CategoryModel categoryModel}) async {
    try {
      await _categoryRepo.addCategory(categoryModel: categoryModel);
      return Response.json(
        body: {
          'status_code': 200,
          'result':
              '${categoryModel.name.toUpperCase()} category is added successfully',
        },
      );
    } catch (error) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': error.toString(),
        },
      );
    }
  }

  @override
  Future<Response> deleteCategory({required String categoryId}) async {
    try {
      final result = await _categoryRepo.deleteCategory(categoryId: categoryId);
      if (result) {
        return Response.json(
          body: {
            'status_code': 200,
            'result': 'Category with id = $categoryId is deleted successfully',
          },
        );
      } else {
        return Response.json(
          statusCode: HttpStatus.notFound,
          body: {
            'status_code': HttpStatus.notFound,
            'result': 'Category with id = $categoryId is not found',
          },
        );
      }
    } catch (error) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': error.toString(),
        },
      );
    }
  }

  @override
  Future<Response> getCategories() async {
    try {
      final result = await _categoryRepo.getCategories();
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
  Future<Response> getCategory({
    required String id,
    required String name,
  }) async {
    try {
      final result = await _categoryRepo.getCategory(id: id, name: name);
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
  Future<Response> addBook({required BookModel bookModel}) async {
    try {
      await _categoryRepo.addBook(bookModel: bookModel);
      return Response.json(
        body: {
          'status_code': 200,
          'result':
              '${bookModel.name} book is added to ${bookModel.category} category',
        },
      );
    } catch (error) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'result': error.toString(),
        },
      );
    }
  }
}
