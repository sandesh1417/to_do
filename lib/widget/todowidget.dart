import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/page/edit_todo_page.dart';
import 'package:todo/utils.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        child: buildTodo(context),
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () => editTodo(context, todo),
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap: () => deleteTodo(context, todo),
            icon: Icons.delete,
          )
        ],
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
            activeColor: Color(0xffd54811),
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              final isDone = provider.toggleTodoStatus(todo);

              Utils.showSnackBar(
                context,
                isDone ? 'Task completed' : 'Task marked incomplete',
              );
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    child: Text(
                      todo.description,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
