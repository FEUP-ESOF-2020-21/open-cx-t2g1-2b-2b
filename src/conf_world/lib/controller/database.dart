import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/conference_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  var conferences = <ConferenceModel>[];

  bool _onCreate = false;
  Database db; //sqlite db

  static final DatabaseHelper _singleton = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _singleton;
  }

  DatabaseHelper._internal() {
    _loadDb();
  }

  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/conferences.json");
  }

  void _loadDb() async {
    await initDatabase();

    if(_onCreate) {
      String rd = await _loadFromAsset();

      List<dynamic> userMap = jsonDecode(rd);

      for (var i = 0; i < userMap.length; i++) {
        insertDb(ConferenceModel.fromJson(userMap[i]));
      }
    }

    this.conferences = await getAllTask();
  }

  Future<void> initDatabase() async{
    db = await openDatabase(
        join(await getDatabasesPath(), "conferencesda.db"),
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE Conference("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "name VARCHAR(255),"
              "type VARCHAR(255),"
              "submitPaper VARCHAR(255),"
              "date VARCHAR(255),"
              "description VARCHAR(255),"
              "latitude INTEGER,"
              "longitude INTEGER,"
              "url VARCHAR(255),"
              "saved INTEGER"
              ")");

          _onCreate = true;
        },
        version: 1
    );
  }

  Future<void> insertDb(ConferenceModel conf) async{
    try{
      db.insert("Conference", conf.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(_){
      print(_);
    }
  }

  Future<void> updateSaved(ConferenceModel conf) async {
    await db.update(
      'Conference',
      conf.toJson(),
      where: "id = ?",
      whereArgs: [conf.id], // Pass the id as a whereArg to prevent SQL injection.
    );
  }

  Future<List<ConferenceModel>> getAllTask() async{
    final List<Map<String, dynamic>> tasks = await db.query("Conference");

    return List.generate(tasks.length, (i) {
      return ConferenceModel(id: tasks[i]["id"], name: tasks[i]["name"], type:tasks[i]["type"], date:tasks[i]["date"], submitPaper: tasks[i]["submitPaper"], description: tasks[i]["description"], latitude: tasks[i]["latitude"], longitude: tasks[i]["longitude"], url:tasks[i]["url"], saved: tasks[i]["saved"]);
    });
  }

  getAllConfs() {
    return conferences;
  }
}