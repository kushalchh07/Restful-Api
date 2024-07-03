import 'package:equatable/equatable.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostsState {}

class PostLoading extends PostsState {}

class PostSuccess extends PostsState {}

class PostFailure extends PostsState {}
