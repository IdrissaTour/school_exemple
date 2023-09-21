import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_exemple/model/mesSaisies.dart';

class Connexion extends StatelessWidget {
  final namController = TextEditingController();
  final MotdepassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(12)),
              Card(
                margin: EdgeInsets.all(20),
                elevation: 5,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/etude.png"),
                  radius: 100,
                ),
              ),
              Padding(padding: EdgeInsets.all(12)),
          mesSaisies(controller: namController, hintName: "Identifiant", icon: Icon(Icons.person), ),
              SizedBox(height: 15,),
              mesSaisies(controller: MotdepassController, hintName: "Mot de passe", icon: Icon(Icons.lock), obscure: true,),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed:(){},
                      child: Text("Mot de passe oublié?",)),
                ],
              ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.all(10),

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 70),
                        side: BorderSide(
                            style: BorderStyle.solid
                        )
                    ),
                    onPressed: (){}, child: Text("LOGIN",
                    style: TextStyle(
                        fontSize: 25
                    ),

                  ),

                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                  ),
                )


              

            ],
          ),
        ),
      )

    );
  }
  ElevatedButton mesButtons(bool voir){

    return ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
            backgroundColor: voir ? Colors.blueAccent: Colors.brown,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30)
        ),
        child: Text(voir?"Valider" : "Annuler",
          style:TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold) ,)
    );
  }


}