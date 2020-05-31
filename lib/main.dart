import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _Hope();
  }
}

class _Hope extends StatefulWidget {
  @override
  Hope createState() => Hope();

}


class Hope extends State<_Hope> {

  String imagen = "1";
  int sonido = 1;
  
  void teclaSound() {
    final audioPlayer = AudioCache();
    audioPlayer.play('sound$sonido.mp3');
  }

  Expanded creaTecla({Color color, int nota}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            sonido = nota;
            imagen = nota.toString();
          });
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    teclaSound();
    // TODO: implement build
    return MaterialApp(
      title: 'Light Saber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Light Saber"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset(
                        'assets/'+imagen+'.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
                creaTecla(color: Colors.red, nota: 1),
                creaTecla(color: Colors.blue, nota: 2),
                creaTecla(color: Colors.yellow, nota: 3),
                creaTecla(color: Colors.purple, nota: 4),
                creaTecla(color: Colors.green, nota: 5),

              ],
            ),
          )
      ),
    );
  }
}
