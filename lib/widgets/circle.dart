import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/settings/utils.dart';

class CircleWidget extends StatelessWidget {
  Color selectColor;

  CircleWidget({
    Key? key,
    required this.selectColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);


    return GestureDetector(
      onTap: (){
        context.read<ToDoList>().setColor(selectColor);
      },
      child: Container(
        height: 48 * h,
        width: 48 * w,
        decoration: BoxDecoration(
          color: selectColor,
          borderRadius: BorderRadius.circular(32 * w),
          border: Border.all(width: 2, color: selectColor),
        ),
      ),
    );
  }
}
