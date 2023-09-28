// ignore_for_file: public_member_api_docs

abstract class SearchRepo {
  Future<List<Map<String, dynamic>>> searchBookByName({
    required String bookName,
  });

  Future<List<Map<String, dynamic>>> searchBookByAuthor({
    required String authorName,
  });

  Future<List<Map<String, dynamic>>> searchBookByCategory({
    required String categoryName,
  });
}
