import 'dart:io';

import 'package:flutter/material.dart';
import 'package:school_exemple/model/inscrit.dart';
import 'package:school_exemple/view/pages/detailEleve.dart';

class InscritTile extends StatelessWidget{
  Inscrit inscrit;
  InscritTile({required this.inscrit});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return InkWell(
     child: Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         if(inscrit.image != null) Container(
           height: size.height/7,
           child: Image.file(File(inscrit.image)),
           padding: EdgeInsets.all(10),
         ),
         Text(
            "Matricule: ${inscrit.identif}", style: TextStyle(fontSize: 25)),
         Text(
            "Nom & Prénom : ${inscrit.name}", style:  TextStyle(fontSize: 25),),
       ],
     ),
     onTap: (){
       final bien = MaterialPageRoute(builder: (context) => DetailEeleve());
       Navigator.push(context, bien);
     } ,
   );
  }
}