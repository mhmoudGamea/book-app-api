// ignore_for_file: public_member_api_docs

abstract class CategoryRepo {
  Future<List<Map<String, dynamic>>> getCategories();

  Future<List<Map<String, dynamic>>> getCategory({
    required String id,
    required String name,
  });
}
