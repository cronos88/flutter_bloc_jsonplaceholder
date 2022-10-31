import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/todo/bloc/todo_bloc.dart';
import 'features/todo/todo_repository_impl.dart';
import 'features/todo/todo_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Tutorial',
      home: BlocProvider(
        //create: (context) => TodoCubit(TodoRepositoryImpl()),
        create: (context) => TodoBloc(TodoRepositoryImpl()),
        child: const TodoNameView(),
      ),
    );
  }
}
