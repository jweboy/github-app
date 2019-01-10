import 'package:flutter/material.dart';

class Todo {
  const Todo({ this.id, this.text });
  final String text;
  final String id;
}

class TodoList extends StatefulWidget{
  // @override
  // Widget build(BuildContext context) {
  //   return null;
  // }
  @override
  State<StatefulWidget> createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<TodoList>{
  // final todos = const <Todo> [
  //   const Todo(id: 'key1', text: '测试数据1'),
  //   const Todo(id: 'key2', text: '测试数据2'),
  //   const Todo(id: 'key3', text: '测试数据3'),
  //   const Todo(id: 'key4', text: '测试数据4'),
  //   const Todo(id: 'key5', text: '测试数据5'),
  //   const Todo(id: 'key6', text: '测试数据6'),
  //   const Todo(id: 'key7', text: '测试数据7'),
  // ];

  final List<String> _todos = new List<String>.generate(30, (int i) => "Items ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, int index) {
        final todo = _todos[index];
        return Dismissible(
          key: new Key(todo), 
          onDismissed: (direction) {
            _todos.removeAt(index);
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("Item dismissed~~")
            ));
          },
          child: new ListTile(
            title: new Text("$todo"),
          ),
          background: new Container(
            color: Colors.red,
          ),
        );
      },
    );
  }
}