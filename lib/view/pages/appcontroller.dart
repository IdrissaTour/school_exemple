import 'package:flutter/material.dart';
import 'package:school_exemple/view/pages/MenuItem.dart';
import 'package:school_exemple/view/pages/accueil.dart';
import 'package:school_exemple/view/pages/connexion.dart';
import 'package:school_exemple/view/pages/inscription.dart';
import 'package:school_exemple/view/pages/paiement.dart';

class AppCotroller extends StatefulWidget{
  @override
AppControllerState createState() => AppControllerState();
}
class AppControllerState extends State<AppCotroller>{
  int index = 0;
  List<MenuItem> items =[
    MenuItem(name: "Accueil", body: Accueil()),
    MenuItem(name: "Accueil", body: Accueil()),
    //MenuItem(name: "Inscription", body: Inscription()),
    MenuItem(name: "Paiement", body: Paiement()),
    MenuItem(name: "Connexion", body: Connexion()),

  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("G-SCHOOL", style: TextStyle(color: Colors.brown,fontSize: 30),),
      centerTitle:true,
    ),
    drawer: Drawer(
      child: ListView.builder(
          itemCount: items.length ,
          itemBuilder: (context, index){
          return  (index == 0)
                ? headerDra()
                :monLisTileindex(index);
          }
      ),
    ),
    body: items[index].body
  );
  }
  ListTile monLisTileindex (int index){
    final int monidex = index;
    final MenuItem item = items[index];
    final String name = item.name;
    return ListTile(
      title:Text(name) ,
      onTap: (){
        setState(() {
        this.index = monidex;
        Navigator.pop(context);
        });
      },
    );
  }
  DrawerHeader headerDra (){
    return DrawerHeader(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             const Icon(Icons.school),
             const Text("G-SCHOOL", style: TextStyle(color: Colors.brown,fontSize: 20),)
            ],
          ),
        )
    );
  }
}