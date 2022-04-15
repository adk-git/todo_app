import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/settings/app_theme.dart';
import 'package:todo_app/settings/utils.dart';

class TextWidget extends StatefulWidget {
  final Color color;

  const TextWidget({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final newTodoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    void submit(String? todoDesc, Color? color) {
      if (todoDesc != null && todoDesc.trim().isNotEmpty) {
        context.read<ToDoList>().addTodo(todoDesc, color!);
        newTodoController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
      height: 48 * h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16 * w),
        border: Border.all(
          color: AppTheme.blueColor,
          width: 2 * w,
        ),
      ),
      child: TextField(
        controller: newTodoController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8 * w),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            suffixIcon: GestureDetector(
              onTap: () => submit(
                  newTodoController.text, context.read<ToDoList>().color),
              child: Container(
                height: 80 * h,
                width: 32 * w,
                decoration: BoxDecoration(
                  color: AppTheme.blackColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16 * w),
                    bottomRight: Radius.circular(16 * w),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30 * w,
                ),
              ),
            )),
        onSubmitted: (String? todo) =>
            submit(todo, context.read<ToDoList>().color),
      ),
    );
  }
}
