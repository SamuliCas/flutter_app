import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(title: 'Not used now'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String imageUrl =
      'https://picsum.photos/400/600'; // API returns a random cat image

  void _resetCat() {
    setState(
      () {
        imageUrl =
            'https://picsum.photos/400/600/?v=${Random().nextInt(10000000)}'; // sad hack to prevent url (and image) caching
      },
    );
  }
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
                // ListTile(
                //   leading: Icon(Icons.settings),
                //   title: Text('Second Page'),
                //   onTap: (){
                //     Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondPage()));
                      
                //   },
                //   ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map Page'),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MapPage()));
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


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backroundimage.jpeg'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: double.infinity, // max width
              height: MediaQuery.of(context).size.height / 1.7,
              // height: 500, // alternative fixed height
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Colors.amberAccent),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: _resetCat,
                child: Text(
                  "Fetch a new image!",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MySecondPage"),
//         backgroundColor: Colors.amber,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/backroundimage.jpeg'),
//             fit: BoxFit.cover,
//           )
//         ),
//         child: Container(
          
//         )
//       ),
//     );
//   }
// }

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map Page'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(65.0121, 25.4651),
            zoom: 10.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
          ],
        ),
    );
  }
}

