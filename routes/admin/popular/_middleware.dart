import 'package:book_app_api/src/admin/popular/repo/popular_repo_impl.dart';
import 'package:book_app_api/src/admin/popular/service/popular_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(_repoProvider()).use(_serviceProvider());
}

Middleware _repoProvider() {
  return provider<PopularRepoImpl>((_) => PopularRepoImpl());
}

Middleware _serviceProvider() {
  return provider<PopularServiceImpl>((_) => PopularServiceImpl());
}
