import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';
// import 'cubit/todo_cubit.dart';

class TodoNameView extends StatelessWidget {
  const TodoNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Todo'),
      ),
      body: Center(
        // child: BlocBuilder<TodoCubit, TodoState>(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoInitial) {
              // context.read<TodoCubit>().getData();
              context.read<TodoBloc>().add(TodoFetched());
              return showLoader();
            } else if (state is TodoLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.data[index].title),
                      subtitle: Text(state.data[index].userId.toString()),
                      trailing: Text(state.data[index].completed.toString()),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
