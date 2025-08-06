import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp2/data/database.dart';
import 'package:todoapp2/utilits/dialog_box.dart';
import 'package:todoapp2/utilits/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');
  // database
  ToDoDatabase db =ToDoDatabase();

  @override
  void initState() {
    // if its the 1st time open the app
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
    //   if theres already a data
      db.loadData();
    }
    super.initState();
  }


  // text controller
  final _controller = TextEditingController();
  // list of todo tasks
  // List toDoList= [
  //    [ "Makeup Tutorial",false,],
  //    [ "todo work",false,]
  //  ];

  // chex box
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];

    });
    db.updateDatabase();
  }
  // save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }
  // delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


  // create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
          onSave: saveNewTask,
          onCancel:()=> Navigator.of(context).pop(),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Center(child: Text("To Do")),
          backgroundColor: Colors.yellow,
          elevation: 0,
        ),
      floatingActionButton: FloatingActionButton(
          onPressed:createNewTask,
          backgroundColor: Colors.yellow,
      child: Icon(Icons.add),),
      body: ListView.builder(
       itemCount: db.toDoList.length,
        itemBuilder: (context,index){
         return ToDoTile(
             taskName:db.toDoList[index][0] ,
             taskCompleted: db.toDoList[index][1],
             onChanged: (value)=> checkBoxChanged(value,index),
           deleteFunction: (context) => deleteTask(index),
         );
        },
      ),
      );
  }
}
