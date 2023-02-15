import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyHomePage"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [ const  
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
                  onTap: (){
                    Navigator.pop(context);
                      
                  },
                  ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Mail'),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondPage()));
                    },
                  ),
                  AboutListTile(
                    icon: Icon(
                      Icons.info,
                    ),
                    child: Text('About App'),
                    applicationIcon: Icon(
                      Icons.local_play,
                      ),
                      applicationName: 'My App',
                      applicationVersion: '1.0.25',
                      applicationLegalese: '© 2023 Company',
                      aboutBoxChildren: [
                        
                      ],
                  )
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
      appBar: AppBar(
        title: Text("MySecondPage"),
      ),
    );
  }
}
