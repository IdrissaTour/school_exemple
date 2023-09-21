


import 'package:flutter/material.dart';
import 'package:school_exemple/view/pages/connexion.dart';
import 'package:school_exemple/view/pages/inscription.dart';
import 'package:school_exemple/view/pages/listClass.dart';

class Accueil extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Stack(
     alignment: Alignment.center,
     children: [
       Container(
         height: size.height,
         width: size.width,
         child: Image.asset("images/rtm.jpg",fit: BoxFit.cover,),
       ),
       Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

         children: [

          Container(
             decoration:BoxDecoration(
               color: Colors.white.withOpacity(0.75),
               borderRadius: BorderRadius.circular(25)
             ),
             margin: EdgeInsets.only(top: 3),
             padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
             child: Text("Accueil",
               style: TextStyle(fontSize: 35, color: Colors.brown, fontWeight: FontWeight.bold
               ),),
           ),

              Padding(padding: EdgeInsets.all(10),),
               Container(
                // padding: EdgeInsets.only(top: 15, right: 50),
                 child: Column(
                   children: [
                     mesButtons(true, context),
                     SizedBox(height: 20,),
                     mesButtons(false, context)
              ],
            ),

    )
    ]
    )
     ]
   )
    ;
  }
  ElevatedButton mesButtons(bool verfier, BuildContext context ){
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
       backgroundColor: verfier ? Colors.lightGreen: Colors.brown,
       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100)
      ),
        onPressed: (){
         verfier
             ? Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx) {
               return Connexion();
         })) : Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx) {
    return ListClass();
         })

         );
        },

        child: Text(verfier ? "Connexion":"Inscription",
        style: TextStyle(color: verfier? Colors.white:Colors.white,
            fontWeight:FontWeight.bold, fontSize: 25 ),
        ));
  }


}