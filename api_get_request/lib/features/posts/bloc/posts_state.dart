part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostActionState extends PostsState {}

final class PostsInitial extends PostsState {}

class PostsLoadedSuccessState extends PostsState {
  final List<PostsUiDataModel> posts;

  PostsLoadedSuccessState({required this.posts});
}

class PostsLoadingState extends PostsState {}

class PostsErrorState extends PostsState {}
