class ClassName{
  int id;
  String name;
  String description;

  ClassName(this.id, this.name, this.description);

 ClassName.fromMap(Map<String, dynamic>map):
      id = map["id"],
      name = map["name"],
      description = map["description"];
}