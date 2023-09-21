import 'package:flutter/material.dart';
import 'package:school_exemple/model/classname.dart';
import 'package:school_exemple/model/inscrit.dart';
import 'package:school_exemple/service/database.dart';
import 'package:school_exemple/view/pages/inscription.dart';
import 'package:school_exemple/view/tile/inscriTile.dart';


class MesClasses extends StatefulWidget{
  ClassName className;
  MesClasses({required this.className});
  @override
  MesClass createState() => MesClass();
}
class MesClass extends State<MesClasses>{
  List<Inscrit> inscrit = [];
  @override
  void initState() {
    getInscrit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Liste de ${widget.className.name}") ,
        actions: [
          TextButton(onPressed: inscript, child: Text("Nouveau", style: TextStyle(fontSize: 20, color: Colors.white),))
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: ((context, index) => InscritTile(inscrit: inscrit[index])),
          itemCount: inscrit.length,
      ),
    );
  }
  getInscrit() async{
    await DatabaseCl().inscritFromId(widget.className.id).then((inscrits) {
      setState(() {
        this.inscrit = inscrits;
      });
    });
  }
  inscript(){
    final route = MaterialPageRoute(builder: (context) => Inscription(ClassId: widget.className.id));
    Navigator.push(context, route);

  }
}