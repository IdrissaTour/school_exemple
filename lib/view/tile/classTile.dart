import 'package:flutter/material.dart';
import 'package:school_exemple/model/classname.dart';

class ClassTile extends StatelessWidget{
  Function(ClassName)onPressed;
  Function(ClassName)onDelete;
  ClassName className;
  ClassTile({required this.onPressed, required this.onDelete, required this.className});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(className.name),
      onTap: (() =>onPressed(className)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (() => onDelete(className)),
      ),
    );
  }
}