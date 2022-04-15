import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_page.dart';
import 'package:todo_app/settings/app_theme.dart';

class TodoListState extends Equatable {
  final List<ToDo> todos;

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      ToDo(desc: "test", selectColor: AppTheme.greenColor),
      ToDo(desc: "today", selectColor: AppTheme.purpleColor),
    ]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todos];

  @override
  // TODO: implement stringify
  bool get stringify => true;

  TodoListState copyWith({
    List<ToDo>? todos,
  }) {
    return TodoListState(todos: todos ?? this.todos);
  }
}

class ToDoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  Color color = Colors.green;

  void addTodo(String todoDesc, Color selectColors) {
    final newTodo = ToDo(desc: todoDesc, selectColor: selectColors);
    final newTodos = [..._state.todos, newTodo];

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final newTodos = _state.todos.map((ToDo todo) {
      if (todo.id == id) {
        return ToDo(
          id: id,
          desc: todo.desc,
          selectColor: todo.selectColor,
        );
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
  setColor(Color color){
    this.color = color;
    notifyListeners();
  }
  void removeTodo(ToDo toDo) {
    final newTodos = _state.todos.where((ToDo t) => t.id != toDo.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}
