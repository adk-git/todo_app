import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';


Uuid uuid = const Uuid();

class ToDo extends Equatable{
  final String id;
  final String desc;
  final Color selectColor;

  ToDo({
    String? id,
    required this.desc,
    required this.selectColor,
}) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, selectColor];

  @override
  bool get stringify => true;
}
