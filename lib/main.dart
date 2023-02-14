import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyHomePage"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget> [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Text('Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    ),
                  ),
               ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Mail'),
                  ),
                ],
              ),
            ),

        body: Center(
          child: TextButton(
            child: Text('SecondPage'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage();
            }
          )),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
