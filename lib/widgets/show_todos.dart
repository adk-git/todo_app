import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/settings/app_theme.dart';
import 'package:todo_app/settings/utils.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    final todos = context.watch<ToDoList>().state.todos;
    return ListView.separated(
      itemCount: todos.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(todos[index].id),
          onDismissed: (_){
            context.read<ToDoList>().removeTodo(todos[index]);
          },
          child: Container(
            height: 42 * h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 8 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16 * w),
              color: Colors.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 22 * h,
                  width: 22 * w,
                  margin: EdgeInsets.only(left: 16 * w),
                  decoration: BoxDecoration(
                    color: todos[index].selectColor,
                    borderRadius: BorderRadius.circular(8 * w),
                  ),
                ),
                Text(
                  todos[index].desc,
                  style: TextStyle(
                      color: AppTheme.blackColor,
                      fontSize: 16 * h,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5 * w,
                      fontFamily: AppTheme.fontFamily),
                ),
                Container(
                  height: 42 * h,
                  width: 32 * w,
                  decoration: BoxDecoration(
                    color: AppTheme.greenColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(16 * w),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
