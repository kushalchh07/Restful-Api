// ignore_for_file: empty_catches

import 'dart:async';

import 'package:api_post_request/Repository/posts_repository.dart';
import 'package:api_post_request/bloc/posts_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;
  PostsBloc({required this.postsRepository}) : super(PostInitial()){
    on<PostSubmitted>(_onPostSubmitted);
    // on<CreatePost>(_onCreatePost);
  }
  //  void _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
  //   emit(PostLoading());
  //   try {
  //     await postsRepository.createPost(event.userId, event.id, event.title, event.body);
  //     emit(PostSuccess());
  //   } catch (_) {
  //     emit(PostFailure());
  //   }
  // }

  FutureOr<void> _onPostSubmitted(PostSubmitted event, Emitter<PostsState> emit) async{
    emit(PostLoading());
     try {
      await postsRepository.postPosts(event.userId, event.id, event.title, event.body);
      emit(PostSuccess());
    } catch (_) {
      emit(PostFailure());
    }
  }
}
