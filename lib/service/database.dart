import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:school_exemple/model/classname.dart';
import 'package:school_exemple/model/inscrit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseCl{
Database? _database;
Future<Database> get database async{
  if(_database != null) return _database!;
  return creaDatabase();
}
Future<Database>  creaDatabase() async{
  Directory directory = await getApplicationDocumentsDirectory();
  final path = join(directory.path, "database.db");
  return await openDatabase(path, version: 1, onCreate: OnCreate);
}
OnCreate(Database database, int version) async{
  //  Table 1
  await database.execute('''
  CREATE TABLE classname(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT 
  )
    ''');

  // Table 2
  await database.execute('''
  CREATE TABLE inscrit(
  id INTEGER PRIMARY KEY,
  identif TEXT NOT NULL,
  name TEXT,
  email TEXT,
  image TEXT ,
  motDePass TEXT,
  classname INTEGER
  )
  ''');
}

// get information
Future<List<ClassName>> allClassname() async{
  Database db = await database;
  const query = 'SELECT * FROM classname';
  List<Map<String, dynamic>> mapList = await db.rawQuery(query);
  return mapList.map((map) => ClassName.fromMap(map)).toList();
}

Future<List<Inscrit>> inscritFromId(int id) async{
  Database db = await database;
  List<Map<String, dynamic>> mapList = await db.query('inscrit', where: 'classname =?', whereArgs: [id]);
  return mapList.map((map) => Inscrit.fromMap(map)).toList();
}
// ajout des ssonnes

Future<bool> addClass(String text) async{
  Database db = await database;
  await db.insert('classname', {'name': text, 'description':text}, );
  return true;
}
Future<bool> upsert(Inscrit inscrit) async{
  Database db = await database;
  (inscrit.id == null)
  ? inscrit.id = await db.insert('inscrit', inscrit.toMap())
      :inscrit.id = await db.update('inscrit', inscrit.toMap(), where: 'id =?', whereArgs: [inscrit.id]);
  return true;
}
Future<bool> removeClass(ClassName className) async{
  Database db = await database;
  await db.delete('classname', where: 'id =?', whereArgs: [className.id]);
  await db.delete('inscrit', where: 'classname =?', whereArgs: [className.id]);
  return true;
}

}