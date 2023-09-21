import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_exemple/model/inscrit.dart';
import 'package:school_exemple/model/mesSaisies.dart';
import 'package:school_exemple/service/database.dart';


class Inscription extends StatefulWidget{
   final int ClassId;
  Inscription({required this.ClassId});
  @override
  State<StatefulWidget> createState() {
    return InscriptionState();
  }
}


class InscriptionState extends State<Inscription>{
  String? _selectedValue;
 late TextEditingController userId;
   late  TextEditingController namController;
 late TextEditingController EmailController;
  late TextEditingController MotdepassController;
 late TextEditingController ConfirmpassController;
 String? imagePath;

 @override
  void initState() {
    userId = TextEditingController();
   namController = TextEditingController();
    EmailController = TextEditingController();
    MotdepassController = TextEditingController();
   ConfirmpassController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
   userId.dispose();
   namController.dispose();
   EmailController.dispose();
  MotdepassController.dispose();
 ConfirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscriptions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         /*   Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.brown,
              ),
              child: Text("Inscription",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),*/

            Center(
              child:   Card(
                  margin: EdgeInsets.only(top: 20),

                  elevation: 7,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         (imagePath == null)
                         ? const Icon(Icons.camera_alt, size: 70,)
                             : Image.file(File(imagePath!)),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             IconButton(onPressed:(() =>  takeImage(ImageSource.camera)), icon: Icon(Icons.camera_alt)),
                             IconButton(onPressed:(() =>  takeImage(ImageSource.gallery)), icon: Icon(Icons.photo_library_outlined)),
                           ],
                         )
                       ],
                  )
              ),
            ),
            SizedBox(height: 15,),

            Padding(padding: EdgeInsets.all(10),
              child:  Column(
                children: [
                  mesSaisies(controller: userId, hintName: "Identifiant", icon: Icon(Icons.person), ),
                  SizedBox(height: 15,),
                  mesSaisies(controller: namController, hintName: "Nom & Prénom", icon: Icon(Icons.person_add_outlined), ),
                  //mesSaisies("Nom & Prénom", TextInputType.text, Icon(Icons.person), false),
                  SizedBox(height: 15,),
                  mesSaisies(controller: EmailController, hintName: "Email", icon: Icon(Icons.email), type: TextInputType.emailAddress, ),
                  SizedBox(height: 15,),
                 // mesOPtions(), la liste deroulante
                  SizedBox(height: 15,),
                  mesSaisies(controller: MotdepassController, hintName: "Mot de passe ", icon: Icon(Icons.lock), obscure: true, type:TextInputType.visiblePassword ,),
                  SizedBox(height: 15,),
                  mesSaisies(controller: ConfirmpassController, hintName: "Confirmer le mot de passe", icon: Icon(Icons.lock), obscure: true,),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mesButtons(true),
                mesButtons(false),
              ],
            )
          ],
        ),
      ),
    );
  }
  ElevatedButton mesButtons(bool voir){

    return ElevatedButton(onPressed: voir? addInscrit():retour(),
        style: ElevatedButton.styleFrom(
            backgroundColor: voir ? Colors.blueAccent: Colors.brown,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30)
        ),
        child: Text(voir?"Valider" : "Annuler",
          style:TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold) ,)
    );
  }

  DropdownButtonFormField mesOPtions(){

    return DropdownButtonFormField<String>(

      value: _selectedValue,
      items: ['Niveau 1', 'Niveau 2', 'Niveau 3', 'Niveau 4', 'Niveau 5', 'Niveau 6', 'Niveau 7', 'Niveau 8']
          .map((value) => DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ))
          .toList(),
      onChanged: (value) {
        _selectedValue = value;
      },
      focusColor: Colors.grey,
      iconDisabledColor: Colors.grey,
      decoration: InputDecoration(
        iconColor: Colors.grey,
        labelText: 'Classes',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        fillColor: Colors.grey
      ),
    );

  }
  takeImage(ImageSource source) async{
   XFile? xfile = await ImagePicker().pickImage(source: source);
   if(xfile == null) return ;
   setState(() {
     imagePath = xfile!.path;
   });
  }
  addInscrit(){
   FocusScope.of(context).requestFocus(FocusNode());
   if(userId.text.isEmpty) return;
   Map<String, dynamic>map = {"classname": widget.ClassId};
   map['identif'] = userId.text;
   if(namController.text.isNotEmpty) map['name'] = namController.text;
   if(EmailController.text.isNotEmpty) map['email'] = EmailController.text;
     if(imagePath != null) map['image'] = imagePath!;
     if(MotdepassController.text == ConfirmpassController.text) map['motDePass']= MotdepassController.text;
       Inscrit inscrit = Inscrit.fromMap(map);
       DatabaseCl().upsert(inscrit).then((succes) => Navigator.pop(context));


  }
  retour(){
   Navigator.pop(context);
  }
}