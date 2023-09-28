import 'package:book_app_api/src/admin/category/repo/category_repo_impl.dart';
import 'package:book_app_api/src/admin/category/service/category_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(repoProvider()).use(serviceProvider());
}

Middleware repoProvider() {
  return provider<CategoryRepoImpl>((_) => CategoryRepoImpl());
}

Middleware serviceProvider() {
  return provider<CategoryServiceImpl>((_) => CategoryServiceImpl());
}
