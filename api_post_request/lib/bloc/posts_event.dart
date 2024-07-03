part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostSubmitted extends PostsEvent{
  dynamic userId;
  dynamic id;
  dynamic title;
  dynamic body;
  PostSubmitted(this.userId, this.id, this.title, this.body);
}