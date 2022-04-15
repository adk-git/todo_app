import 'package:flutter/material.dart';
import 'package:todo_app/settings/app_theme.dart';
import 'package:todo_app/settings/utils.dart';
import 'package:todo_app/widgets/circle.dart';
import 'package:todo_app/widgets/create_todo.dart';
import 'package:todo_app/widgets/show_todos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Qaydnoma",
          style: TextStyle(
            color: AppTheme.blackColor,
            fontFamily: AppTheme.fontFamily,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5 * w,
            fontSize: 22 * h,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFf2c94c),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: ShowTodos()),
          SizedBox(height: 12 * h),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16 * w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleWidget(selectColor: AppTheme.greenColor),
                    CircleWidget(selectColor: AppTheme.redColor),
                    CircleWidget(selectColor: AppTheme.yellowColor),
                    CircleWidget(selectColor: AppTheme.purpleColor),
                    CircleWidget(selectColor: AppTheme.orangeColor),
                  ],
                ),
              ),
              const TextWidget(),
            ],
          )
        ],
      ),
    );
  }
}
