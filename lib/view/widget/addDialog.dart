import 'package:flutter/material.dart';

class addDialog extends StatelessWidget{
  final TextEditingController namcontroller;

  VoidCallback onAdd;
  VoidCallback onCancel;
  addDialog({required this.namcontroller, required this.onCancel, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ajouter une classe"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
           controller: namcontroller,
            decoration: InputDecoration(
              hintText: "Ajouter le nom de la classe"
            ),
          ),
          /*  TextField(
            controller: descriptontroller,
            decoration: InputDecoration(
                hintText: "Ajouter une description"
            ),
          ),*/
        ],
      ),
      actions: [
        TextButton(onPressed: onAdd, child: Text("Valider")),
        TextButton(onPressed: onCancel, child: Text("Annuler")),
      ],
    );
  }
}