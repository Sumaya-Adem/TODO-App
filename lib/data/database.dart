import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  final _myBox = Hive.box('mybox');

  List toDoList = [];

  void createInitialData(){
    // if it the first time for the App

    toDoList=[
      ["Make Tutorial", false],
      ["Do Exercise", false]
    ];
  }
//   load the data
 void loadData(){
   toDoList = _myBox.get("TODOLIST") ?? [] ;
 }
// updating the data
 void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
 }

}