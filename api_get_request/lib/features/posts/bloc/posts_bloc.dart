import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:api_request/features/posts/models/posts_ui_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostFetchInitialEvent>(postFetchInitialEvent);
  }

  FutureOr<void> postFetchInitialEvent(
      PostFetchInitialEvent event, Emitter<PostsState> emit) async {
    var client = http.Client();
    List<PostsUiDataModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        // body: {'name': 'doodle', 'color': 'blue'}
      );
      
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostsUiDataModel post =
            PostsUiDataModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      log(posts.toString());
      log("posts ma post aayo hai ta");
      emit(PostsLoadedSuccessState(posts: posts));
    } catch (e) {
      log(e.toString());
    }
  }
}
