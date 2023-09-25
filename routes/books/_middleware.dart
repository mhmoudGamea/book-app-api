import 'package:book_app_api/src/books/repo/book_repo_impl.dart';
import 'package:book_app_api/src/books/service/book_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(repoProvide()).use(serviceProvider());
}

Middleware repoProvide() {
  return provider<BookRepoImpl>(
    (_) => BookRepoImpl(),
  );
}

Middleware serviceProvider() {
  return provider<BookServiceImpl>(
    (_) => BookServiceImpl(),
  );
}
