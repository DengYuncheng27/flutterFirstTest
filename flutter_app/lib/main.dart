import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todos = [];

  int _counter = 0;


  void _incrementCounter() {
    final textEditingController=TextEditingController(); //创建文本控制器
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      showDialog(
          context: context,
          builder: (context) {
            var alertDialog = new AlertDialog(
              title: new Text("Add ToDo List"),
              content: new TextField(
                controller:textEditingController, //将文本控制器绑定到文本输入区域

              ),
              // actions: <Widget>[
              //   new TextField(),
              //   new FlatButton(
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: new Text("确定")),
              // ],
              actions: <Widget>[
                    TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("取消")),
                TextButton(
                    onPressed: () {
                      final todo=textEditingController.text;
                      print(todo);
                      setState(() {
                        todos.add(todo);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("确定"))
              ],
            );
            return alertDialog;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: [
            for(var i=0;i<todos.length;i++)
              Card(
                child:InkWell(
                  onTap:(){
                    setState(() {
                      todos.removeAt(i);
                    });
                  } ,
                  child: Text(
                    todos[i],
                    style:Theme.of(context).textTheme.headline5,
                  ),
                )
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incremeeent',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
