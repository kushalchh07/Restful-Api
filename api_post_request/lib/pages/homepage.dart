// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_post_request/bloc/posts_bloc.dart';
import 'package:api_post_request/bloc/posts_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _userIdController.dispose();
    _idController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _post() {
    if (_formKey.currentState?.validate() ?? false) {
      final userId = _userIdController.text;
      final id = _idController.text;
      final title = _titleController.text;
      final body = _bodyController.text;

      BlocProvider.of<PostsBloc>(context)
          .add(PostSubmitted(userId, id, title, body));
      // Perform your POST operation here with the collected data
      print('UserId: $userId, Id: $id, Title: $title, Body: $body');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Post Request"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _userIdController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'User ID',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a User ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ID',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Title';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _bodyController,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Body';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _post,
                          child: Text('Post'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                          ),
                        ),
                      ),
                      BlocBuilder<PostsBloc, PostsState>(
                        builder: (context, state) {
                          if (state is PostLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is PostSuccess) {
                            return Center(
                                child: Text('Post successful!',
                                    style: TextStyle(color: Colors.green)));
                          } else if (state is PostFailure) {
                            return Center(
                                child: Text('Post failed!',
                                    style: TextStyle(color: Colors.red)));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
