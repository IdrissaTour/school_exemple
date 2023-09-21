class Inscrit{
  int id;
  String identif;
  String name;
  String email;
  String image;
  String motDePass;
  int classname;

  Inscrit(this.id, this.name, this.email, this.image, this.motDePass, this.identif, this.classname);

  Inscrit.fromMap(Map<String, dynamic>map):
      id = map['id'],
      identif= map['identif'],
      name = map['name'],
      email = map['email'],
      image = map['image'],
      motDePass = map['motDePass'],
       classname = map['classname'];

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map ={
  'identif' : identif,
  'name' : name,
  'email' : email,
  'image' : image,
  'motDePass' : motDePass,
  'classname' : classname,
    };
    if(id != null) map["id"] = id;
    return map;
  }

}