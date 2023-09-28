import 'package:book_app_api/src/admin/search/repo/search_repo_impl.dart';
import 'package:book_app_api/src/admin/search/service/search_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(repoProvider()).use(serviceProvider());
}

Middleware repoProvider() {
  return provider<SearchRepoImpl>((_) => SearchRepoImpl());
}

Middleware serviceProvider() {
  return provider<SearchServiceImpl>((_) => SearchServiceImpl());
}
