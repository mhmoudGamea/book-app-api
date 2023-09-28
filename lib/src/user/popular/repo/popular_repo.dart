// ignore_for_file: public_member_api_docs

abstract class PopularRepo {
  Future<List<Map<String, dynamic>>> getAllBooks();

  Future<Map<String, dynamic>> getBookById({required String bookId});
}
