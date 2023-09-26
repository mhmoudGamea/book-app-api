// ignore_for_file: public_member_api_docs

abstract class CategoryRepo {
  Future<List<Map<String, dynamic>>> getCategories();
}
