// ignore_for_file: type_literal_in_constant_pattern, prefer_const_constructors

import 'dart:developer';

import 'package:api_request/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    postsBloc.add(PostFetchInitialEvent());
    super.initState();
  }

  final PostsBloc postsBloc = PostsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // if (state is PostsInitial) {
          //   postsBloc.add(PostFetchInitialEvent());
          // }
          // if (state is PostsLoadingState) {
          //   log('$state');
          // } else if (state is PostsLoadedSuccessState) {
          //   log('$state');
          // } else {
          //   log('$state');
          // }
          // return SizedBox();
          switch (state.runtimeType) {
            case PostsLoadedSuccessState:
              final successState = state as PostsLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: Text("Posts"),
                ),
                body: Container(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey.shade300,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(successState.posts[index].userId.toString()),
                          Text(successState.posts[index].id.toString()),
                          Text(
                            successState.posts[index].title,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            successState.posts[index].body,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            case PostsLoadingState:
              return Center(
                child: CupertinoActivityIndicator(),
              );
            case PostsErrorState:
              return Container(
                child: Center(
                  child: Text("Error!!"),
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
