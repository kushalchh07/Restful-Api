import 'package:api_post_request/Repository/posts_repository.dart';
import 'package:api_post_request/bloc/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register the http client
  locator.registerLazySingleton<http.Client>(() => http.Client());

  // Register the PostsRepository with the http client
  locator.registerLazySingleton<PostsRepository>(() => PostsRepository());

  // Register the PostBloc with the PostsRepository
  locator.registerFactory<PostsBloc>(() => PostsBloc(postsRepository: locator<PostsRepository>()));
}
