import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_exemple/model/classname.dart';
import 'package:school_exemple/service/database.dart';
import 'package:school_exemple/view/pages/mesClass.dart';
import 'package:school_exemple/view/tile/classTile.dart';
import 'package:school_exemple/view/widget/addDialog.dart';

class ListClass extends StatefulWidget{
  @override
  ListCl createState() =>ListCl();
}
class ListCl extends State<ListClass>{
  List<ClassName> items =[];

  @override
  void initState() {
    getAllClass();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
             title: Text("Liste des Classes"),
             actions: [
                      IconButton(onPressed: addNewClass, icon: Icon(Icons.add))
             ],
           ),
           body: ListView.separated(
               itemBuilder: ((context, index){
                 final item = items[index];
                 return ClassTile(
                     onPressed: onPressed,
                     onDelete: onDelete,
                     className: item);
               }),
               separatorBuilder: ((context, index) => Divider()),
               itemCount: items.length
           ),
         );
  }
  getAllClass() async{
    final fromdb = await DatabaseCl().allClassname();
    setState(() {
      items = fromdb;
    });
  }
  onPressed(ClassName className){
   final next = MaterialPageRoute(builder: (context) => MesClasses(className: className));
   Navigator.push(context, next);
  }
  onDelete(ClassName className){
    DatabaseCl().removeClass(className).then((value) => getAllClass());
  }
  addNewClass() async{
    await showDialog(context: context, builder: (context){
      final namcontroller = TextEditingController();


      return addDialog(
          namcontroller: namcontroller,

          onCancel: handlRetour,
          onAdd: ((){
            handlRetour();
            if(namcontroller.text.isEmpty ) return;
            DatabaseCl().addClass(namcontroller.text).then((succes) => getAllClass());

          })
      );
    });
  }
  handlRetour(){
    Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}