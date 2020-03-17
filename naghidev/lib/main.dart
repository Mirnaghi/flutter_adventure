import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[700],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                //backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/naghi.jpg'),
                radius: 100.0,
                ),
                SizedBox(height: 35.0),
                Text(
                  "Mirnaghi Aghazada",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Permanent Marker',

                  ),
                  ),
                Text(
                  "Fullstack developer",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Turrent Road Medium',
                    letterSpacing: 2.5,
                  ) 
                ),
              SizedBox(height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.white),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.phone, size: 25.0, color: Colors.deepPurple),
                  title: Text(
                    "+994 55 360 59 13",
                    style: TextStyle(fontSize: 22.0, color: Colors.deepPurple,),
                  )
                )  
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                color: Colors.white,
                child: ListTile(
                   leading: Icon(Icons.email, size: 25.0, color: Colors.deepPurple),
                   title: Text(
                     "mirnaghi7175@gmail.com",
                     style: TextStyle(fontSize: 22.0, color: Colors.deepPurple,)
                   ),
                   ),
              ),

              RaisedButton(
                color: Colors.white,
                child: Text("Tap to see portfolio", style: TextStyle(color: Colors.purple[700])),
                onPressed: (){launch('https://github.com/Mirnaghi');},
              ),   
            ]
          ),
          ),
        )
    );
  }
}
