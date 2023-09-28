import 'package:book_app_api/src/user/popular/repo/popular_repo_impl.dart';
import 'package:book_app_api/src/user/popular/service/popular_service_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(repoProvide()).use(serviceProvider());
}

Middleware repoProvide() {
  return provider<PopularRepoImpl>(
    (_) => PopularRepoImpl(),
  );
}

Middleware serviceProvider() {
  return provider<PopularServiceImpl>(
    (_) => PopularServiceImpl(),
  );
}
